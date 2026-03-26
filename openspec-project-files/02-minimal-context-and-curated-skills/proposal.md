## Why

当前已经有一个较大的 AI 基础环境总纲，但根据对 `Evaluating AGENTS.md` 与 `SkillsBench` 的阅读，真正紧迫的问题不是继续扩展能力层，而是收敛长期上下文的边界。若不先明确“什么信息应进入 repo-level config、什么应进入 curated skills、什么只能保留在 task-scoped plan 中”，后续对 Codex 的 `AGENTS.md`、rules、skills 和其他配置文件的部署很容易继续膨胀，重复论文中指出的上下文污染与成本上升问题。

## What Changes

- 新增一个专门面向最小上下文与 curated skills 治理的 change，用于约束本机 Codex 及类似 AI 工具的长期配置形态。
- 定义 repo-level config 的最小化原则，限制 `AGENTS.md / CLAUDE.md / 其他长期配置文件` 只能承载不可推断、强约束、高价值信息。
- 定义哪些知识必须进入 curated skills，而不是继续塞进全局配置。
- 定义哪些信息只能存在于 task-scoped plan 或 OpenSpec change 中，禁止固化为长期上下文。
- 定义对现有 `add-ai-agent-base-environment` 总纲的收敛路径，使其从“大而全蓝图”退回为上层总纲，而把具体治理边界下放到本 change。

## Capabilities

### New Capabilities
- `minimal-context-and-curated-skills`: 定义 AI 工具长期配置、curated skills 和 task-scoped planning 之间的边界、准入规则和周期审查要求

### Modified Capabilities
- `ai-agent-base-environment`: 收敛其对长期配置层的要求，使其不再默认鼓励将大量知识写入全局上下文

## Impact

- 影响本机 Codex 的 `AGENTS.md`、rules、skills、prompt 和其他配置文件的组织方式
- 影响 `add-ai-agent-base-environment` 的后续落地顺序和边界划分
- 为后续周期性配置审查提供判断标准
- 降低长期上下文膨胀、错误引导和成本上升风险
