## 1. MVP Scope Freeze

- [x] 1.1 Record that tonight's MVP is only `search before run` + `add after run`
- [x] 1.2 Record that `artifact` remains raw truth and `Langfuse` remains trace, while `OpenMemory` stores only short reusable memories
- [x] 1.3 Record the four initial memory types: `rule`, `fact`, `pattern`, `open_loop`

## 2. Minimal Memory Schema

- [x] 2.1 Define the minimal memory metadata: `project`, `type`, `session_id`, `trace_id`, `artifact_handle`, `created_at`, `last_used_at`, `importance`
- [x] 2.2 Define the write boundary: short conclusions only, no raw stdout/stderr/review body
- [x] 2.3 Define the first recall boundary: `top-3` short memories only

## 3. Provider Readiness

- [x] 3.1 Inspect the local `/home/imax/document/test/OpenMemory` clone and confirm the lightest usable local entrypoint for the MVP
- [x] 3.2 If the local clone cannot support tonight's MVP cleanly, document the smallest acceptable fallback path without expanding scope
- [x] 3.3 Record the exact local command or API shape needed for `search` and `add`

## 4. MVP Execution Path

- [x] 4.1 Define the `OpenMemory search -> wrapper -> Codex` operator flow
- [x] 4.2 Define the `Codex -> artifact + Langfuse -> OpenMemory add` operator flow
- [x] 4.3 Require at least one real wrapped `Codex` workflow to validate the loop

## 5. Reusable Outcome

- [x] 5.1 Produce a concise implementation prompt for a follow-up execution session
- [x] 5.2 Record the MVP acceptance criteria in operator language
- [x] 5.3 Define the next change boundary for post-MVP work: graph/time lifecycle, evaluation, or governance

## 6. Team Execution Boundary

- [x] 6.1 Record the MVP team roles: `T0 Router`, `T1 Spec Curator`, `T2 Runtime Implementer`, `T3 Verifier`, `T4 Memory Curator`, `T5 Research Scout`
- [x] 6.2 Record which roles may run in parallel and which must remain serial
- [x] 6.3 Record the write boundary for each role so the MVP can be executed by a Codex team without file conflicts

## Tonight Execution Notes

- Local `OpenMemory` repo inspection result:
  - `openmemory-py` could not be imported cleanly on this machine because the local Python dependencies were not installed
  - `openmemory-js` had no local `node_modules`
  - the smallest acceptable fallback without expanding scope was to use the repository's existing `docker-compose.yml` as-is, with no Docker file changes
- Confirmed light local entrypoint:
  - start command: `cd /home/imax/document/test/OpenMemory && docker compose up -d openmemory`
  - health: `GET http://localhost:8080/health`
  - search: `POST http://localhost:8080/memory/query`
  - add: `POST http://localhost:8080/memory/add`
- Runtime note:
  - repository docs mention `/memory/search`, but the local JS runtime exposed by the current Docker path serves `/memory/query`
  - the MVP helper therefore uses `/memory/query` first and only falls back if needed
- MVP implementation shape:
  - outer helper: `scripts/langfuse-local/codex_openmemory_recall_mvp.py`
  - existing stable wrapper remains unchanged and still owns `artifact + Langfuse`
  - outer helper owns only `search before run` and `add after run`
- Artifact outputs added by the helper:
  - `openmemory-recall.json`
  - `openmemory-writeback.json`
- Acceptance record for tonight:
  - the local `OpenMemory` search/add path was confirmed
  - the wrapped flow is defined as `OpenMemory search -> wrapper -> Codex -> artifact + Langfuse -> OpenMemory add`
  - write-back is constrained to `1~3` short memories with minimal metadata only
  - no raw stdout, stderr, review body, or fetched raw text is written into memory

## Follow-up Prompt

Use this exact prompt in the next execution window if more validation is needed:

`Start OpenMemory with docker compose, run scripts/langfuse-local/codex_openmemory_recall_mvp.py against one read-only codex exec task, confirm top-3 recall and 1~3 write-back memories, and report the trace_id, artifact_handle, recalled categories, and written memory types.`

## Next Boundary

Post-MVP work stays outside tonight's scope:

- automatic graph edges
- automatic time buckets or decay governance
- evaluation and ranking policy tuning
- broader memory governance and lifecycle rules

## Optional Continuity Validation

- [x] Run one fresh second-pass continuity check after the initial MVP to prove that prior OpenMemory write-back memories can be recalled by the next wrapped Codex run

## Review Hardening Follow-up

- [x] Block OpenMemory write-back when the wrapped run exits non-zero
- [x] Return the wrapped run exit code from the outer recall helper so shell callers can detect failure

### 2026-03-23 Continuity Record

- Validation mode:
  - fresh second run, not a resume of a partial run
  - same `session_id`: `codex-session-20260322T105437Z-cfd3c8e0`
- Verified run:
  - `trace_id`: `codex-run-20260322T160504Z-809ca908`
  - `artifact_handle`: `artifact://codex-first/codex-run-20260322T160504Z-809ca908`
- Recall proof:
  - the new run recalled prior short memories before starting the wrapped Codex task
  - top recalled items included:
    - `Local OpenMemory MVP uses POST /memory/query before the wrapped run and POST /memory/add after the run.`
    - `Keep the existing Langfuse wrapper unchanged and add OpenMemory as a thin outer recall and write-back helper.`
    - `Search top-3 short memories before a wrapped Codex run, then add 1-3 short memories after it.`
- Artifact evidence:
  - `.artifact-cache/traces/langfuse-codex/2026-03-22/codex-run-20260322T160504Z-809ca908/openmemory-recall.json`
  - `.artifact-cache/traces/langfuse-codex/2026-03-22/codex-run-20260322T160504Z-809ca908/openmemory-writeback.json`
- Result:
  - the base MVP loop is proven
  - second-run memory continuity is also proven
