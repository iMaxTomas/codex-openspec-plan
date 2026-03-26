# 思路进化说明

## 起点问题

artifact 和 DVC 解决的是文件资产，不是 agent 执行链的可观测性。没有统一 trace backend 时，执行历史只能散落在临时日志和聊天回忆里。

## 第一阶段误区

- 继续拼装零散日志
- 让 observability backend 同时承担 artifact 和 memory
- 为了可观测性再造一套平台

## 收敛后的抽象

先采用一个中立、自托管友好的 trace backend：
- `Langfuse` 只管 trace
- raw artifact 继续留在本地 artifact 层
- memory 继续留给独立 continuity / recall 层
- ingestion adapter 保持很薄

## 为什么值得复用

这份计划解决的是“trace / artifact / memory 到底怎么分层”，而不是某个单一 vendor 的安装教程。很多 agent 项目都会卡在这一步。

## 迁移建议

- 保留 `metadata-first` 和 `redaction-first`
- 用你自己的 `<future-control-plane>` 名称替换现场占位符
- 先接主执行器，再接其它执行面
