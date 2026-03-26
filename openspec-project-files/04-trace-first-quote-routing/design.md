## Context

当前系统对三层边界已经有稳定共识：

- `trace` 负责 run / session / timeline / event 检索
- `artifact` 负责跨会话复用的证据对象和研究摘要
- `memory` 负责提炼后的稳定结论

问题不在于边界缺失，而在于还没有把 operator-facing question 明确分成不同类型，并据此决定默认先查哪一层。结果是像“把我当时原话一字不差找出来”这种本应 `trace-first` 的请求，仍可能被最近、最显眼、语义最像的 artifact 或 memory 结果抢答，进而把相近主题线混成一条。

这次 correction change 的重点不是新建 memory layer、artifact store 或 observability backend，而是把已经存在的分层边界真正转成一条可执行的问题路由合同。

## Goals / Non-Goals

**Goals:**

- 把 context-recall 相关问题固定分成 `trace question`、`artifact question`、`memory question`
- 固定三类问题的默认路由优先级，尤其是 exact quote / prior turn / prior question 这类请求必须 `trace-first`
- 定义 exact-quote 与 provenance-sensitive answers 的最小证据合同
- 定义相近线程并存时的显式去歧规则，防止系统直接沿语义最近的一条线程抢答
- 为后续实现型 change 留出清晰接口，以便接入本地 trace lookup、artifact verify、memory backlink

**Non-Goals:**

- 不在本 change 中实现新的 trace backend 或 transcript database
- 不在本 change 中扩张 `OpenMemory`、`Langfuse`、`.artifact-cache` 的职责
- 不在本 change 中重做 review-board 或 claim-gate 体系
- 不把所有问题都强制改成 `trace-first`
- 不在本 change 中实现完整的 runtime 代码接缝

## Decisions

### 1. 先按 operator-facing intent 分类问题，而不是按底层存储反推

这条 change 固定至少三类问题：

- `trace questions`
  - 例如：`我上一句说了什么`
  - `把我当时的原话找出来`
  - `这段话对应哪次提问`
- `artifact questions`
  - 例如：`上次研究出了什么`
  - `把当时的搜索路线找出来`
  - `有哪些文件和结论`
- `memory questions`
  - 例如：`你还记得我长期在意什么吗`
  - `我们形成了什么稳定理解`

原因：

- 用户是按意图提问，不是按存储层提问
- 先按问题类型分类，才能稳定决定先查哪一层

替代方案：

- 只分 `exact` 与 `non-exact`
  - 放弃原因：无法把 artifact-summary 和 memory-recall 的边界分开
- 直接按存储层让模型自由选择
  - 放弃原因：仍会回到语义相似度抢答

### 2. exact quote / provenance lookup 固定为 `trace-first`

当用户请求：

- 原话
- 上一句
- 哪次提问
- 一字不差

默认顺序固定为：

`trace -> artifact verify -> memory optional`

原因：

- 这类请求本质是 provenance lookup，不是主题总结
- `trace` 才能优先回答时间顺序和逐字上下文
- `artifact` 适合做补证，不适合做原始逐字回放主入口
- `memory` 只能补背景，不能替代 exact quote authority

替代方案：

- 所有 recall 都 `trace-first`
  - 放弃原因：会明显增加普通总结类请求的成本
- `artifact-first`
  - 放弃原因：artifact 擅长证据摘要，不擅长逐字 turn replay
- `memory-first`
  - 放弃原因：memory 只保存稳定结论，不保存逐字历史

### 3. 声称“这是原话”时，必须满足最小 provenance contract

如果回答声称：

- “这是你当时的原话”
- “你上一句就是这么说的”
- “这句话对应的是那次提问”

那至少必须能回指：

- `source session`
- `source turn` 或等价的对话定位锚点
- `source trace id`，如果 trace backend 可用
- `artifact reference`，如果回答依赖某个摘要或研究记录

如果这些锚点不足，则系统不得继续把答案表述成“逐字确定”；必须降级成：

- 明示不确定
- 或先请求用户确认是哪条线

原因：

- exact quote claim 的风险，不在主题大方向，而在错误地宣称“这是原文”

替代方案：

- 允许模型只凭高置信语义匹配直接说“就是这句”
  - 放弃原因：这正是本次错位的直接机制

### 4. 相近主题并存时，必须显式去歧

当系统同时命中多条主题相近、但 provenance 不同的线程时，不允许直接选语义最像的一条。

必须先显式去歧，例如指出：

- `review-board / 低级错误扩散`
- `AI 模块化 / ontology`

这两条都是相关线，但不是同一轮问题。

原因：

- 线程相关性并不等于来源相同
- 一旦不去歧，模型会把“最近主题”误当“正确来源”

替代方案：

- 用最近时间优先
  - 放弃原因：最近不等于正确来源
- 用最强语义相似度优先
  - 放弃原因：相似不等于 provenance 一致

### 5. 这条 change 先固定治理合同，后续实现再单独接 runtime

本 change 只先固定：

- question classes
- routing priority
- provenance contract
- ambiguity rule

后续如果需要接实际 runtime，应单独做实现型 change，例如：

- 本地 trace query helper
- wrapper 中的 question router
- operator-visible provenance footer

原因：

- 当前最急的是先修正“该怎么答”与“凭什么这样答”
- 不是立刻重写存储或后端

替代方案：

- 直接同时做 runtime 实现
  - 放弃原因：会把窄修补再次膨胀成基础设施 change

## Risks / Trade-offs

- [Risk] `trace-first` 触发条件如果过宽，会拖慢普通研究总结类请求
  -> Mitigation: 只对 `原话 / 上一句 / 一字不差 / 哪次提问` 这类强 provenance 触发词启用硬路由

- [Risk] 某些运行环境里，精确 `turn id` 还没有稳定暴露
  -> Mitigation: 允许先用 `session + local thread position + trace id` 作为过渡锚点，并在回答里显式声明证据等级

- [Risk] 去歧会让部分回答多一步确认，看起来更慢
  -> Mitigation: 只在同时命中两条以上高相似线程时启用，不把所有 recall 都变成问答往返

- [Risk] 如果实现层直接把 artifact 当 transcript 用，仍会绕过本 change
  -> Mitigation: 在 spec 中明确 artifact 只能做验证和补证，不能充当 exact quote authority

## Migration Plan

1. 接受这条 correction change，固定 question-routing 和 provenance-answer 的治理合同
2. 在后续实现型 change 中，优先把 `quote lookup` 接成 `trace-first`
3. 用至少两个 reference cases 做验证：
   - `review-board / 低级错误扩散`
   - `AI 模块化 / ontology`
4. 验证系统是否能区分：
   - exact quote
   - artifact summary
   - durable memory recall
5. 如果发现规则过重，仅回退触发词和去歧阈值，不回退三层边界本身

## Open Questions

- 当前 thread 内的聊天历史，是否应被视为 `trace authority` 的第一优先过渡来源，直到统一的本地 trace query helper 就位？
- 如果某些环境没有稳定 `source turn id`，最小可接受的 exact-quote 锚点组合是什么？
- operator-facing 回答是否要显式标出来源层，例如 `trace-derived`、`artifact-derived`、`memory-derived`？
