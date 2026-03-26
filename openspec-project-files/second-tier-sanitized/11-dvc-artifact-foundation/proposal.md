## Why

`deploy-artifact-first-local-cache-mvp` 已经把本地 artifact-first foundation 落地为可运行的 `.artifact-cache/`、`sqlite` 索引、`jsonl` traces 和 cache-first helper。下一步最有价值的不是立刻进入 MLflow 或 W&B，而是先把高价值、重生成成本高、以文件为主的 artifact 纳入一个成熟的版本化与存储层。

根据当前顺序，DVC 是最合适的下一层：

- 它适合文件和目录型 artifact
- 它适合本地优先
- 它天然与 Git 协同
- 它可以先跟踪选定目录，不要求所有本地运行时状态都进入版本层

因此需要一个专门的 change，定义如何把 `.artifact-cache/` 中最值得版本化的目录接入 DVC，并明确哪些内容仍留在本地索引和 trace 层之外，不进入 DVC。

## What Changes

- 新增一个 DVC integration change，用于将 `.artifact-cache/` 中的选定目录纳入 DVC 管理。
- 定义哪些目录优先进入 DVC。
- 定义哪些目录和文件明确不进入 DVC。
- 定义 DVC 跟踪对象与本地 `sqlite` 索引之间的映射方式。
- 定义初始化 DVC 的方式和范围。
- 定义 DVC 引入后与 Git、artifact store、trace 层的职责边界。

## Capabilities

### New Capabilities
- `dvc-integrated-artifact-foundation`: 为 artifact-first foundation 增加文件型 artifact 的成熟版本化与存储管理层

### Modified Capabilities
- `artifact-first-local-cache-mvp`: 从纯本地缓存阶段进入可版本化 artifact 阶段

## Impact

- 影响 `.artifact-cache/` 中 raw / derived 目录的组织方式
- 影响后续 artifact 的长期保存策略
- 为未来 remote storage、MLflow run analysis 和 W&B lineage 提供更稳定的底层 artifact 资产
