## Context

当前这台机器上已经形成了三类长期工作流资产：

1. repo 内的 OpenSpec changes、`AGENTS.md`、rules、prompts、skills 源码、治理脚本
2. 主机级 `~/.codex` 持久配置，例如 `AGENTS.md`、`config.toml`、`rules/*.rules`、安装态 skills
3. 大量运行态、缓存态、会话态和备份态文件

真正的问题不是“缺少规则”，而是这些规则与配置还没有被一条统一的 DevOps 工作流接管。现在很多治理面仍然依赖人工判断：哪些文件要走 change、哪些文件只该当部署产物、哪些内容必须先做验证/测试/再验证、哪些内容根本不该进入同一套 Git 变更面。

已有 change 其实已经提供了可复用的片段：

- `optimize-openspec-lab-rollout` 已经定义了主里程碑、stop line、sidecar、读并行/写串行、同会话证据回写这些执行纪律
- `add-minimal-context-and-curated-skills-governance` 已经定义了长期配置最小化、procedural knowledge 进 skill、task context 留在 task-scoped artifacts
- `deploy-codex-minimal-context-configuration` 已经定义了 startup/trust/最小长期配置边界
- `design-dual-codex-collaboration-topology` 已经定义了 host supervisor / VM103 executor 与单写 owner
- `design-agent-error-governance-and-runtime-gates` 已经定义了 evidence、regression、adoption gate 的基本思路

所以这次不是重写规则，而是把这些片段收束成一条统一 DevOps 总线。

## Goals / Non-Goals

**Goals:**
- 定义一份可执行的治理清单，回答“本机哪些 OpenSpec 与 Codex 配置面必须纳入 DevOps 工作流”
- 定义所有治理面修改的统一生命周期：主线基线、分支或 worktree、验证、测试、再验证、优化审查、采用与合并
- 定义主机 `~/.codex` 持久配置的 source-of-truth / deployment target / secret overlay 边界
- 定义最小证据包，避免后续对“谁改了什么、是否验证过、为什么能推广”再靠聊天记忆推断
- 复用 `optimize-openspec-lab-rollout` 的执行纪律作为全局执行模式，而不是只留在实验室 rollout 场景

**Non-Goals:**
- 不把 raw secrets、auth/session/log/sqlite/cache/tmp 直接纳入 Git 治理
- 不要求一次性返工所有历史 change 的全部文档
- 不在本 change 里直接实现所有 host 配置部署脚本
- 不替代现有 host/VM103 拓扑，也不取消已有 OpenSpec change 的独立边界

## Decisions

### A. 新建总伞 change，复用 `optimize-openspec-lab-rollout`，而不是把它硬扩成总线
操作链固定为：

`我先在新的治理 change 里定义统一规则 -> 我把 optimize change 当成执行纪律来源 -> 我把其他 change 当成边界来源 -> 我在这个总伞 change 里收束统一生命周期 -> 下次任何治理面修改都复用这一条`

不是这样：
- 不是继续让 `optimize-openspec-lab-rollout` 同时承担实验室 rollout 和全局 DevOps 总伞
- 不是把总规则继续堆进某一个 `AGENTS.md`

原因：
- `optimize` 当前仍然偏向 VM/PVE/lab rollout
- 它已经足够适合作为执行纪律母版，但还不够覆盖 host Codex 持久配置治理

替代方案：
- 直接扩容 `optimize-openspec-lab-rollout`
  放弃原因：会继续造成 scope 混杂，并让实验室 rollout 规则和主机配置治理绑死在同一 change。

### B. 所有候选文件先进入四层分类，再决定是否纳入 DevOps 工作流
固定分类为：

1. `governed durable sources`
2. `governed deployment targets`
3. `sensitive overlays`
4. `runtime state / cache / scratch`

其中：
- `governed durable sources` 包括 `openspec/changes/**`、repo `AGENTS.md`、repo rules、repo `.codex/prompts/**`、repo `.codex/skills/**`、治理脚本
- `governed deployment targets` 包括 `~/.codex/AGENTS.md`、`~/.codex/rules/*.rules`、`~/.codex/skills/**`、最终落地的 `config.toml`
- `sensitive overlays` 包括 secret 值、token、账号、注入文件或 secret backend 映射
- `runtime state / cache / scratch` 包括 `auth.json`、history、sessions、logs、sqlite、snapshots、`tmp/`、备份、scratch 文档

不是这样：
- 不是看到 `~/.codex` 下的文件就全部纳入 Git
- 不是只因为文件重要，就忽略它到底是 source、target、secret 还是 runtime state

原因：
- 只有先分类，后面的验证、合并和部署门才不会互相污染

替代方案：
- 直接按目录整包治理
  放弃原因：会把 secrets、cache、session state 与长期策略混成一个不可审计的面。

### C. repo 是 durable config 的真相源；host `~/.codex` 是投影目标
默认链路固定为：

`我在 repo 里修改长期规则或模板 -> 我在 change 下完成验证与测试 -> 我把 durable config 投影到 host 安装路径 -> 我在 host 上跑 smoke validation -> 我保存证据 -> 然后才允许把它当成稳定基线`

