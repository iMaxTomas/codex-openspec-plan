# codex-openspec-plan

这是 `document-test` 工作区当前 OpenSpec 体系的首页摘要。

如果你只想快速知道这个项目“分成哪些层、总共有多少计划、现在大致做到哪”，看 README 就够。
如果你要看真正按层级展开的版本，请直接看 [list.md](./list.md)。
如果你要看时间顺序的线框版，请直接看 [timeline-shell-canvas.md](./timeline-shell-canvas.md)。
如果你要看当前治理后的四栏进度，请直接看 [lane-progress/README.md](./lane-progress/README.md)。
如果你要直接下载可复用的 OpenSpec 计划包，请看 [openspec-project-files/README.md](./openspec-project-files/README.md)。

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


## 可复用openspec计划项目

公开仓库里已经整理出两组可复用计划包：
- 第一梯队 8 个，统一放在 [openspec-project-files/README.md](./openspec-project-files/README.md)
- 第二梯队 4 个脱敏公开包，统一放在 [openspec-project-files/second-tier-sanitized/README.md](./openspec-project-files/second-tier-sanitized/README.md)

这些计划包都保留了：
- `proposal.md`
- `design.md`
- `tasks.md`
- `specs/`
- `evolution.md`

当前优先推荐这 8 个：

| 计划包 | 作用 |
|---|---|
| `01-active-surface-and-archive-discipline` | 管理 `active / pending / backlog / archive-queue` 四栏执行面 |
| `02-minimal-context-and-curated-skills` | 收敛长期配置边界，避免上下文膨胀 |
| `03-codex-explanation-order-rules` | 固定复杂系统的解释顺序 |
| `04-trace-first-quote-routing` | 修正 quote / artifact / memory 的路由和 provenance |
| `05-memory-governance-and-recall-policy` | 给记忆层补 authority、budget、lifecycle |
| `06-openmemory-recall-mvp` | 提供最小可运行的 recall 接入路径 |
| `07-openspec-and-codex-devops-workflow` | 统一 OpenSpec、repo 规则和配置推广流程 |
| `08-shell-semantic-canvas-skill` | 把 shell 白板式解释固化成 skill 计划 |

说明：
- 这些公开版保留了原始 OpenSpec 核心文件，方便直接下载改造。
- 部分文件仍带有原始项目名或路径，复用前先看各目录里的 `evolution.md`。
- second-tier 公开包额外附带 `sanitization-notes.md`，用来说明哪些字段已经替换、哪些字段仍需本地化。



```text
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

研究与摘要类产物单独看：

| 类型 | 数量 |
|---|---:|
| 严格 research/study 型 OpenSpec change | 2 |
| 放宽到 research/study/evaluate/audit 型 change | 4 |
| `summary` 文件 | 3 |
| `review / brief / report` 文件 | 5 |
| 合计 | 8 |
