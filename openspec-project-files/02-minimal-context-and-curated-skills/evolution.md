# 思路进化说明

## 起点问题

很多 AI 项目一开始都会把“越多上下文越好”当成默认策略，最后把太多规则、背景、流程和一次性信息塞进长期配置。

## 第一阶段误区

- 把所有知识都写进 `AGENTS.md`
- 把临时任务上下文误当成长期规则
- 把 procedural knowledge 和 durable constraints 混成一个层

## 收敛后的抽象

最终收敛成 3 层边界：
- 长期配置只放高价值、不可推断、跨任务稳定成立的约束
- procedural knowledge 优先下放到 curated skills
- 一次性任务信息留在 task-scoped plan / OpenSpec change

## 为什么值得复用

任何在用 `AGENTS.md`、`rules`、`skills`、`prompts` 的项目，都会遇到长期上下文膨胀问题。这份计划不是给某一个模型写的，而是给“长期配置层如何变小”写的。

## 迁移建议

- 先定义你自己的长期配置准入规则
- 再定义哪些知识必须变成 skill
- 最后建立周期性 audit，而不是只做一次清理