不是这样：
- 不是直接把 `~/.codex` 当前现场当成唯一真相源
- 不是先手改 host，再事后回忆哪些内容值得写回 repo

原因：
- 安装态副本适合作为 deployment target，不适合作为唯一 source of truth
- repo 内已经存在 prompt、skills、rules 和 OpenSpec 体系，适合承接 review 与 branch/worktree 流程

替代方案：
- 继续把 host 目录当手工现场管理
  放弃原因：host 漂移、review 缺位、变更证据不完整。

### D. `config.toml` 采用“durable template + secret overlay + runtime validation”三分法
对 `~/.codex/config.toml` 的治理固定为：

- durable 部分纳入治理：model、trusted projects、skills enablement、MCP command/args、`shell_environment_policy`
- secret 部分不纳入明文治理：API keys、email、token 与其他敏感字面量
- promotion 时再注入 overlay，并在 host 上验证结果可用

不是这样：
- 不是把带明文 secrets 的完整 `config.toml` 直接纳入版本控制
- 不是因为文件里含 secrets，就放弃治理整份配置的结构

原因：
- `config.toml` 既是持久配置面，又混入了敏感值；必须拆治理方式

替代方案：
- 完全不治理 `config.toml`
  放弃原因：这会把 trust、MCP、skills、PATH 注入这些关键行为重新交回人工现场。

### E. 统一生命周期采用“主线基线 -> 隔离改动 -> 验证 -> 测试 -> 再验证 -> 优化审查 -> 采用/合并”
所有治理面修改的默认链路固定为：

`我先明确当前稳定基线 -> 我在 change 和 branch/worktree 上做隔离修改 -> 我先跑静态验证 -> 我再跑行为测试 -> 我根据结果做再验证 -> 我做一次最小化/性能与运维负担审查 -> 我保存证据并作 adoption 决定 -> 然后才合并`

这里的“优化审查”不是性能基准测试专用词，而是检查：
- 长期配置是否变得更臃肿
- 是否把 procedural knowledge 错放进长期 config
- 是否增加了无必要的人工步骤
- 是否引入了新的 host drift 风险

替代方案：
- 只做“改完就合并”
  放弃原因：这无法覆盖用户要求的验证、测试、再验证和工作流优化闭环。

### F. 共享写面保持单 owner；并行只给读重或隔离写面
默认规则固定为：

`我判断这个子任务是读重还是写重 -> 读重任务允许 built-in subagents 并行 -> 写重任务默认单 owner -> 如果确实需要并行写，就先进入 worktree 或其他显式隔离根`

原因：
- 这直接复用了 `optimize-openspec-lab-rollout` 与 dual-codex topology 的成熟规则
- 统一 DevOps 工作流不能因为引入多代理而降低可审计性

替代方案：
- 继续把多窗口或多会话当成并行写隔离
  放弃原因：无法保证共享治理面的一致性。

### G. 现有未纳管资产按“先盘点、再分流、后纳管”迁移，不做一次性大爆改
迁移策略固定为：

1. 先盘点当前 repo 与 host 上的 durable surfaces
2. 再标记 source / target / secret overlay / runtime exclude
3. 先拿高价值治理面试点，例如 repo `AGENTS.md`、`codex-search-before-build.rules`、`optimize-openspec-lab-rollout`、`scripts/sync-vm103-document-test.sh`
4. 再逐步把 host-global config 建成可投影的模板与安装流程

原因：
- 当前已有大量 in-progress changes；一次性返工会直接打断现有推进

## Risks / Trade-offs

- [Risk] 治理门增加后，短期会让变更感觉更重 -> Mitigation: 只把 durable governance surfaces 纳入总线，运行态和 scratch 继续走轻量边界
- [Risk] host 当前现场与 repo 规则可能不完全一致 -> Mitigation: 先做 inventory 和 projection contract，再做逐步收敛，不直接假设两边已一致
- [Risk] `config.toml` 的 secrets 拆分方案如果不清晰，会造成部署失败 -> Mitigation: 在 spec 中要求 secret overlay contract 和 host smoke validation 成对出现
- [Risk] 新总伞 change 与现有治理 change 产生重复 -> Mitigation: 明确把旧 change 当作 rule source，而不是复制全部内容

## Migration Plan

1. 盘点当前纳管候选面，并按 source / target / secret overlay / runtime exclude 分类
2. 从 `optimize-openspec-lab-rollout` 提取可复用执行纪律，写成全局 DevOps 生命周期的一部分
3. 定义 repo 管理的 durable config 位置、host deployment target 和 secret overlay contract
4. 为高价值治理面建立最小验证、测试、再验证和 adoption evidence 套件
5. 先在当前 repo 与 host Codex 配置上试点，再推广到后续 OpenSpec changes

## Open Questions

- durable host config 的 repo 源码目录应落在现有 `.codex/` 下，还是拆到独立的 `ops/` 或 `codex-config/` 目录
- `config.toml` 的 template/render 机制是使用静态模板文件、脚本生成，还是更强约束的 schema 渲染
- 现有 host-only skills 中哪些应提升回 repo source of truth，哪些允许继续作为 host-local 例外
