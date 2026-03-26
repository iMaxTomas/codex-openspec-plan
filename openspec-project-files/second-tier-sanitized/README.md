# Second-Tier Sanitized OpenSpec Packages

这里收纳的是第二梯队公开包。

中文： [README.md](./README.md) | English: [README.en.md](./README.en.md)

这些包和第一梯队的差别是：
- 它们同样完整，`proposal / design / tasks / specs` 都已经闭环
- 但环境绑定更强
- 所以公开版不是原样复制，而是“保留 OpenSpec 核心结构后再脱敏”

## Package Set

| 目录 | 来源 | 复用等级 | 说明 |
|---|---|---|---|
| `09-artifact-first-local-cache-mvp` | `deploy-artifact-first-local-cache-mvp` | `reusable after local replacement` | 本地 artifact cache MVP，保留 `.artifact-cache` 结构与职责边界 |
| `10-langfuse-observability-foundation` | `adopt-langfuse-observability-foundation` | `reusable after local replacement` | Langfuse 作为 metadata-first trace backend 的治理与 rollout 计划 |
| `11-dvc-artifact-foundation` | `integrate-dvc-with-artifact-cache-foundation` + `initialize-dvc-for-selected-artifact-directories` | `reusable after local replacement` | DVC 作为 artifact versioning 第二层；顶层是 integration，`follow-up-initialize/` 是执行跟进 |
| `12-agent-context-paper-framework` | `study-agent-context-paper-framework` | `reusable after local replacement` | 从本地讨论材料和论文源码抽取 agent context 研究框架 |

## How To Read

1. 先看每个目录里的 `evolution.md`
2. 再看 `sanitization-notes.md`
3. 最后再读 `proposal / design / tasks / specs`

## What Was Sanitized

- local absolute paths -> `<repo-root>`
- local future platform name -> `<future-control-plane>`
- local paper-reading skill entrypoint -> `<paper-reading-skill>`
- local discussion-note filenames -> discussion-note placeholders

## What Was Not Sanitized

- `Langfuse`
- `DVC`
- `OpenSpec`
- `SQLite`
- `.artifact-cache/`

这些是技术语义本身的一部分，不是本地隐私字段。
