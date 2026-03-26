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

主页这里不再按梯队看，而是按架构层来看。完整下载索引仍在：
- [openspec-project-files/README.md](./openspec-project-files/README.md)
- [openspec-project-files/second-tier-sanitized/README.md](./openspec-project-files/second-tier-sanitized/README.md)

这些公开包统一保留：
- `proposal.md`
- `design.md`
- `tasks.md`
- `specs/`
- `evolution.md`

其中 second-tier 脱敏公开包还额外带 `sanitization-notes.md`。

| 架构层 | 它回答什么问题 | OpenSpec change 数量 | 可复用计划项目 | 研究/摘要与复用说明 |
|---|---|---:|---|---|
| 运行基座与 A2A / transport | host/VM103/NFS/SMB/runner/双 Codex/多 provider 怎么协作 | 12 | 当前主页不主推通用公开包 | 这层环境绑定强，更适合当架构参考而不是原样下载 |
| 规则治理 | AI 应该怎么解释、怎么治理、怎么避免低级错误和上下文膨胀 | 11 | `01-active-surface-and-archive-discipline` `02-minimal-context-and-curated-skills` `03-codex-explanation-order-rules` `07-openspec-and-codex-devops-workflow` | 治理型 package 最容易直接复用 |
| 搜索与路由 | 先查 memory 还是先搜网页，quote/provenance 怎么路由 | 5 | `04-trace-first-quote-routing` `06-openmemory-recall-mvp` | 适合先复用 contract，再替换自己的路由入口 |
| Artifact / 缓存 / 可观测性 | 结果怎么落盘、缓存、版本化、追踪 | 8 | `09-artifact-first-local-cache-mvp` `10-langfuse-observability-foundation` `11-dvc-artifact-foundation` | 已有脱敏公开包；默认按 `reusable after local replacement` 使用 |
| 记忆 / Recall | durable/session/evidence 怎么分层，RecallNest 怎么工作 | 4 | `05-memory-governance-and-recall-policy` `06-openmemory-recall-mvp` | 适合先复用分层和 budget，再替换具体 provider |
| 工具 / 技能工作流 | 把能力变成 Obsidian、gitagent、canvas、bili 等可复用工作流 | 10 | `08-shell-semantic-canvas-skill` | 当前公开包以 skill 设计和表达方法为主 |
| 研究 / 评审 / 审计 | 论文深读、evaluate、audit、review 怎么组织 | 1 | `12-agent-context-paper-framework` | `strict research/study = 2` `broad research/evaluate/audit = 4` `summary = 3` `review / brief / report = 5` |



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
