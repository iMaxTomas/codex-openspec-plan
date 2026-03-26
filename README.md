# codex-openspec-plan

这是 `document-test` 工作区当前 OpenSpec 体系的首页摘要。

如果你只想快速知道这个项目“分成哪些层、总共有多少计划、现在大致做到哪”，看 README 就够。
如果你要看真正按层级展开的版本，请直接看 [list.md](./list.md)。

## Main Time Spine

```text
[00 基座/transport] -> [01 规则治理] -> [01.2 搜索/路由] -> [02 OpenSpec 计划面] -> [02.1 实施状态]
        |                    |                    |                     |                        |
        |=> host / VM103     |=> explanation      |=> memory 还是 web   |=> proposal / design    |=> archived      =  2
        |=> NFS / SMB        |=> minimal context  |=> trace-first       |=> tasks / specs        |=> full not arch = 28
        |=> runner / hook    |=> review / gates   |=> routing plane     |=> 全部 51 个 change    |=> over half     =  7
        |=> provider lanes   |=> rollout control  |=> quote provenance  |=> planning surface     |=> early / plan  = 14
        |
        +----------------------------------------------------------------------------------------------+
                                                                                                       |
                                                                                                       v
                   [03 Artifact / cache / trace] -> [04 Memory / Recall] -> [04.1 A2A / 多执行面协作]
                              |                               |                                |
                              |=> artifact-first cache        |=> durable / session / evidence |=> host Codex supervisor
                              |=> DVC versioning              |=> RecallNest continuity         |   -> transport surface
                              |=> Langfuse observability      |=> memory governance             |   -> VM103 lanes
                              |=> codex-first ingest          |=> recall reuse                  |   => evidence / handoff / recall
                                                                                                |
                                                                                                v
                                                      [05 工具 / 技能工作流] -> [06 研究 / 评审 / 审计]
```

## 当前总数

- OpenSpec change 总数：`51`
- 活动区：`49`
- 已归档：`2`

## 完整脉络

`运行基座/transport -> 规则治理 -> 搜索与路由 -> OpenSpec 计划 -> 实施状态 -> Artifact/缓存/Trace -> 记忆/Recall -> A2A/多执行面协作 -> 工具/技能工作流 -> 研究/评审/审计`

## 层级摘要

| 层级 | 它回答什么问题 | OpenSpec change 数量 |
|---|---|---:|
| 规则治理层 | AI 应该怎么解释、怎么治理、怎么避免低级错误和上下文膨胀 | 11 |
| 搜索与路由层 | 先查 memory 还是先搜网页，quote/provenance 怎么路由 | 5 |
| 运行基座与 A2A/transport 层 | host/VM103/NFS/SMB/runner/双 Codex/多 provider 怎么协作 | 12 |
| Artifact/缓存/可观测性层 | 结果怎么落盘、缓存、版本化、追踪 | 8 |
| 记忆/Recall 层 | durable/session/evidence 怎么分层，RecallNest 怎么工作 | 4 |
| 工具/技能工作流层 | 把能力变成 Obsidian、gitagent、canvas、bili 等可复用工作流 | 10 |
| 纯研究/论文框架层 | 论文深读和方法框架沉淀 | 1 |

## 实施状态

| 状态 | 数量 |
|---|---:|
| 已归档 | 2 |
| 任务已全部完成但未归档 | 28 |
| 已完成大半但未归档 | 7 |
| 前期规划或未启动 | 14 |

## 研究与摘要

| 类型 | 数量 |
|---|---:|
| 严格 research/study 型 OpenSpec change | 2 |
| 放宽到 research/study/evaluate/audit 型 change | 4 |
| `summary` 文件 | 3 |
| `review / brief / report` 文件 | 5 |
| 合计 | 8 |

## 说明

- README 是首页摘要。
- [list.md](./list.md) 是详细分层版，不是 README 的复制粘贴。
- [timeline-shell-canvas.md](./timeline-shell-canvas.md) 是按时间顺序展开、参考 topology grammar 重画的 shell 白板版本。
- `OpenSpec 计划层` 和 `实施状态层` 都是横切视角，不是单独业务主题。
