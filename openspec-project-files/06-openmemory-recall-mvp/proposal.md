## Why

当前本机已经跑通了 `Codex -> wrapper -> artifact + Langfuse` 这条最小闭环，但还缺一个真正参与运行前后的长期记忆层。现在最短路径不是继续扩张 `Langfuse` 或 `artifact` 的职责，而是增加一个很薄的 `OpenMemory recall` 支路：

- 运行前先搜索少量短记忆
- 运行后再写回少量稳定结论

这条 change 的目标不是完成整个 memory layer，而是定义一版“今晚就能执行”的 MVP 计划，使本机可以在不破坏现有 wrapper / artifact / Langfuse 边界的前提下，把 `OpenMemory` 接入为最小召回层。

## What Changes

- 新增一条专门面向 `OpenMemory recall MVP` 的设计型 change
- 明确 `OpenMemory` 在当前系统里的角色：长期短记忆层，而不是 raw artifact 层或 trace 层
- 固定今晚 MVP 的读写路径：
  - `search before run`
  - `add after run`
- 固定今晚 MVP 的最小 memory 类型：
  - `rule`
  - `fact`
  - `pattern`
  - `open_loop`
- 固定今晚 MVP 的最小 metadata：
  - `project`
  - `type`
  - `session_id`
  - `trace_id`
  - `artifact_handle`
  - `created_at`
  - `last_used_at`
  - `importance`
- 产出一份可直接复制到新窗口执行的 implementation prompt

## Capabilities

### New Capabilities
- `openmemory-recall-mvp`: 定义一条本地 `OpenMemory -> wrapper -> Codex` 的最小召回与写回流程，用于在不引入完整 memory automation 的前提下，为后续长期记忆层打通第一条真实工作流。

### Modified Capabilities

- None.

## Impact

- 为现有 `Codex-first` 工作流增加一个前置短记忆召回层
- 不改变 `artifact-cache + DVC` 的 raw 真相层职责
- 不改变 `Langfuse` 的 trace / timeline 职责
- 不在本阶段引入完整图谱、自动衰减或自动 promote engine
- 为后续 `OpenMemory / Mem0 / RecallNest` 更深层接入提供第一条本机可执行路径
