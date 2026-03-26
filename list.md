# Document-Test OpenSpec 分层总表

这份 `list.md` 不是 README 的复制版。

它的目标是把当前项目按“层级”重新摊开，让你不用再记一长串 change 名字，而是先记住：

- 整个项目的脉络是什么
- 现在到底讨论了哪些层
- 你原先记住的层里，哪些其实是横切视角，哪些还漏掉了
- 每一层大概有多少个 OpenSpec 计划、多少研究和多少摘要材料

## 先记整条主线

当前项目的完整脉络更适合记成这条链：

`运行基座/transport -> 规则治理 -> 搜索与路由 -> OpenSpec 计划 -> 实施状态 -> Artifact/缓存/Trace -> 记忆/Recall -> A2A/多执行面协作 -> 工具/技能工作流 -> 研究/评审/审计`

你原先记住的是：

- 规则层
- 搜索规则
- spec 计划
- 实施情况
- artifact 缓存复用
- 记忆层
- A2A

你漏掉的主要是：

- `运行基座/transport 层`
- `可观测性/trace 层`
- `工具/技能工作流层`
- `研究/评审/审计层`

还有两个认知校正：

- `OpenSpec 计划层` 是所有 change 的共同承载层，不是单独业务主题。
- `实施情况层` 是横切状态视角，不是独立主题域。

## 总数

- OpenSpec change 总数：`51`
- 活动区：`49`
- 已归档：`2`

## 0. 运行基座 / transport 层

这是最底层。它回答的是：
“host、VM103、NFS、SMB、runner、hook、commander baseline 这些执行面到底怎么接起来。”

这一层大约有：`12` 个 OpenSpec change。

这一层包含的内容主要是：

- 实验室底座和 VM103 工作面
- host 到 VM103 的 transport contract
- NFS 主总线和 SMB side port
- runner、dispatch、hook、handoff
- dual Codex / multi-provider 的运行边界

如果没有这一层，上面的 rules、memory、artifact 都没有稳定落点。

## 1. 规则治理层

这一层回答：
“AI 应该怎么工作、怎么解释、怎么避免低级错误、怎么收敛上下文、怎么治理长期配置。”

这一层有：`11` 个 OpenSpec change。

这一层包含的内容主要是：

- explanation order
- minimal context / curated skills governance
- DevOps workflow governance
- capability claim review
- runtime gates / error governance
- drift review / rollout discipline

这一层不是功能层，而是约束层。

## 1.2 搜索与路由子层

这是规则层下面最关键的一个子层。它回答：
“先查 memory 还是先搜网页，quote/provenance 问题先查 trace 还是查 memory，外部搜索结果怎么进入后续链路。”

这一层有：`5` 个 OpenSpec change。

它包含的内容主要是：

- search layer 规划
- routing control plane
- trace-first quote/provenance routing
- router helper 的最小实现
- Scholar/SerpAPI 这类具体搜索接入替换

如果只记一句话：
它管的是“先查哪一层”，不是“查到什么内容”。

## 2. OpenSpec 计划层

这一层不是某个业务主题，而是整个项目共同的计划容器。

它回答：
“这些事情是如何被写成 proposal / design / tasks / specs，并变成一条条可执行 change 的。”

这一层覆盖：`全部 51 个` OpenSpec change。

你可以把它理解成：

- 上面每一层都是“主题域”
- `OpenSpec 计划层` 是这些主题域共同使用的 planning surface

所以它不是和其它层并列抢主题，而是包住全部主题。

## 2.1 实施情况层

这层也不是独立主题域，而是横切全部 OpenSpec 的状态视图。

它回答：
“哪些已经归档，哪些已经实质做完，哪些做了一半，哪些还只是规划。”

当前状态统计是：

| 状态 | 数量 |
|---|---:|
| 已归档 | 2 |
| 任务已全部完成但未归档 | 28 |
| 已完成大半但未归档 | 7 |
| 前期规划或未启动 | 14 |

