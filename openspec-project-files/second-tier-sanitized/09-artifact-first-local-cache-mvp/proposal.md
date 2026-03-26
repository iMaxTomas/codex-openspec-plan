## Why

`add-artifact-first-agent-persistence-foundation` 已经定义了 artifact-first 的分层架构、scope 边界和阶段顺序，但当前仍停留在设计层。为了真正减少 `Codex` 工作流中的重复联网、重复抓取和重复上下文消耗，需要一个更窄的实现型 change，把本地 artifact cache 的 MVP 真正部署出来。

当前最直接的目标不是多 agent 协作，也不是 DVC / MLflow / W&B 的完整接入，而是先把以下基础落地：

- 固定 `.artifact-cache/` 目录结构
- 初始化 `index.sqlite`
- 初始化 `jsonl` traces
- 提供第一个 cache-first wrapper / fetch helper
- 用一条搜索流和一条网页或 GitHub 流验证“先查缓存、未命中才联网、再只回摘要”

只有这一步完成后，后续 DVC、MLflow/trace 和 <future-control-plane> 控制平面接入才有稳固底座。

## What Changes

- 新增一个实现型 change，用于部署 artifact-first local cache MVP。
- 创建本地 `.artifact-cache/` 目录结构。
- 创建 `index.sqlite` 及最小表结构。
- 创建 `query-rounds.jsonl` 与 `tool-calls.jsonl`。
- 提供第一个通用 cache-first fetch helper，支持“先查索引、未命中再抓取、落 raw、落 summary、返回 compact payload”。
- 为至少两类 workflow 提供最小验证：
  - research/search workflow
  - web 或 GitHub workflow

## Capabilities

### New Capabilities
- `artifact-first-local-cache-mvp`: 在当前本地环境中提供最小可用的 artifact-first 缓存、索引、trace 和 cache-first fetch 能力

### Modified Capabilities
- `artifact-first-agent-persistence`: 从设计约束进入可执行实现阶段

## Impact

- 影响当前 `Codex` 的搜索、网页和 GitHub 访问工作流
- 为未来 `<future-control-plane>` 接入同一套 artifact foundation 提供现成底座
- 为后续 DVC、MLflow/trace 和 W&B 接入提供已存在的文件与元数据结构
