# Document-Test OpenSpec Layer Map

这份清单不再按单个 change 罗列，而是按“当前讨论了哪些层级、整条脉络怎么串、每层大概有多少计划”来组织。

## 总览

- OpenSpec change 总数：`51`
- 活动区：`49`
- 已归档：`2`

## 完整脉络

当前项目更适合记成这一条主线：

`运行基座/transport -> 规则治理 -> 搜索与路由 -> OpenSpec 计划 -> 实施状态 -> Artifact/缓存/Trace -> 记忆/Recall -> A2A/多执行面协作 -> 工具/技能工作流 -> 研究/评审/审计`

如果只记你原先那几个关键词，你漏掉的主要是这四层：

- `运行基座/transport 层`
- `可观测性/trace 层`
- `工具/技能工作流层`
- `研究/评审/审计层`

另一个容易混淆的点是：

- `实施情况层` 不是一个单独主题域，而是横切全部 OpenSpec 的状态视角。

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

这部分不是独立主题层，而是对全部 change 的当前状态统计。

| 状态 | 数量 |
|---|---:|
| 已归档 | 2 |
| 任务已全部完成但未归档 | 28 |
| 已完成大半但未归档 | 7 |
| 前期规划或未启动 | 14 |

## 研究与摘要

这里把“研究型计划”和“研究/摘要类文档”分开统计，避免混成一类。

| 类型 | 说明 | 数量 |
|---|---|---:|
| 严格 research/study 型 OpenSpec change | 名称属于 `research-*` 或 `study-*` 的 change | 2 |
| 放宽到 research/study/evaluate/audit 型 change | 把评估与审计也算进研究视角 | 4 |
| `summary` 文件 | 文件名直接带 `summary` 的摘要文件 | 3 |
| `review/brief/report` 文件 | 评审、brief、report 类配套文档 | 5 |
| 研究/摘要类文件合计 | `summary + review + brief + report` | 8 |

## 一句话记忆法

- `规则层`：规定 AI 怎么工作。
- `搜索层`：规定先查哪一层。
- `计划层`：规定要建什么系统。
- `实施状态层`：看做到哪一步。
- `artifact 层`：把结果存下来并复用。
- `记忆层`：把长期 continuity 做对。
- `A2A 层`：把多个 agent 和多个运行面串起来。
- `工具层`：把这些能力变成日常可操作 workflow。
- `研究层`：持续纠偏、深读和抽象方法。
