## Why

`OpenMemory recall MVP` 已经证明了最小 recall loop 可以工作，但当前系统仍缺少长期治理规则：哪些内容能成为 durable memory、记忆如何按时间衰减、`stale` 与 `superseded` 如何区分、以及一次 recall 到底能拿多少。现在如果不先把这些规则固定下来，后续 runtime 扩展只会把更多内容写进记忆层而没有统一边界。

## What Changes

- 定义当前记忆系统的治理分层：`canonical`、`durable`、`session`、`observation`、`evidence`
- 在当前已稳定的 `created_at + last_used_at` 基线之上，定义治理用时间桶与可选热度映射
- 定义生命周期状态：`active`、`stale`、`superseded`、`archived`
- 定义默认 recall budget，包括 `top-k`、token cap、按时间桶的召回顺序与默认排除规则
- 定义 durable write / promote policy，明确什么可以进入长期记忆、什么只能停留在 trace 或 evidence
- 定义冲突与覆盖规则，禁止低权威路径静默覆盖高权威 durable memory
- 产出后续实现必须复用的三份治理输出：
  - lifecycle table
  - recall-budget table
  - evaluation checklist

## Capabilities

### New Capabilities

- `memory-governance-policy`: Define the governing layers, lifecycle states, time buckets, recall budget, promotion rules, and evaluation contract for the current artifact + Langfuse + OpenMemory memory stack

### Modified Capabilities

- None

## Impact

- Affected systems:
  - `OpenMemory` / future durable memory provider behavior
  - `Langfuse` as observation/trace authority
  - `.artifact-cache` / `DVC` as evidence authority
  - future `RecallNest` / `OpenClaw` integrations
- Affected artifacts:
  - new governance spec and design under `openspec/changes/design-memory-governance-and-recall-policy/`
- Dependencies:
  - references `design-openmemory-recall-mvp-for-codex-workflow`
  - references `research-ai-memory-layer-frontier-and-governance`
  - references `recallnest/docs/memory-boundary-contract.md`
