# codex-openspec-plan

这是 `document-test` 工作区当前 OpenSpec 体系的一页式层级地图。

目标不是罗列全部 change 名字，而是回答三件事：

- 当前到底讨论了哪些层级
- 整个项目主线怎么串起来
- 每个层级大概有多少 OpenSpec 计划、研究和摘要材料

## 当前总数

- OpenSpec change 总数：`51`
- 活动区：`49`
- 已归档：`2`

## 完整脉络

`运行基座/transport -> 规则治理 -> 搜索与路由 -> OpenSpec 计划 -> 实施状态 -> Artifact/缓存/Trace -> 记忆/Recall -> A2A/多执行面协作 -> 工具/技能工作流 -> 研究/评审/审计`

## 层级地图

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

| 类型 | 说明 | 数量 |
|---|---|---:|
| 严格 research/study 型 OpenSpec change | 名称属于 `research-*` 或 `study-*` 的 change | 2 |
| 放宽到 research/study/evaluate/audit 型 change | 把评估与审计也算进研究视角 | 4 |
| `summary` 文件 | 文件名直接带 `summary` 的摘要文件 | 3 |
| `review/brief/report` 文件 | 评审、brief、report 类配套文档 | 5 |
| 研究/摘要类文件合计 | `summary + review + brief + report` | 8 |

## 备注

- 这份 README 是“脉络图”，不是 change 明细表。
- `实施状态层` 是横切视角，不是一个独立主题域。
- 如果只记最短版本，可以记成：
  `规则 -> 搜索 -> 计划 -> 实施 -> artifact -> 记忆 -> A2A -> 工具 -> 研究`
