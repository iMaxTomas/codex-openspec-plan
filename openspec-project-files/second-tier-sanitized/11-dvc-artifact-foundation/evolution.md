# 思路进化说明

## 起点问题

本地 artifact cache 已经能运行，但还没有一个成熟的文件版本层。直接把整个 cache 都塞进 DVC 会破坏 runtime lookup 边界，不做版本层又会让高价值 artifact 缺少长期管理。

## 第一阶段误区

- 把整个 `.artifact-cache/` 直接交给 DVC
- 让 `index.sqlite` 和 trace 日志一起进 DVC
- 一开始就同时做 remote storage、MLflow、W&B

## 收敛后的抽象

把 DVC 包拆成两步：
- 顶层 package 先定义 integration contract
- `follow-up-initialize/` 再执行最小初始化

这样可以先讲清楚边界，再执行最小落地。

## 为什么值得复用

任何已经有本地 artifact cache 的项目，下一步都可能遇到“版本层该从哪接”的问题。这份包把规划和最小执行分开，复用性比一把梭初始化更高。

## 迁移建议

- 先读顶层 `proposal / design / specs`
- 再看 `follow-up-initialize/`
- 替换 `<repo-root>`，并重新确认你自己的高价值目录集合
