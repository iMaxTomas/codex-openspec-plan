## Why

这次关于“把我当时原话一字不差找出来”的回答串错，暴露出来的不是 memory foundation 缺失，而是 `quote / provenance lookup` 没有被明确识别为 `trace-first` 问题。现有系统已经把 `trace != artifact != memory` 的边界讲清楚了，但还没有把“什么问题先查哪一层”固定成硬规则，因此相近主题线仍会在回答时被语义相似度抢答。

## What Changes

- 新增一条很窄的 correction change，专门修补 `quote / provenance / context recall` 的问题分类与路由优先级
- 定义至少三类 operator-facing question：
  - `trace questions`
  - `artifact questions`
  - `memory questions`
- 固定默认路由顺序：
  - `trace question -> trace first -> artifact verify -> memory optional`
  - `artifact question -> artifact first -> trace optional -> memory optional`
  - `memory question -> memory first -> artifact back-link -> trace optional`
- 定义“如果回答声称是用户原话、上一句、或对应某次提问”，必须满足的 provenance contract
- 定义当系统发现两条主题相近但 provenance 不同的线程时，必须先显式去歧，不能直接选一条抢答
- 明确这条 change 不是新的 memory layer、artifact store、Langfuse foundation 或 review-board redesign
- 为后续实现型 change 保留接口，但当前 change 先只固定治理合同和 operator-facing 规则

## Capabilities

### New Capabilities

- `question-routing-for-context-recall`: Define question classes and default routing priority across trace, artifact, and memory layers for context-recall requests
- `provenance-answer-contract`: Define the evidence and ambiguity-handling rules required before the system may claim an exact prior quote, prior user question, or source turn

### Modified Capabilities

- None

## Impact

- Affected systems:
  - operator-facing context recall behavior for `Codex`
  - future wrapper or retrieval logic that dispatches between trace, artifact, and memory
  - future Langfuse / local artifact / OpenMemory integration points for provenance-aware recall
- Affected artifacts:
  - new correction artifacts under `openspec/changes/repair-trace-first-quote-routing/`
- Related references:
  - `openspec/changes/add-artifact-first-agent-persistence-foundation/`
  - `openspec/changes/adopt-langfuse-observability-foundation/`
  - `openspec/changes/design-openmemory-recall-mvp-for-codex-workflow/`
  - `openspec/changes/design-memory-governance-and-recall-policy/`
  - `openspec/changes/design-agent-error-governance-and-runtime-gates/`
  - `openspec/changes/audit-routing-selection-misread-error/`
