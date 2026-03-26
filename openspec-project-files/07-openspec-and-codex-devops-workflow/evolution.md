# 思路进化说明

## 起点问题

当 OpenSpec、repo 规则、skills、脚本入口和 host 安装态配置同时存在时，如果没有统一变更生命周期，就会出现“哪些是源码、哪些是投影、哪些要验证后才能推广”全部混杂的问题。

## 第一阶段误区

- 把 live install path 当成唯一真相源
- 让 repo 规则、host 配置和验证门槛分散在各个 change
- 没有统一的 adoption gate 和 evidence bundle

## 收敛后的抽象

最终收敛成一条 governed workflow：
- inventory durable surfaces
- 分清 source-of-truth 和 deployment target
- 统一 validation / test / revalidation
- adoption 前要求 evidence 和 optimization review

## 为什么值得复用

只要你的团队同时管理 OpenSpec、repo 规则和运行时配置，这份计划就有价值。它解决的是治理流程，而不是某台机器本身。

## 迁移建议

- 这份计划里的 `~/.codex`、repo 路径和 host/runtime 名称都要替换
- 公开复用时，优先复用 workflow 和 gate，不要照搬路径
- 最适合作为团队治理模板，而不是一键部署脚本
