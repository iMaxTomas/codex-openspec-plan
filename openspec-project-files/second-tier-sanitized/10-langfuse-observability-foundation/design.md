## Context

当前已经有三条基础线：

- `artifact-first local cache` 已可运行，用于保存 raw/derived artifacts
- `DVC` 已接入，用于高价值文件型 artifact 的版本层
- `RecallNest` 被确认更适合作为后续 shared memory / continuity 层，而不是 raw artifact 或 trace backend

当前缺口是 `agent observability`。用户不接受继续拼装一套缺乏统一架构参考的本地日志散件作为主路线，而更接受：

- 有成熟参考案例
- 有平台化架构
- 有清晰 traces / tools / runs / timeline 模型
- 只保留最薄的 ingestion adapter

在此前比较中，`Langfuse`、`LangSmith`、`Braintrust` 都是候选，但当前路径更偏：

- `Codex` 为当前主执行器
- `OpenClaw` 为未来控制平面
- 本地优先 / 自托管友好
- 不希望被某一 agent framework 过度绑定

因此本 change 收敛为：先采用 `Langfuse` 作为第一优先 observability backend，并只规划最薄采集接缝。

当前已经确认的默认值是：

- 长期目标：`OpenClaw` 以后成为所有 agent 的统一入口与控制平面
- 第一阶段：只先覆盖 `Codex`
- 首阶段目标：先能搜索和检索这些记录
- 采集范围：
  - 聊天消息
  - tool calls
  - bash exec
  - stdout/stderr
  - exit code
  - cwd
  - 环境变量摘要
  - 文件与 diff
  - 远端 `host/user/session/command/result`
- 默认脱敏
- `Langfuse` 只收 metadata 与 trace；raw 内容优先留在本地 artifact 层
- Langfuse 首阶段采用本地 self-host + Docker 路线
- 首阶段成功标准优先是“事件模型跑通并可检索”，不是一次做完全部平台整合

## Goals / Non-Goals

**Goals:**

- 固定 `Langfuse` 为第一优先 agent observability backend
- 明确 `trace / artifact / memory / checkpoint` 的边界
- 定义最小事件模型，覆盖聊天、tool calls、bash/CLI 执行、错误、routing 与 artifact handles
- 定义 `Codex / Claude / Gemini / OpenClaw` 的接入边界，优先 `Codex-first`
- 固定“只写薄 ingestion adapter，不重造 observability backend”的原则
- 为后续实现 change 提供分阶段 rollout 与部署前提

**Non-Goals:**

- 本 change 不部署 Langfuse
- 本 change 不替换现有 `artifact-cache + DVC`
- 本 change 不引入新的 shared memory backend
- 本 change 不实现 OpenClaw control plane
- 本 change 不做 LangSmith / Braintrust 的进一步实现接入

## Decisions

### 1. Langfuse 作为第一优先 observability backend

系统 SHALL 先采用 `Langfuse`，而不是 `LangSmith` 或 `Braintrust`，作为第一优先的 trace backend。

原因：

- `Langfuse` 更符合开源、自托管、本地优先路线
- 更适合作为 `Codex / OpenClaw / RecallNest / DVC` 上方的中立 trace 层
- 不会像 `LangSmith` 那样带来更强的 LangChain/LangGraph 架构重力
- 不会像 `Braintrust` 那样过早把重点推向 eval-first / production analysis-first

替代方案：

- `LangSmith`
  放弃原因：虽然 AI observability 案例更密集，但自托管更重、产品面更大、与当前架构的耦合风险更高。
- `Braintrust`
  放弃原因：更适合作为后期 traces + eval 一体化平台，而不是当前第一优先 backend。

### 2. Langfuse 负责 trace，不负责 artifact 或 memory

`Langfuse` 只负责：

- traces
- transcripts / messages（在可获取时）
- tool calls
- bash/CLI execution metadata
- errors / retries / latency / routing metadata
- searchable run/session timeline

它不负责：

- raw artifacts 的主存储
- 文件版本化
- shared memory / continuity

原因：

- `DVC + artifact-cache` 已经承担 raw artifact 层
- `RecallNest` 更适合 shared memory
- 如果 Langfuse 同时承担 artifact 和 memory，会重新混淆三层边界

替代方案：

- 把聊天记录、tool calls、原始文件和长期记忆都塞进一个 backend  
  放弃原因：会导致 trace、artifact、memory 角色再次混杂。

### 2.1 默认采用 metadata-first 与 redaction-first

首阶段 SHOULD 默认采用：

- metadata-first
- redaction-first
- raw payloads externalized

也就是：

- `Langfuse` 优先接收 metadata、路径、句柄、摘要、状态码、时间线
- stdout/stderr、完整 diff、原始网页、完整 JSON、原始日志等优先留在本地 artifact 层
- secret、token、cookie、敏感路径和高风险参数默认脱敏

原因：

- 用户已接受“Langfuse 不是最终真相层”
- 这样可以把 Langfuse 用作检索、时间线、复盘入口，而不与本地 raw artifact 冲突
- 这也是后续 `DVC + artifact-cache` 与 `Langfuse` 并存的前提

### 3. 只接受薄 ingestion adapter，不自建 observability 平台

当前只允许实现最薄的采集接缝，用来把上层事件送到 Langfuse。

这层 adapter 只做：

