## Context

The current workspace has many OpenSpec changes across implementation, governance, research, and backlog planning. The user prefers remembering the system as a small number of layers and mainlines, not as a long flat list of change names. The current pain is not lack of planning artifacts; it is that the operator-facing surface is too wide.

The user has stated clear working preferences:

- Use `主线优先` as the default view.
- Use hard reminders instead of soft suggestions when overload thresholds are crossed.
- Run discipline checks before opening a new change, at day end, and as a weekly review.
- Avoid long enumerations and full names unless drilling into detail.
- Protect against distraction into new research threads before current work is closed out.

This design treats the problem as an operator-surface governance problem, not a taxonomy-only problem.

## Goals / Non-Goals

**Goals:**
- Bound the number of changes that appear in the operator-facing active surface.
- Separate `active`, `pending-continue`, `backlog`, and `archive-queue` so they are not mixed in one flat summary.
- Add hard gates that force cleanup before new change creation when thresholds are exceeded.
- Add a repeatable daily closeout and weekly overview rhythm.
- Preserve a concise, mainline-first summary format.

**Non-Goals:**
- Do not rename every existing change.
- Do not automatically archive changes without operator review.
- Do not convert all research items into implementation changes.
- Do not turn this into a heavy project-management system.

## Decisions

### Decision: Introduce four execution lanes

The governance model will use four lanes:

- `active`: changes the operator is willing to touch in the next few sessions; this is the only default execution surface.
- `pending-continue`: paused changes that are still likely to resume, but are not part of the current active surface.
- `backlog`: not-yet-started, research-first, or speculative items that should not compete with active execution.
- `archive-queue`: fully completed changes that still need archive closure.

Why this over a single in-progress list:
- A flat in-progress list turns paused, speculative, and completed work into equal visual weight.
- The user already thinks in terms of `主线 / 噪音 / 待继续`; the lane model matches that mental model.

### Decision: Use hard gates only on overload signals

The change-opening discipline will check three overload signals:

- `archive-queue > 5`
- `active > 7`
- `2 consecutive days without closeout`

If none are triggered, opening a new change remains lightweight.
If any are triggered, the operator must first run the bounded review and either archive completed work, demote changes into `pending-continue`, or keep the new work in `backlog`.

Why this over always-blocking workflow:
- The user wants hard reminders, but not a permanently heavy workflow.
- Threshold-triggered hard gates target the moments when the system is already drifting.

### Decision: Make the default view mainline-first, not inventory-first

The primary summary should show:

1. current mainline
2. active count
3. archive-queue count
4. pending-continue count
5. backlog count

Long change-name inventories move to secondary views.

Why this over full inventory dashboards:
- The user loses focus when the first thing visible is a long list.
- Mainline-first summaries reinforce execution order.

### Decision: Add a weekly overview as the compliance anchor

The weekly review produces a one-page overview containing:

- mainline tree
- current active surface
- archive queue
- pending-continue queue
- backlog counts
- top risks or drifts

Why this over daily-only discipline:
- Daily closeout prevents drift.
- Weekly overview restores strategic orientation and makes the user more likely to honor the mainline.

## Risks / Trade-offs

- [Risk] Manual classification becomes stale. → Mitigation: review lanes during daily closeout and before opening a new change.
- [Risk] Too many items remain in `pending-continue`, becoming a second backlog. → Mitigation: weekly review must either promote back to active, demote to backlog, or close.
- [Risk] Hard gates feel annoying and get ignored. → Mitigation: keep gates threshold-based and require only bounded cleanup, not full project re-planning.
- [Risk] Research items keep leaking into active surface. → Mitigation: explicitly classify research-first items into backlog unless they have a near-term implementation slot.

## Migration Plan

1. Classify current changes into `active`, `pending-continue`, `backlog`, and `archive-queue`.
2. Build the concise mainline-first summary from those lanes.
3. Apply the thresholds to the current workspace and identify whether the hard gate is currently triggered.
4. Start using the daily closeout note and weekly overview note.
5. After one weekly cycle, tune the thresholds or view shapes if they are still too noisy.

## Open Questions

- Should the hard gate remain a manual checklist only, or also become a helper script before `openspec new change`?
- Should `pending-continue` have a size cap of its own, or only be governed in weekly review?
- Should research-only items stay in the same repo view, or move into a separate backlog artifact later?
