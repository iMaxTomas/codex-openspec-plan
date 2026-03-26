## Why

当前已经形成了一种高价值的解释风格：把整个 shell 当成白板，用中心主题、错链、控制链、证据和复用区域来帮助理解复杂概念。问题不在于能不能画出一张好图，而在于这套风格还停留在临时对话里，缺少可复用的触发条件、语义原子、布局选择规则和反模式约束，后续很容易退回普通段落或僵化模板。

## What Changes

- 新增一个专门的 `shell-semantic-canvas` skill 计划，用于把 shell 白板式解释固化成长期可复用能力
- 定义 skill 的最小固定单元为语义卡片、连接语义、operator-first 叙述骨架和 `not this, but this` 纠偏单元，而不是固定一张版式
- 定义 skill 的布局选择系统，而不是单一模板；至少覆盖默认总览布局、流程脊柱布局、角色泳道布局、对照布局和分层布局
- 定义何时使用默认 `left/center/right/bottom` 原型，何时改用别的原型，何时在同一张 shell 画布里混搭主布局和副布局
- 定义 skill 的 references 结构，把布局原型、展开策略和反模式放到按需读取的参考资料里，而不是全部塞进 `SKILL.md`
- 明确这条 change 不是在固定 `L0/L1/L2` 硬模板，也不是只服务于“低级错误控制”一个主题

## Capabilities

### New Capabilities

- `shell-semantic-canvas-skill`: Provide a reusable skill that explains complex concepts as shell-whiteboard canvases by fixing semantic building blocks and layout-selection rules without freezing the output into one rigid template

### Modified Capabilities

- None

## Impact

- Affected systems:
  - `.codex/skills/` skill library for Codex-local workflows
  - explanation style for complex concept walkthroughs, control flows, wrappers, governance chains, memory/search/routing explanations, and similar topics
- Affected artifacts:
  - a new skill folder with `SKILL.md` and reference files for layout selection, layout patterns, expansion strategies, and anti-patterns
- Related references:
  - `openspec/changes/add-codex-explanation-order-rules/`
  - `openspec/changes/add-ascii-markdown-canvas-cards/`
