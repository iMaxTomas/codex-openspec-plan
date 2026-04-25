# 可复用 OpenSpec 计划项目

这里收纳的是两组可公开复用的 OpenSpec 计划包：

English: [README.en.md](./README.en.md)

- 第一梯队：9 个低环境绑定 package
- 第二梯队：4 个经过脱敏后公开的 package

每个子目录都包含：
- `proposal.md`
- `design.md`
- `tasks.md`
- `specs/`
- `evolution.md`
- second-tier package 额外包含 `sanitization-notes.md`

使用说明：
- 这些 `proposal/design/tasks/specs` 是从当前 `document-test` 工作区复制出来的核心 OpenSpec 文件。
- 一部分文件仍保留原始项目名、本地路径或 `Codex` 术语。
- 公开复用时，先看 `evolution.md`，再把 repo 名、运行时名、路径和阈值替换成你自己的环境。

## 推荐顺序

1. 先用 `01-active-surface-and-archive-discipline` 收窄执行面。
2. 再用 `02-minimal-context-and-curated-skills` 和 `03-codex-explanation-order-rules` 管住长期规则层。
3. 之后接 `04-trace-first-quote-routing`、`05-memory-governance-and-recall-policy`、`06-openmemory-recall-mvp` 建 recall 与 provenance 主线。
4. 再看 `07-openspec-and-codex-devops-workflow` 和 `09-strategy-card-output-governance`，把治理门和大输出命令管住。
5. 最后看 `08-shell-semantic-canvas-skill`，把表达能力固化下来。

## 第二梯队脱敏公开包

第二梯队统一放在：

- [second-tier-sanitized/README.md](./second-tier-sanitized/README.md)

它们适合这样使用：
- 先看第一梯队，理解治理和方法层
- 再看 second-tier，理解 artifact / observability / DVC / 研究框架这些更接近执行现场的计划
- second-tier 默认都按 `reusable after local replacement` 看待

## 目录索引

| 目录 | 适用问题 | 入口 |
|---|---|---|
| `01-active-surface-and-archive-discipline` | change 太多、主线被噪音淹没、归档节奏失控 | [evolution.md](./01-active-surface-and-archive-discipline/evolution.md) |
| `02-minimal-context-and-curated-skills` | 长期配置越来越大，不清楚什么该进 rules/skills/plan | [evolution.md](./02-minimal-context-and-curated-skills/evolution.md) |
| `03-codex-explanation-order-rules` | 复杂系统解释顺序混乱，用户容易误解调用链 | [evolution.md](./03-codex-explanation-order-rules/evolution.md) |
| `04-trace-first-quote-routing` | 原话、artifact、memory 经常混答，provenance 不稳 | [evolution.md](./04-trace-first-quote-routing/evolution.md) |
| `05-memory-governance-and-recall-policy` | 记忆层能用但没有 authority、budget、lifecycle | [evolution.md](./05-memory-governance-and-recall-policy/evolution.md) |
| `06-openmemory-recall-mvp` | 想加最小 recall，但不想把 artifact/trace 职责搅乱 | [evolution.md](./06-openmemory-recall-mvp/evolution.md) |
| `07-openspec-and-codex-devops-workflow` | OpenSpec、repo 规则、host 配置和验证门槛没有统一工作流 | [evolution.md](./07-openspec-and-codex-devops-workflow/evolution.md) |
| `08-shell-semantic-canvas-skill` | 想把高价值的 shell 白板解释固化成可复用 skill | [evolution.md](./08-shell-semantic-canvas-skill/evolution.md) |
| `09-strategy-card-output-governance` | 大输出命令、sidecar、wrapper、artifact 和二次搜索缺少开工前合同 | [evolution.md](./09-strategy-card-output-governance/evolution.md) |

## 哪些最容易直接复用

- `01-active-surface-and-archive-discipline`
- `02-minimal-context-and-curated-skills`
- `03-codex-explanation-order-rules`
- `04-trace-first-quote-routing`
- `05-memory-governance-and-recall-policy`
- `09-strategy-card-output-governance`

这 5 个最偏治理和方法论，环境绑定最低。

## 哪些需要改名改路径后再用

- `06-openmemory-recall-mvp`
- `07-openspec-and-codex-devops-workflow`
- `08-shell-semantic-canvas-skill`
- `second-tier-sanitized/*`

这些 package 依然很值得复用，但通常需要先替换：
- repo 名
- 路径
- 运行时名
- 本地工具名
- 你自己的验证命令
