# 思路进化说明

## 起点问题

重复联网、重复抓取和重复上下文消耗，本质上不是“模型不够强”，而是缺少一个本地优先的 artifact 缓存底座。

## 第一阶段误区

- 直接上多 agent 协作
- 直接上 DVC / MLflow / W&B
- 先做复杂控制平面，再做本地 cache

## 收敛后的抽象

先做一个最小可运行的 local cache MVP：
- `.artifact-cache/` 目录结构
- `index.sqlite`
- `query-rounds.jsonl`
- `tool-calls.jsonl`
- cache-first helper

## 为什么值得复用

它把“先查本地缓存、未命中再联网”的工作流从想法变成了可执行 OpenSpec 计划。任何做 research/search/web fetch 的 agent 项目都能复用这个抽象。

## 迁移建议

- 先替换 `<repo-root>` 和你自己的 helper 命令
- 保留 raw / derived / traces / index 的边界
- 暂时不要在 MVP 阶段引入更重的控制平面
