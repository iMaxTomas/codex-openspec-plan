## Context

你现在要的不是“以后都画同一张 shell 图”，而是把一种已经验证有效的解释方式固化成长期可复用能力。

先按操作者视角讲清楚：

我提一个需要解释的概念  
-> `shell-semantic-canvas` skill 被触发  
-> skill 先判断这次是概念纠偏、流程说明、角色分工、前后对照，还是分层解释  
-> skill 选一个主布局原型，必要时再混一个副原型  
-> skill 用固定的语义卡片来排布，而不是套死一张模板  
-> 它输出一张 shell 白板  
-> 下次我解释别的主题，复用的是“语义语法 + 选图规则”，不是上一张图的具体版式

不是这样：

- 不是把 `L0/L1/L2` 固定成唯一合法结构
- 不是把 `left/center/right/bottom` 固定成唯一布局
- 不是让 skill 变成一个 ASCII 模板填空器
- 不是把所有布局细节都塞进 `SKILL.md`

所以这条 change 的重点是：固定“语义原子和布局选择系统”，而不是固定“版式骨架”。

## Goals / Non-Goals

**Goals:**

- 定义 `shell-semantic-canvas` skill 的最小固定单元
- 定义 skill 的布局选择规则，而不是单一模板
- 定义默认原型和若干替代原型，以及主布局/副布局的组合方式
- 定义 skill 的 references 结构，把详细布局信息移出 `SKILL.md`
- 保持 operator-first、视觉优先、可展开、但不过度模板化

**Non-Goals:**

- 不在本 change 中固定某一张唯一白板图
- 不在本 change 中实现 Obsidian `.canvas` 文件生成
- 不在本 change 中替代 `ascii-art-generator` 的通用职责
- 不在本 change 中要求每次解释都出现完整多层展开
- 不在本 change 中把所有解释任务都强制走 shell 画布风格

## Decisions

### 1. 固定语义原子，不固定整张版式

skill 固定的最小单元是语义卡片，而不是整张模板。

固定卡片角色至少包括：

- `question`
- `core-judgment`
- `wrong-path`
- `right-path`
- `gate-or-owner`
- `artifact-or-evidence`
- `reuse`
- `correction`

原因：

- 真正跨主题稳定复用的是信息角色，而不是卡片坐标
- 如果一开始就固定整张图，skill 会退化成模板填空器

替代方案：

- 直接固定整张左中右下模板
  - 放弃原因：太僵，不能覆盖流程、分工、对照、分层等不同主题

### 2. 把 `L0/L1/L2` 保留为内部展开深度，不作为输出契约

`L0/L1/L2` 可以保留给内部思考，用来表示“总览、局部展开、子局部展开”的粒度。

但对外输出时，skill 不应强制显式出现这些层级名，也不应把它们当作唯一结构。

原因：

- 层级只是展开深度，不是布局语法
- 用户理解的是“总览 vs 局部展开”，不是层级标签本身

替代方案：

- 把 `L0/L1/L2` 写成 skill 强制输出格式
  - 放弃原因：会误把展开深度写死成固定排版

### 3. 采用“默认原型 + 替代原型 + 混搭规则”的布局系统

默认原型：

- `Center + Sidebars`

替代原型至少包括：

- `Pipeline Spine`
- `Swimlane Whiteboard`
- `Split Compare`
- `Layer Stack`

组合规则：

- 每次解释先选一个主原型
- 必要时选一个副原型做局部展开
- 不要求每次必须混搭

原因：

- 不同主题对布局的要求不同
- 先选主题语法，再画图，才能维持高自由度和高可读性

替代方案：

- 永远使用默认原型
  - 放弃原因：无法覆盖多角色、强时间轴、强分层、强对照的主题

### 4. `SKILL.md` 保持极短，详细内容移入 references

`SKILL.md` 只固定：

- 触发条件
- operator-first 输出顺序
- 语义原子
- 布局选择原则
- 关键禁忌

详细内容放入：

- `references/layout-selection.md`
- `references/layout-patterns.md`
- `references/expansion-strategies.md`
- `references/anti-patterns.md`

原因：

- skill 的目标之一就是省 token
- 详细布局原型和示例本来就应该按需读

替代方案：

- 把所有原型和示例都写进 `SKILL.md`
  - 放弃原因：skill 会变重，而且不利于维护

### 5. 明确允许“部分区缺席”和“不对称布局”

skill 必须允许：

- 某些区在简单主题中缺席
- 卡片数量随主题复杂度变化
- 不完全对称的白板布局

原因：

- 否则输出会退化成终端表格
- 白板感来自空间组织，不来自机械对称

替代方案：

- 强制每次保留完整区域和对称布局
  - 放弃原因：会损失视觉弹性和主题适配能力

## Risks / Trade-offs

- [风险] skill 仍然被写成模板引擎 -> 缓解：spec 明确固定语义原子和选择规则，不固定单一版式
- [风险] 布局原型太多，选择成本过高 -> 缓解：先控制在 5 种以内，并要求每次只选主原型，必要时再加副原型
- [风险] `SKILL.md` 过长，反而不省 token -> 缓解：把详细原型和示例都放进 references
- [风险] skill 触发过宽，普通问题也被硬画成白板 -> 缓解：触发条件明确绑定视觉化解释意图和复杂概念解释场景
- [风险] skill 触发过窄，实际使用率低 -> 缓解：触发词覆盖用户自然表达，例如“shell 画布”“白板风格”“终端白板”“像 canvas 一样讲”

## Migration Plan

1. 先定义 skill capability 的 requirements
2. 再定义语义原子、布局系统和 references 拆分
3. 再定义触发条件、反模式和输出节奏
4. 再通过若干真实主题做 forward-test，验证不会退化成模板填空
5. 最后再决定是否需要补 `agents/openai.yaml`

## Open Questions

- 是否需要把“默认原型选择失败时的回退策略”写成显式规则
- 是否需要补一个专门面向长主题的“多屏延展”策略
