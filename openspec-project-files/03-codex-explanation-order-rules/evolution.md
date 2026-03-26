# 思路进化说明

## 起点问题

复杂系统一旦从“架构层”开讲，用户很容易误解成递归调用、双重 wrapper 或魔法记忆，理解成本会迅速变高。

## 第一阶段误区

- 先讲 taxonomy，再讲操作链
- 解释中没有主动排除常见误解
- diagram 先画结构，不先画动作

## 收敛后的抽象

最终收敛成固定顺序：
- 先讲第一人称 action chain
- 再明确 `not this, but this`
- 再讲谁启动谁、结果存在哪里、下次怎么复用
- 最后才讲 architecture 和 decomposition

## 为什么值得复用

这不是某个项目专属的 prompt，而是一条解释复杂工具链时都适用的表达规则。只要你的项目里有 wrapper、artifact、trace、memory、control plane，这套顺序就有价值。

## 迁移建议

- 保留顺序，不必保留原文措辞
- 把你自己项目的常见误解补成 `not this, but this`
- diagram 也要遵循同一顺序
