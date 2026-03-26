#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
state_dir="${AUTO_SYNC_STATE_DIR:-$repo_root/.autosync-state}"
log_file="$state_dir/auto-sync.log"
lock_file="$state_dir/watch.lock"
pid_file="$state_dir/watch.pid"
debounce_seconds="${AUTO_SYNC_DEBOUNCE_SECONDS:-2}"
remote_name="${AUTO_SYNC_REMOTE:-origin}"
repo_name="$(basename "$repo_root")"
unit_name="${AUTO_SYNC_UNIT_NAME:-${repo_name}-auto-sync.service}"
unit_file="$state_dir/$unit_name"

mkdir -p "$state_dir"

log() {
  local ts
  ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  printf '[%s] %s\n' "$ts" "$*" | tee -a "$log_file"
}

die() {
  printf 'error: %s\n' "$*" >&2
  exit 1
}

current_branch() {
  git -C "$repo_root" branch --show-current
}

branch_name="${AUTO_SYNC_BRANCH:-$(current_branch)}"

usage() {
  cat <<EOF
Usage: $(basename "$0") <watch|sync-once|status|stop|install-user-service|uninstall-user-service|service-status|service-logs>

Commands:
  watch      Start an inotify-based watcher and auto-push on file changes
  sync-once  Stage, commit, and push current changes once
  status     Show watcher status and recent log tail
  stop       Stop the running watcher
  install-user-service    Render and enable a systemd --user watcher service
  uninstall-user-service  Disable the systemd --user watcher service
  service-status          Show systemd --user service status
  service-logs            Show recent journal lines for the systemd --user service

Environment:
  AUTO_SYNC_DEBOUNCE_SECONDS  Quiet period before a sync, default: 2
  AUTO_SYNC_REMOTE            Git remote to push to, default: origin
  AUTO_SYNC_BRANCH            Branch to push, default: current branch
  AUTO_SYNC_STATE_DIR         State directory, default: .autosync-state
  AUTO_SYNC_UNIT_NAME         systemd --user unit name, default: <repo>-auto-sync.service
EOF
}

require_tools() {
  command -v git >/dev/null 2>&1 || die "git is required"
  command -v inotifywait >/dev/null 2>&1 || die "inotifywait is required"
}

require_git() {
  command -v git >/dev/null 2>&1 || die "git is required"
}

require_systemctl() {
  command -v systemctl >/dev/null 2>&1 || die "systemctl is required"
}

require_repo() {
  git -C "$repo_root" rev-parse --is-inside-work-tree >/dev/null 2>&1 || die "not a git repo: $repo_root"
  git -C "$repo_root" remote get-url "$remote_name" >/dev/null 2>&1 || die "missing remote: $remote_name"
}

systemd_user_available() {
  command -v systemctl >/dev/null 2>&1 && systemctl --user show-environment >/dev/null 2>&1
}

require_systemd_user() {
  require_systemctl
  systemd_user_available || die "systemd --user bus is unavailable; run inside a user login session"
}

require_safe_unit_paths() {
  if [[ "$repo_root" =~ [[:space:]] ]]; then
    die "repo path contains spaces and cannot be embedded safely in ExecStart: $repo_root"
  fi

  if [[ "$script_dir" =~ [[:space:]] ]]; then
    die "script path contains spaces and cannot be embedded safely in ExecStart: $script_dir"
  fi
}

build_commit_message() {
  local ts count preview extra
  ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  mapfile -t staged_files < <(git -C "$repo_root" diff --cached --name-only)
  count="${#staged_files[@]}"
  preview=""
  if (( count > 0 )); then
    preview="$(printf '%s, ' "${staged_files[@]:0:3}")"
    preview="${preview%, }"
  fi
  if (( count > 3 )); then
    extra=$((count - 3))
    preview="$preview, +$extra more"
  fi
  printf 'auto-sync: %s [%s]' "$ts" "${preview:-repo update}"
}

ensure_fast_forward_base() {
  if ! git -C "$repo_root" fetch "$remote_name" "$branch_name" >>"$log_file" 2>&1; then
    log "failed to fetch $remote_name/$branch_name; check network or credentials"
    return 1
  fi

  local local_sha remote_sha base_sha
  local_sha="$(git -C "$repo_root" rev-parse HEAD)"
  remote_sha="$(git -C "$repo_root" rev-parse "$remote_name/$branch_name")"
  base_sha="$(git -C "$repo_root" merge-base HEAD "$remote_name/$branch_name")"

  if [[ "$local_sha" == "$remote_sha" ]]; then
    return 0
  fi

  if [[ "$base_sha" == "$local_sha" ]]; then
    git -C "$repo_root" merge --ff-only "$remote_name/$branch_name" >/dev/null
    log "fast-forwarded local branch to $remote_name/$branch_name"
    return 0
  fi

  log "remote branch diverged; manual pull/rebase required before auto-sync can continue"
  return 1
}

