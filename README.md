# codex-openspec-plan

这是 `document-test` 工作区当前 OpenSpec 体系的首页摘要。

如果你只想快速知道这个项目“分成哪些层、总共有多少计划、现在大致做到哪”，看 README 就够。
如果你要看真正按层级展开的版本，请直接看 [list.md](./list.md)。
如果你要看时间顺序的线框版，请直接看 [timeline-shell-canvas.md](./timeline-shell-canvas.md)。
如果你要看当前治理后的四栏进度，请直接看 [lane-progress/README.md](./lane-progress/README.md)。

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

[Tree Expansion]
.
├── 00 运行基座 / transport
│   ├── host / VM103
│   ├── NFS / SMB
│   ├── runner / hook
│   └── provider lanes
├── 01 规则治理
│   ├── explanation order
│   ├── minimal context
│   ├── review / runtime gates
│   └── rollout control
├── 01.2 搜索与路由
│   ├── memory 还是 web
│   ├── trace-first routing
│   ├── routing control plane
│   └── quote provenance
├── 02 OpenSpec 计划面
│   ├── proposal / design
│   ├── tasks / specs
│   ├── 全部 51 个 change
│   └── planning surface
├── 02.1 实施状态
│   ├── archived      =  2
│   ├── full not arch = 28
│   ├── over half     =  7
│   └── early / plan  = 14
├── 03 Artifact / cache / trace
│   ├── artifact-first cache
│   ├── DVC versioning
│   ├── Langfuse observability
│   └── codex-first ingest
├── 04 Memory / Recall
│   ├── durable / session / evidence
│   ├── RecallNest continuity
│   ├── memory governance
│   └── recall reuse
├── 04.1 A2A / 多执行面协作
│   ├── host Codex supervisor
│   ├── transport surface
│   ├── VM103 lanes
│   └── evidence / handoff / recall
├── 05 工具 / 技能工作流
│   ├── Obsidian / canvas
│   ├── gitagent / shell skills
│   └── bili / workflow packaging
└── 06 研究 / 评审 / 审计
    ├── paper study
    ├── evaluate / audit
    └── review / brief / report
```

## 四栏状态

```text
最后更新：2026-03-26 22:38 CST
总览：OpenSpec change 52 | archived 9 | active 5 | pending-continue 6 | backlog 11 | archive-queue 21
.
├── active (5) #当前主线，默认执行面
│   ├── active-surface 治理 15/15 #总控 change，已完成但继续作为治理入口
│   ├── runner 主线 15/16 #只差最后一个 host-safe write blocker
│   ├── vm agent lab 26/27 #实验室主链几乎闭环
│   ├── hook dispatch 4/15 #事件流刚进入实现段
│   └── multi-provider team 10/24 #团队拓扑已定，仍在补实证
├── pending-continue (6) #会继续，但不挤进当前主线
│   ├── local SMB share 10/11 #接近完成，等本周窗口
│   ├── artifact foundation 14/23 #设计过半，待继续实施
│   ├── canvas topology 0/18 #规范扩展，暂缓
│   ├── Obsidian CLI 21/22 #只差最后收尾
│   ├── AI canvas board 17/18 #模板主链已通
│   └── bili summary skill 30/42 #原型可用，剩缓存和归档收口
├── backlog (11) #后续研究 / 未启动 / proposal-only
│   ├── gitagent wrapper migration 0/0 #只有 proposal，尚未建 tasks
│   ├── trace-first recall router 0/12 #未启动
│   ├── error governance gates 0/28 #治理蓝图，未开工
│   ├── capability claim review 0/19 #治理提案，未开工
│   ├── routing misread audit 0/21 #审计提案，未开工
│   ├── routing control plane 0/20 #架构蓝图，未开工
│   ├── search layer 0/21 #架构蓝图，未开工
│   ├── ascii markdown cards 0/11 #扩展提案，未开工
│   ├── scholar -> serpapi 0/9 #替换计划，未开工
│   ├── AI agent base env 0/23 #基础环境蓝图，未开工
│   └── drift detection review 0/13 #review 提案，未开工
└── archive-queue (21) #已完成但未 archive，当前最大噪音源
    ├── memory / artifact / observability (11)
    │   ├── shared memory 18/18 #已完成，待 archive
    │   ├── recall MVP 21/21 #已完成，待 archive
    │   ├── langfuse wrapper 13/13 #已完成，待 archive
    │   ├── local cache MVP 22/22 #已完成，待 archive
    │   ├── memory governance 21/21 #已完成，待 archive
    │   ├── langfuse docker MVP 14/14 #已完成，待 archive
    │   ├── langfuse evaluate 14/14 #已完成，待 archive
    │   ├── observability foundation 16/16 #已完成，待 archive
    │   ├── DVC init 18/18 #已完成，待 archive
    │   ├── DVC integration 15/15 #已完成，待 archive
    │   └── memory research 24/24 #已完成，待 archive
    ├── rules / governance (5)
    │   ├── openspec devops governance 15/15 #已完成，待 archive
    │   ├── trace-first quote routing 20/20 #已完成，待 archive
    │   ├── minimal context governance 15/15 #已完成，待 archive
    │   ├── explanation deploy 9/9 #已完成，待 archive
    │   └── explanation rules 12/12 #已完成，待 archive
    └── tools / workflow (5)
        ├── gitagent wrapper skill 9/9 #已完成，待 archive
        ├── gitagent local branch 9/9 #已完成，待 archive
        ├── shell semantic canvas 22/22 #已完成，待 archive
        ├── codex adapter port 12/12 #已完成，待 archive
        └── agent context study 12/12 #已完成，待 archive
```

## 层级摘要与研究/摘要

| 层级 | 它回答什么问题 | OpenSpec change 数量 |
|---|---|---:|
| 规则治理层 | AI 应该怎么解释、怎么治理、怎么避免低级错误和上下文膨胀 | 11 |
| 搜索与路由层 | 先查 memory 还是先搜网页，quote/provenance 怎么路由 | 5 |
| 运行基座与 A2A/transport 层 | host/VM103/NFS/SMB/runner/双 Codex/多 provider 怎么协作 | 12 |
| Artifact/缓存/可观测性层 | 结果怎么落盘、缓存、版本化、追踪 | 8 |
| 记忆/Recall 层 | durable/session/evidence 怎么分层，RecallNest 怎么工作 | 4 |
| 工具/技能工作流层 | 把能力变成 Obsidian、gitagent、canvas、bili 等可复用工作流 | 10 |
| 纯研究/论文框架层 | 论文深读和方法框架沉淀 | 1 |

研究与摘要类产物单独看：

| 类型 | 数量 |
|---|---:|
| 严格 research/study 型 OpenSpec change | 2 |
| 放宽到 research/study/evaluate/audit 型 change | 4 |
| `summary` 文件 | 3 |
| `review / brief / report` 文件 | 5 |
| 合计 | 8 |
