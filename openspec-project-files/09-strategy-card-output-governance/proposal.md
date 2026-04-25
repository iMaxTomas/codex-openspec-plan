## Why

大输出命令是 AI 辅助开发里最容易失控的一类任务。

全仓搜索、日志、JSON、diff、测试输出、远端 evidence、外部 CLI 导出都可能一次产生大量内容。如果没有开工前的输出治理，主上下文会被原始输出淹没，后续判断会依赖摘要记忆而不是可回看的证据。

当前需要把战略卡从“任务前说明”升级成“开工合同”：在命令运行前明确谁负责抓原文、谁负责摘要、原文存哪里、主上下文只看什么、什么时候允许二次搜索、什么时候必须停。

## What Changes

- 定义战略卡的大输出治理字段：output-load classification、tool responsibility、artifact path、main-context contract、fallback、stop line。
- 要求高输出或证据重任务在执行前通过 planning audit gate。
- 要求 wrapper、RTK、sidecar、artifact-first、external CLI、remote command、logs、tests、search、file reads 等工具族明确责任 owner。
- 明确 raw output 进入 artifact，主上下文只接收 bounded summary、key paths、selected snippets。
- 允许二次搜索，但必须基于命名 source root、明确 evidence gap 和 stop line。
- 用 pass/fail fixtures 防止治理层过松或过硬。

## Capabilities

### New Capabilities

- `strategy-card-output-contract`: 战略卡必须记录大输出命令如何被捕获、保存、摘要和停止。
- `cross-tool-responsibility-gate`: 当任务命名 wrapper、RTK、sidecar、artifact、external CLI、logs、tests、search 等工具族时，必须记录 preferred owner、fallback、raw-output owner 和 main-context contract。
- `bounded-second-search`: 二次搜索可以执行，但必须有 named root、evidence gap、summary contract 和 stop line。

### Modified Capabilities

- `planning-audit-output-gates`: 从检查“有没有输出计划”升级为检查“责任是否具体、摘要是否有边界、二次搜索是否可控”。

## Impact

- 大输出命令不会直接冲进主上下文。
- 多 agent / sidecar 并行更容易控，因为每个 lane 的输出合同先写清楚。
- 证据可回看，复盘不依赖聊天记录。
- 合理的精准二次搜索不会被误拦。
- 空泛战略卡、伪合同和旧 handoff 不再能绕过开工门槛。
