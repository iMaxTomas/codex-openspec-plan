## 1. Governance Scope

- [x] 1.1 Define the governed memory layers and their authority mapping to the current stack
- [x] 1.2 Define which write paths are authoritative for `canonical`, `durable`, `session`, `observation`, and `evidence`
- [x] 1.3 Define the mapping from current MVP memory types (`rule`, `fact`, `pattern`, `open_loop`) into governed categories and layers

## 2. Time Buckets And Lifecycle

- [x] 2.1 Define the named time buckets: `30m`, `1h`, `3h`, `6h`, `12h`, `today`, `older`
- [x] 2.2 Define the hotness tiers: `hot`, `warm`, `cold`
- [x] 2.3 Define lifecycle states: `active`, `stale`, `superseded`, `archived`
- [x] 2.4 Define lifecycle transitions and per-state actions for keep, suppress, archive, or conflict review

## 3. Recall Budget And Conflict Policy

- [x] 3.1 Define the default recall budget with `top-k`, token cap, and per-bucket caps
- [x] 3.2 Define the default inclusion/exclusion rules for `stale`, `superseded`, `archived`, `observation`, and `evidence`
- [x] 3.3 Define dedupe, merge, append, and conflict-review behavior with no silent overwrite of higher-authority memory

## 4. Promotion And Evaluation Outputs

- [x] 4.1 Define the durable write and promotion rules, including provenance requirements
- [x] 4.2 Produce the lifecycle table as an operator-facing output
- [x] 4.3 Produce the recall-budget table as an operator-facing output
- [x] 4.4 Produce the evaluation checklist covering recall quality, stale/superseded suppression, promotion precision, and contamination risk

## 5. Team-Mode Handoff

- [x] 5.1 Record the team execution boundary for governance work: Router, Spec Curator, Memory Curator, Research Scout
- [x] 5.2 Record which governance tasks can run in parallel and which must remain serial
- [x] 5.3 Record the next implementation boundary for runtime adoption after governance is accepted

## Outputs Produced

- [x] [memory-lifecycle-table.md](/home/imax/document/test/openspec/changes/design-memory-governance-and-recall-policy/memory-lifecycle-table.md)
- [x] [recall-budget-table.md](/home/imax/document/test/openspec/changes/design-memory-governance-and-recall-policy/recall-budget-table.md)
- [x] [evaluation-checklist.md](/home/imax/document/test/openspec/changes/design-memory-governance-and-recall-policy/evaluation-checklist.md)
- [x] [next-implementation-boundary.md](/home/imax/document/test/openspec/changes/design-memory-governance-and-recall-policy/next-implementation-boundary.md)