- 接收上层事件
- 标准化最小字段
- 把 trace/log 发送到 Langfuse
- 返回 `trace_id`、`run_id`、状态或错误

这层 adapter 不做：

- 自建 trace store
- 自建 UI
- 自建评估平台
- 自建复杂 runtime

原因：

- 用户明确不接受闭门造平台
- 当前已有成熟平台与现成参考
- 自建平台会与此前“只写接缝层”的路线冲突

### 4. Codex-first 采用外部采集，Claude/OpenClaw 后续接入

接入顺序 SHALL 为：

1. `Codex`
2. `Claude Code`
3. `OpenClaw`
4. `Gemini`

`Codex` 首阶段优先通过外部 wrapper / sidecar / API-adapter 采集，而不是假设存在等价于 `Claude Code hooks` 的能力。

原因：

- 当前 `Codex` 没有像 `Claude Code` 那样明确、公开、稳定的 hooks 入口
- `Codex` 又是当前主执行器，先接入收益最高
- `Claude Code` 后续可利用 hooks 直接接入
- `OpenClaw` 更适合等 trace backend 稳定后，再由 gateway 层统一上报

替代方案：

- 等待 Codex 官方 hooks 再开始 observability  
  放弃原因：会继续拖延当前最需要的 trace 能力。

### 4.1 首阶段默认选择 Codex wrapper 生成 run/session/artifact 引用

首阶段 SHOULD 由 `Codex` 外部 wrapper 负责生成并维护：

- `run_id`
- `session_id`
- `artifact_handle`

后续如果 `OpenClaw` 成为统一入口，再考虑由 gateway 统一生成这些标识。

原因：

- 当前第一阶段只覆盖 `Codex`
- `OpenClaw` 未来虽是唯一入口，但现在还不是首阶段阻塞点
- 先由 wrapper 生成标识可以最快跑通本地 Langfuse 事件模型

### 5. 最小事件模型先覆盖 6 类事件

首阶段事件模型 SHOULD 覆盖：

1. session / run lifecycle
2. user / assistant message transcript metadata
3. tool call / MCP call metadata
4. bash / CLI execution metadata
5. error / retry / fallback
6. artifact handle / local path / canonical key 引用

并优先覆盖这些字段类别：

- `host`
- `user`
- `session`
- `command`
- `cwd`
- `exit_code`
- `stdout_path`
- `stderr_path`
- `env_summary`
- `artifact_handle`
- `diff_path`
- `remote_target`

原因：

- 这是当前最有价值、最直接可检索的 observability 数据
- 它们构成后续 run analysis 与 cache-aware debugging 的基础

替代方案：

- 一开始就追求全量 payload、全量 raw content、全量 reasoning capture  
  放弃原因：范围过大，而且并不现实。

### 6. 先做平台化 observability，再决定是否补本地 transcript-only fallback

当前 MVP 优先走 Langfuse 平台化路径，而不是以 `bash-preexec + sqlite/jsonl + asciinema` 作为主路线。

原因：

- 用户更接受成熟平台而不是散件拼装
- 平台化 observability 有更成熟的架构参考、案例与 issue 沉淀
- 本地 transcript-only 方案仍可作为 fallback，而不是主路线

### 7. 首阶段先做本地 self-host Docker 验证

首阶段 Langfuse 验证 SHOULD 优先采用：

- 本地 self-host
- Docker
- 以“事件模型跑通并可检索”为第一成功标准

而不是先做：

- 远端生产化部署
- 全工具接入
- OpenClaw 统一控制平面

原因：

- 用户明确更偏本地 self-host Docker
- 当前最先要回答的是“这套 trace 模型能不能跑起来、能不能搜”
- 这比先解决长期运维或多 agent 全接入更重要

## Risks / Trade-offs

- [Risk] Langfuse 仍然不能自动解决 Codex 没 hooks的问题 → Mitigation: 明确首阶段以外部 wrapper / adapter 作为采集接缝，不把缺 hook 等同于无法接入
- [Risk] Langfuse 与 artifact-cache / DVC / RecallNest 边界再次混乱 → Mitigation: 在 spec 中固定三层边界，并要求 follow-up change 不越层实现
- [Risk] 过早把 observability 规划成完整 control plane → Mitigation: 限制本 change 只规划 trace backend 与 ingestion adapter
- [Risk] 自托管平台部署复杂度被低估 → Mitigation: 将部署评估单独作为 follow-up，不在本 change 中承诺立即部署

## Migration Plan

1. 固定 Langfuse 作为第一优先 observability backend
2. 固定 metadata-first / redaction-first 原则
3. 定义最小事件模型与上报边界
4. 固定 Codex-first 接入策略与外部采集路线
5. 固定本地 self-host Docker 的首阶段验证路线
6. 明确 Claude/OpenClaw/Gemini 的后续接入顺序
7. 起 follow-up implementation change，专门处理 Langfuse 部署评估与 Codex-first ingestion

## Open Questions

- Codex 首阶段更适合通过哪种薄接缝进入 Langfuse：CLI wrapper、外部 API bridge，还是会话录制器
- OpenClaw 后续上报 trace 时，是 gateway 统一发，还是由各 worker adapter 直接发
- Claude Code hooks 接入时，哪些 payload 应只保留 metadata，哪些可以保留 transcript path 引用