如果只记一句话：
它管的是“做到哪一步”，不是“属于哪个主题层”。

## 3. Artifact / 缓存 / 可观测性层

这一层回答：
“结果怎么落盘、怎么缓存、怎么版本化、怎么追踪，避免每次重新抓取和重新消耗上下文。”

这一层有：`8` 个 OpenSpec change。

它包含的内容主要是：

- artifact-first local cache
- DVC 接入
- 本地 artifact foundation
- Langfuse observability
- 本地 Docker observability MVP
- Codex-first ingest / wrapper

这里要特别区分两件事：

- `artifact/cache` 管文件和复用资产
- `observability/trace` 管执行链和事件记录

它们相关，但不是同一件事。

## 4. 记忆 / Recall 层

这一层回答：
“什么应该进 durable memory，什么只该留在 session，RecallNest 怎么做 continuity，evidence 和 memory 怎么分层。”

这一层有：`4` 个 OpenSpec change。

它包含的内容主要是：

- OpenMemory/Recall MVP 设计
- memory governance policy
- RecallNest shared memory 部署
- AI memory layer 的前沿研究输入

如果只记一句话：
它不是聊天记录堆积层，而是长期 continuity 的治理层。

## 4.1 A2A / 多执行面协作子层

你把 `A2A` 记成 `4.1` 没问题，但在当前项目里，它更准确地说不是记忆层的子层，而是：

- 一部分落在 `0. 运行基座 / transport 层`
- 一部分和 `4. 记忆 / Recall 层`、`3. Artifact / trace 层`联动

它回答：
“多个 agent、多个执行面、多个 lane 怎么协作，而不是各自孤立跑。”

这个子层不单独作为新的总数统计；
它主要寄宿在前面的 `12` 个 transport / 协作 change 里。

如果只记一句话：
它不是抽象协议名，而是这条现实链路：

`host Codex supervisor -> transport surface -> VM103 executor / specialist lanes -> evidence / handoff / recall`

## 5. 工具 / 技能工作流层

这一层回答：
“这些能力最后怎样变成日常真正能用的 workflow，而不是只停留在治理和设计里。”

这一层有：`10` 个 OpenSpec change。

它包含的内容主要是：

- Obsidian CLI
- gitagent wrapper
- shell semantic canvas
- AI canvas decision board
- ASCII markdown canvas
- bili favorites summary

这层的特点是：

- 更接近操作员日常使用
- 更像 workflow productization
- 是上面 transport / rules / memory 的实际落点

## 6. 研究 / 评审 / 审计层

这一层回答：
“哪些内容需要通过论文深读、研究、审计、评估和评审来持续纠偏，而不是直接进入实现。”

如果按最严格口径，只把 `research-*` / `study-*` 算作研究型 change：

- `2` 个

如果把 `evaluate-*` / `audit-*` 也纳入研究视角：

- `4` 个

这一层的作用不是直接生成 runtime，而是：

- 给 rules 层输入依据
- 给 memory 层输入理论和设计边界
- 给 implementation 层提供纠偏与复盘材料

## 摘要 / review / report 统计

这部分不是 OpenSpec change 数量，而是当前仓库里的研究/摘要类文档数量。

| 类型 | 数量 |
|---|---:|
| `summary` 文件 | 3 |
| `review / brief / report` 文件 | 5 |
| 合计 | 8 |

## 最短记忆版

如果你以后又忘了，只记这一版就够了：

1. 先有 `运行基座`，不然没有执行面。
2. 再有 `规则层`，不然 AI 会漂。
3. 再有 `搜索/路由层`，不然不知道先查哪。
4. 再通过 `OpenSpec` 把事情写成计划。
5. 用 `实施状态层` 看现在做到哪。
6. 用 `artifact/trace` 把结果和执行链留住。
7. 用 `记忆层` 做 continuity。
8. 用 `A2A` 把多个执行面串起来。
9. 用 `工具层` 把这些能力变成日常 workflow。
10. 用 `研究层` 持续纠偏。
