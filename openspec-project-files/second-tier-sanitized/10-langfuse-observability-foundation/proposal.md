## Why

当前已经完成了 `artifact-first local cache + DVC` 的本地基础，但这只解决了高价值文件产物的固定与版本化，还没有解决 agent 执行链本身的可观测性。现在更需要的是一个成熟、平台化、可自托管的 observability backend，先让 `Codex` 的会话、tool call、bash/CLI 执行和错误记录变得可搜索、可检索、可复盘，而不是继续靠临时日志或聊天上下文复述执行过程。

## What Changes

- 选定 `Langfuse` 作为第一优先的 agent observability backend
- 明确 `trace / artifact / memory` 的分层边界，避免 Langfuse 与 DVC、RecallNest 职责重叠
- 定义面向 `Codex / OpenClaw / Claude / Gemini` 的薄 ingestion adapter 边界
- 定义 `Codex-first` 的分阶段 rollout，承认 `Codex` 当前缺少公开 hooks 的现实限制
- 固定首阶段默认值：
  - `Codex` 优先
  - `Langfuse` 本地 self-host + Docker
  - 默认脱敏
  - `Langfuse` 只收 metadata / trace，raw 内容留本地
  - 首阶段目标是先跑通并检索事件模型
- 为后续实现 change 固定最小事件模型、部署前提和 follow-up 边界

## Capabilities

### New Capabilities
- `langfuse-observability-foundation`: 定义 Langfuse 作为第一优先 trace backend 的分层边界、事件模型、薄采集接缝与分阶段 rollout。

### Modified Capabilities

## Impact

- 影响当前 `artifact-first` 蓝图的后续 observability 路线
- 为未来 `Codex` 外部 wrapper、`OpenClaw` gateway 事件采集、`Claude Code hooks` 接入提供统一目标后端
- 明确 `DVC` 继续负责 raw artifact versioning，`RecallNest` 继续负责 shared memory，不由 Langfuse 替代
- 为后续 Langfuse 本地 Docker 自托管评估与 Codex-first wrapper 接入 change 提供规划基础
