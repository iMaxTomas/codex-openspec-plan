## Context

当前已经明确：

- raw artifact、trace、checkpoint、memory 必须分层
- 研究数据、命令输出、bug 证据、环境快照、远端执行结果都可以进入 artifact scope
- 当前最短路径是先做 local-first artifact cache，而不是先做完整 memory layer

因此这条 change 的实现边界应非常克制：

- 只面向当前 `Codex` 主执行器
- 只实现本地 cache foundation
- 只做最小 wrapper / fetch helper
- 只做本地验证

不提前引入：

- DVC versioning
- MLflow / trace 平台
- W&B 协作层
- <future-control-plane> 完整 control plane

## Goals / Non-Goals

**Goals:**
- 在仓库中部署 `.artifact-cache/` MVP 结构
- 提供可初始化的 `sqlite` 索引和 `jsonl` trace 文件
- 提供至少一个可复用的 cache-first fetch helper
- 让 agent 可以先查本地 artifact，再联网
- 让高体积结果优先落 raw artifact，只回 compact summary

**Non-Goals:**
- 本 change 不做 durable memory
- 本 change 不做 DVC 集成
- 本 change 不做 MLflow / Langfuse / LangSmith / Braintrust 接入
- 本 change 不做多 agent 自动协作

## Decisions

### 1. MVP 目录直接放在当前仓库内
当前 MVP 的 `.artifact-cache/` 直接放在当前仓库中，便于立刻被 `Codex` 使用和版本化设计。

原因：
- 当前目标是本地优先
- 当前需要最短路径验证
- 这能避免在一开始引入额外服务或全局路径依赖

### 2. `sqlite` 作为主索引，`jsonl` 作为附加 trace
MVP 采用：

- `sqlite` 存统一 artifact 查询索引
- `jsonl` 存 append-only query/tool traces

原因：
- `sqlite` 适合 cache-first lookup
- `jsonl` 适合低成本追加日志
- 二者都适合本地优先和脚本化

### 3. 先做一个通用 fetch helper，而不是多个专用系统
首阶段应优先提供一个最小的 cache-first fetch helper，抽象通用流程：

1. build canonical key
2. lookup sqlite
3. cache hit -> return compact payload
4. cache miss -> fetch -> save raw -> save summary -> index -> return compact payload

原因：
- 先验证最核心行为变化
- 避免一开始写太多 source-specific wrapper

### 4. 先验证两类 workflow
MVP 至少验证：

- 一个 search workflow
- 一个 web 或 GitHub workflow

原因：
- 这两类最能体现 artifact-first 的价值
- 也最贴近当前实际使用场景

## Implementation Shape

```text
repo/
└── .artifact-cache/
    ├── raw/
    ├── derived/
    ├── traces/
    └── index.sqlite

scripts/
└── artifact-cache/
    ├── init_cache.py
    ├── fetch_with_cache.py
    └── summarize_artifact.py
```

首阶段无需把脚本名完全锁死，但实现上应至少具备：

- 初始化缓存结构
- 执行 cache-first fetch
- 产出 compact summary

## Validation

MVP 需要两类验证：

### 1. Cache miss path
- 第一次访问资源
- raw artifact 被写入
- summary 被写入
- sqlite 和 jsonl 被写入

### 2. Cache hit path
- 第二次访问同一资源
- 不重新联网
- 直接返回 compact payload

## Risks / Trade-offs

- [风险] helper 设计过早泛化 -> 缓解：只覆盖当前 search/web/github 基本流程
- [风险] summary 生成仍太长 -> 缓解：明确 compact payload 结构
- [风险] 仓库内缓存膨胀 -> 缓解：后续再定义 retention / DVC 迁移规则
- [风险] 过早与 <future-control-plane> 耦合 -> 缓解：当前只做 Codex-first local MVP

## Migration Plan

1. 创建缓存目录和初始文件
2. 创建 sqlite schema
3. 创建 jsonl trace writers
4. 实现 cache-first fetch helper
5. 接入一个 search workflow
6. 接入一个 web 或 GitHub workflow
7. 验证 cache miss / cache hit 两条路径

## Open Questions

- 第一批 helper 是否先偏 search，还是先偏 web/github 通用抓取
- compact summary 是统一 markdown 还是统一 json payload
- `.artifact-cache/` 是否需要在 MVP 阶段就提供清理或 prune 命令
