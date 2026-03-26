## Context

当前本地 artifact foundation 已经形成：

- `.artifact-cache/raw/`
- `.artifact-cache/derived/`
- `.artifact-cache/traces/`
- `.artifact-cache/index.sqlite`

其中不同内容的价值密度不同：

- `raw/search`, `raw/web`, `raw/github`, `raw/papers`
  - 重生成成本高
  - 是长期证据对象
  - 适合先被 DVC 管理
- `derived/extracts`, `derived/metadata`
  - 仍然是可复用派生产物
  - 也适合纳入 DVC 候选
- `derived/summaries`
  - 体积小，更新频繁，且可以再生成
  - 当前不应优先进入 DVC
- `index.sqlite`
  - 本地快速索引层
  - 当前不应进入 DVC
- `traces/*.jsonl`
  - 高频 append-only 事件流
  - 当前不应进入 DVC

根据 DVC 官方用法，当前最贴合的方式是：

- 在 Git 仓库根初始化 DVC
- 用 `dvc add` 跟踪选定目录
- 让 `.dvc` 文件作为 Git 中的轻量指针
- 把真实 artifact 内容交给 DVC cache / remote 体系

## Goals / Non-Goals

**Goals:**
- 定义 DVC 应优先接入哪些 `.artifact-cache/` 目录
- 定义 DVC 不应接入哪些本地状态文件
- 定义 `.dvc` 指针与本地 sqlite 索引之间的映射约束
- 为后续 remote storage 预留方向
- 保持当前 artifact-first 边界不被破坏

**Non-Goals:**
- 本 change 不要求立即上云 remote
- 本 change 不要求 MLflow 接入
- 本 change 不要求 W&B 接入
- 本 change 不要求 traces 和 sqlite 一起进 DVC

## Decisions

### 1. DVC 只跟踪选定高价值目录，不跟踪整个 `.artifact-cache/`
首阶段不对整个 `.artifact-cache/` 执行 DVC 跟踪，而是只跟踪高价值目录。

优先目录：

- `.artifact-cache/raw/search`
- `.artifact-cache/raw/web`
- `.artifact-cache/raw/github`
- `.artifact-cache/raw/papers`
- `.artifact-cache/derived/extracts`
- `.artifact-cache/derived/metadata`

原因：
- 这些目录承载高成本原始或结构化产物
- 更适合做版本和长期保留

替代方案：
- 整个 `.artifact-cache/` 直接交给 DVC  
  放弃原因：会把高频 traces、本地 sqlite、cheap summaries 一起卷进去，边界变脏。

### 2. `index.sqlite` 与 `traces/*.jsonl` 继续留在本地运行层
以下对象首阶段不进入 DVC：

- `.artifact-cache/index.sqlite`
- `.artifact-cache/traces/query-rounds.jsonl`
- `.artifact-cache/traces/tool-calls.jsonl`
- `.artifact-cache/derived/summaries`

原因：
- `sqlite` 是本地快速查询层，不是版本化原文层
- `jsonl` traces 是高频 append-only 事件流
- summaries 更新频繁、可重生成，当前不值得作为首批 DVC 资产

### 3. DVC 作为文件型 artifact 版本层，不替代 sqlite 索引
即使 DVC 接入后，本地 `sqlite` 仍保留，用于：

- cache-first lookup
- canonical key 查询
- artifact id 到路径的快速映射

DVC 负责：

- 文件/目录版本指针
- cache / remote 管理
- 重型 artifact 的长期保存

### 4. DVC 应在 Git 仓库根初始化
根据 DVC 官方推荐，DVC 在 Git 仓库根初始化最合理。

原因：
- 当前仓库本身就是 Git 根
- `.artifact-cache/` 已在此根下
- 这能让 `.dvc` 文件与现有仓库结构保持清晰

### 5. 首阶段只要求本地 DVC，不要求 remote
当前先完成：

- `dvc init`
- 目录选择
- `.dvc` 指针生成

而不要求立刻配置 `dvc remote`

原因：
- 当前仍处在本地优先阶段
- remote 应在确认跟踪范围稳定后再引入

## DVC Tracking Plan

### Track First

- `.artifact-cache/raw/search`
- `.artifact-cache/raw/web`
- `.artifact-cache/raw/github`
- `.artifact-cache/raw/papers`
- `.artifact-cache/derived/extracts`
- `.artifact-cache/derived/metadata`

### Keep Local Only

- `.artifact-cache/index.sqlite`
- `.artifact-cache/traces/`
- `.artifact-cache/derived/summaries`

## Mapping Rule

Each tracked artifact row in `sqlite` SHOULD continue to store:

- `local_path`
- `canonical_key`
- `content_hash`
- `artifact_id`

When DVC begins tracking a directory:

- the actual file path remains stable
- the Git repo stores the corresponding `.dvc` pointer
- sqlite remains the fast runtime lookup layer

This means:

```text
sqlite answers "do I already have this?"
DVC answers "which version of this file-set is tracked and recoverable?"
```

## Risks / Trade-offs

- [风险] DVC 过早卷入高频目录 -> 缓解：只选高价值目录
- [风险] sqlite 与 DVC 元信息重复 -> 缓解：明确 sqlite 负责 lookup，DVC 负责 versioning
- [风险] `.artifact-cache` 边界被破坏 -> 缓解：维持 raw/derived/traces/index 的分层
- [风险] 仓库体积和操作复杂度上升 -> 缓解：首阶段不接 remote，不扩大范围

## Migration Plan

1. 定义 DVC 首批跟踪目录
2. 定义本地-only 目录
3. 定义 `.dvc` 指针与 sqlite 映射规则
4. 定义初始化步骤
5. 定义后续 remote 接入条件

## Open Questions

- `.artifact-cache/derived/summaries` 未来是否进入 DVC，还是继续保持本地-only
- 是否需要单独的 `.dvcignore` 来保护 traces 和 sqlite
- DVC remote 第一个目标更适合本地磁盘、SSH 还是对象存储