render_user_service_unit() {
  require_safe_unit_paths

  cat >"$unit_file" <<EOF
[Unit]
Description=Auto-sync git changes for $repo_name
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
WorkingDirectory=$repo_root
Environment=AUTO_SYNC_STATE_DIR=$state_dir
Environment=AUTO_SYNC_DEBOUNCE_SECONDS=$debounce_seconds
Environment=AUTO_SYNC_REMOTE=$remote_name
Environment=AUTO_SYNC_BRANCH=$branch_name
ExecStart=$script_dir/auto-sync.sh watch
Restart=on-failure
RestartSec=3

[Install]
WantedBy=default.target
EOF
}

install_user_service() {
  require_repo
  require_systemd_user

  render_user_service_unit
  systemctl --user daemon-reload
  systemctl --user enable --now "$unit_file" >/dev/null
  log "enabled systemd --user service: $unit_name"
}

uninstall_user_service() {
  require_systemd_user

  systemctl --user disable --now "$unit_name" >/dev/null 2>&1 || true
  systemctl --user reset-failed "$unit_name" >/dev/null 2>&1 || true
  rm -f "$unit_file"
  systemctl --user daemon-reload
  log "disabled systemd --user service: $unit_name"
}

sync_once() {
  require_repo

  if ! ensure_fast_forward_base; then
    return 1
  fi

  git -C "$repo_root" add -A
  if git -C "$repo_root" diff --cached --quiet; then
    log "no changes to sync"
    return 0
  fi

  local message
  message="$(build_commit_message)"
  git -C "$repo_root" commit -m "$message" >/dev/null
  git -C "$repo_root" push "$remote_name" "HEAD:$branch_name" >/dev/null
  log "pushed commit: $message"
}

wait_for_event() {
  inotifywait \
    --quiet \
    --recursive \
    --event close_write,create,move,delete,attrib \
    --exclude '(^|/)(\.git|\.autosync-state)(/|$)' \
    "$repo_root"
}

watch_loop() {
  require_tools
  require_repo

  exec 9>"$lock_file"
  if ! flock -n 9; then
    die "watcher already running; use status or stop"
  fi

  echo "$$" >"$pid_file"
  trap 'rm -f "$pid_file"' EXIT INT TERM

  log "watching $repo_root with debounce ${debounce_seconds}s"
  while true; do
    wait_for_event >/dev/null 2>&1 || continue
    log "change detected; waiting for quiet period"
    while inotifywait \
      --quiet \
      --timeout "$debounce_seconds" \
      --recursive \
      --event close_write,create,move,delete,attrib \
      --exclude '(^|/)(\.git|\.autosync-state)(/|$)' \
      "$repo_root" >/dev/null 2>&1; do
      :
    done

    if ! sync_once; then
      log "auto-sync failed; watcher stays alive for the next change"
    fi
  done
}

show_status() {
  if command -v systemctl >/dev/null 2>&1; then
    if systemd_user_available; then
      local active enabled
      active="$(systemctl --user is-active "$unit_name" 2>/dev/null || true)"
      enabled="$(systemctl --user is-enabled "$unit_name" 2>/dev/null || true)"
      printf 'user service: %s (%s)\n' "${active:-unknown}" "${enabled:-unknown}"
    else
      printf 'user service: unavailable in current session\n'
    fi
  fi

  if [[ -f "$pid_file" ]]; then
    local pid
    pid="$(cat "$pid_file")"
    if kill -0 "$pid" >/dev/null 2>&1; then
      printf 'watcher: running (pid %s)\n' "$pid"
    else
      printf 'watcher: stale pid file (%s)\n' "$pid"
    fi
  else
    printf 'watcher: not running\n'
  fi

  if [[ -f "$log_file" ]]; then
    printf '\nrecent log:\n'
    tail -n 10 "$log_file"
  fi
}

stop_watcher() {
  if systemd_user_available && systemctl --user is-active --quiet "$unit_name"; then
    systemctl --user stop "$unit_name"
    log "stopped systemd --user service: $unit_name"
    return 0
  fi

  [[ -f "$pid_file" ]] || die "watcher is not running"
  local pid
  pid="$(cat "$pid_file")"
  kill "$pid"
  rm -f "$pid_file"
  log "stopped watcher pid $pid"
}

service_status() {
  require_systemd_user
  systemctl --user --no-pager --full status "$unit_name"
}

service_logs() {
  require_systemd_user
  journalctl --user -u "$unit_name" -n "${AUTO_SYNC_JOURNAL_LINES:-50}" --no-pager
}

cmd="${1:-}"
case "$cmd" in
  watch)
    watch_loop
    ;;
  sync-once)
    require_git
    sync_once
    ;;
  status)
    show_status
    ;;
  stop)
    stop_watcher
    ;;
  install-user-service)
    install_user_service
    ;;
  uninstall-user-service)
    uninstall_user_service
    ;;
  service-status)
    service_status
    ;;
  service-logs)
    service_logs
    ;;
  *)
    usage
    exit 1
    ;;
esac
