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


## 可复用 OpenSpec 计划项目

按架构层看当前已经公开的可复用项目。完整目录见 [openspec-project-files/README.md](./openspec-project-files/README.md)。

| 架构层 | 作用 | OpenSpec change 数量 | 可复用计划项目 |
|---|---|---:|---|
| 规则治理 | 管长期规则边界、解释顺序、执行面治理和 DevOps 纪律 | 11 | [01-active-surface-and-archive-discipline](./openspec-project-files/01-active-surface-and-archive-discipline/) [02-minimal-context-and-curated-skills](./openspec-project-files/02-minimal-context-and-curated-skills/) [03-codex-explanation-order-rules](./openspec-project-files/03-codex-explanation-order-rules/) [07-openspec-and-codex-devops-workflow](./openspec-project-files/07-openspec-and-codex-devops-workflow/) |
| 搜索与路由 | 管 quote、artifact、memory 的路由顺序和 provenance contract | 5 | [04-trace-first-quote-routing](./openspec-project-files/04-trace-first-quote-routing/) [06-openmemory-recall-mvp](./openspec-project-files/06-openmemory-recall-mvp/) |
| Artifact / 缓存 / 可观测性 | 管本地 artifact cache、DVC 版本层和 Langfuse trace 体系 | 8 | [09-artifact-first-local-cache-mvp](./openspec-project-files/second-tier-sanitized/09-artifact-first-local-cache-mvp/) [10-langfuse-observability-foundation](./openspec-project-files/second-tier-sanitized/10-langfuse-observability-foundation/) [11-dvc-artifact-foundation](./openspec-project-files/second-tier-sanitized/11-dvc-artifact-foundation/) |
| 记忆 / Recall | 管 durable/session/evidence 分层、recall budget 和最小 recall 接入 | 4 | [05-memory-governance-and-recall-policy](./openspec-project-files/05-memory-governance-and-recall-policy/) [06-openmemory-recall-mvp](./openspec-project-files/06-openmemory-recall-mvp/) |
| 工具 / 技能工作流 | 把表达方式和工作流固化成 skill 或可复用操作方法 | 10 | [08-shell-semantic-canvas-skill](./openspec-project-files/08-shell-semantic-canvas-skill/) |
| 研究 / 评审 / 审计 | 管论文深读、研究框架和后续 review / brief / report 的沉淀；研究相关统计是 `strict research/study = 2`、`broad research/evaluate/audit = 4`、`summary = 3`、`review / brief / report = 5` | 1 | [12-agent-context-paper-framework](./openspec-project-files/second-tier-sanitized/12-agent-context-paper-framework/) |



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
