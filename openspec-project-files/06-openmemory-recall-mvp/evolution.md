# 思路进化说明

## 起点问题

已有 `wrapper -> artifact -> trace` 主链时，最容易犯的错误是继续把 recall 需求塞进 artifact 或 trace，而不是给记忆层留一条最小而明确的支路。

## 第一阶段误区

- 想一次做完整 memory layer
- 想让 Langfuse 或 artifact 直接承担记忆职责
- 一上来就引入 graph、decay、自动 promote

## 收敛后的抽象

最终收敛成一个很薄的 MVP：
- `search before run`
- `add after run`
- 只保留少量 memory types
- 只保留必要 back-links
- 明确不在 MVP 里做 graph 和 decay

## 为什么值得复用

它很适合那些已经有执行链、证据链，但还没有长期短记忆层的项目。重点不是 provider 名字，而是“先接一条最小可运行支路”。

## 迁移建议

- 把 OpenMemory 换成你自己的 memory backend 也可以
- 保留读写顺序和 metadata contract
- 不要在 MVP 阶段扩大自动化范围
