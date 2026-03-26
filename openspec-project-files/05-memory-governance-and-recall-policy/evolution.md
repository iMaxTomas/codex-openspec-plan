# 思路进化说明

## 起点问题

最小 recall loop 能工作，不代表记忆层已经可治理。真正的问题通常出在 authority、生命周期、召回预算和覆盖规则没有先讲清楚。

## 第一阶段误区

- 只讨论“怎么记住更多”
- 没先区分 durable、session、evidence
- 没有定义 `stale` 和 `superseded`
- 让低权威写入静默覆盖高权威记忆

## 收敛后的抽象

最终把记忆层收敛成：
- authority layers
- lifecycle states
- time buckets
- recall budget
- promotion rules
- evaluation checklist

## 为什么值得复用

这是一个比“接哪个 memory provider”更上游的计划。任何要做长期记忆的项目，都需要先定义治理合同，否则 provider 越多只会越乱。

## 迁移建议

- 先定 authority 层，不要先上 automation
- 再定 recall budget
- 最后再让具体 provider 去实现这些合同
