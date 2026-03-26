## Why

当前 `document-test` 里已经同时存在大量 OpenSpec changes、repo 级治理文件、脚本入口，以及主机级 `~/.codex` 持久配置，但它们还没有被放进同一条 DevOps 工作流。结果是“哪些文件属于长期治理面、哪些只是运行态或缓存、哪些需要验证/测试/再验证后才能推广”仍然分散在多个 change 和人工习惯里。

现在需要一条统一治理 change，把所有 OpenSpec changes 与本机 Codex 的持久配置面纳入同一套主线/分支、验证、测试、再验证、优化、合并流程，并明确哪些内容必须纳入，哪些内容必须排除。这个 change 还要显式复用 `optimize-openspec-lab-rollout` 的执行纪律，而不是再平行发明一套新规则。

## What Changes

- 定义统一的 DevOps 治理清单，覆盖所有 OpenSpec changes、repo 级长期规则/脚本/提示词/skills 源码，以及主机级 Codex 持久配置面。
- 定义统一的 governed change 生命周期：主线基线、变更分支或 worktree、验证、测试、再验证、优化审查、采用/合并。
- 定义主机 Codex 配置的 repo-source-of-truth 与 host deployment target 边界，避免把 `~/.codex` 安装态副本当成唯一真相源。
- 定义 secrets、认证态、历史、日志、数据库、会话、缓存、tmp、备份与 scratch 文档的排除规则，避免把运行态噪音混入同一套变更治理。
- 定义最小证据包与 adoption gate，要求每个进入稳定治理面的修改都能回答“谁改了什么、在哪个 change 下、跑了什么验证、结果在哪里、为什么可以合并”。
- 显式复用 `optimize-openspec-lab-rollout` 的主里程碑、stop line、sidecar、读并行/写串行、同会话证据回写规则，并把它提升为全局 DevOps 执行模式的输入规则源。

## Capabilities

### New Capabilities
- `governed-ai-devops-surface-inventory`: 定义哪些 OpenSpec、repo 级治理文件和主机 Codex 持久配置必须纳入 DevOps 工作流，以及哪些运行态/敏感态内容必须排除。
- `governed-openspec-change-lifecycle`: 定义所有治理面修改的统一生命周期，包括主线、分支或 worktree、验证、测试、再验证、优化审查、采用与合并门。
- `codex-host-config-promotion`: 定义主机 `~/.codex` 持久配置的 source-of-truth、模板化、secret 注入边界、部署目标和 smoke validation 规则。

### Modified Capabilities
- None.

## Impact

- `openspec/changes/**`
- repo 级长期治理文件，例如 [AGENTS.md](/home/imax/codex-workspaces/document-test/AGENTS.md) 与 [codex-search-before-build.rules](/home/imax/codex-workspaces/document-test/codex-search-before-build.rules)
- repo 内 `.codex/prompts/**` 与 `.codex/skills/**` 这类长期工作流契约和 skill 源码
- 治理相关脚本入口，例如 `scripts/agent-routing-control-plane/` 与 `scripts/sync-vm103-document-test.sh`
- 主机级持久 Codex 配置面：`~/.codex/AGENTS.md`、`~/.codex/config.toml`、`~/.codex/rules/*.rules`、以及仅存在于主机安装目录的 skill
- 不包括 raw secrets、`auth.json`、history、logs、sqlite state、sessions、cache、`tmp/`、备份和 scratch 产物本身，但包括它们的排除与注入规则
