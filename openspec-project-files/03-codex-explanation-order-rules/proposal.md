## Why

当前已经明确：关于复杂系统、wrapper、artifact、Langfuse、memory 等链路的解释，先使用“架构语言”会显著降低可理解性。问题不在概念本身，而在解释顺序错误。需要把一组专门面向本机 Codex 的“解释顺序 / prompt rules”提炼成独立对象，用于后续部署到长期配置，而不是继续散落在临时对话里。

这组 rules 不属于 `add-minimal-context-and-curated-skills-governance` 的治理正文。治理 change 负责决定“这类东西该不该进入长期配置、应放在哪一层”；本 change 负责产出“具体要写进去的内容”。

## What Changes

- 新增一个专门面向 Codex 的 explanation-order rules change
- 提炼一组可长期复用的规则，约束解释复杂链路时的顺序和语言风格
- 产出一份可直接部署到 Codex 配置的 rules 草案
- 明确这组 rules 与长期治理 change、task-scoped 解释、临时对话说明之间的边界

## Capabilities

### New Capabilities
- `codex-explanation-order-rules`: 一组用于复杂系统解释、工具链说明和链路拆解的长期规则，强调先讲“我怎么做”，再讲系统流转，最后才讲架构层。

### Modified Capabilities

## Impact

- 为本机 Codex 的长期配置提供一组高价值、低歧义的解释顺序规则
- 降低复杂链路说明中的理解偏差和“套娃调用”误解
- 与最小长期配置治理保持一致：只引入高价值、跨任务稳定成立的解释约束
- 不直接部署到现有 `AGENTS.md` / root rules，本 change 只先产出规则对象
