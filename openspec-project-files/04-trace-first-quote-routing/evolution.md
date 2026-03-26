# 思路进化说明

## 起点问题

当用户问“把我当时的原话找出来”时，系统如果没有先判断这是 `trace` 问题，往往会被 artifact 或 memory 的语义相似度带偏。

## 第一阶段误区

- 把所有 recall 都当成同一种 retrieval
- 直接用最像的内容回答 exact quote
- 没有给 provenance 敏感问题单独设合同

## 收敛后的抽象

最终收敛成两部分：
- 先分类问题：`trace / artifact / memory`
- 再固定路由优先级和 provenance contract

其中最关键的是：
- exact quote 必须有 anchor
- memory 和 artifact 不能冒充 exact-quote authority
- 主题相近但 provenance 不同的线程必须先显式去歧

## 为什么值得复用

任何做 recall、memory、artifact、conversation history 的系统，都会碰到“原话查找”和“摘要回忆”混淆的问题。这份计划能把问题拆干净。

## 迁移建议

- 先定义你自己的问题分类词典
- 再定义 exact quote 的证据门槛
- 最后再考虑做自动路由实现
