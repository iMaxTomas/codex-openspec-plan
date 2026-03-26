## Context

当前记忆相关链路已经形成了一个很清楚的最小闭环：

- `Codex` 负责执行
- `wrapper` 负责捕获外显执行
- `.artifact-cache + DVC` 负责 raw 真相
- `Langfuse` 负责 run / session / observation
- `OpenMemory` MVP 已经证明了最小的 `search before run` + `add after run`

而且有三条边界已经是当前共识，不应被这条治理 change 重新打开：

- `artifact != trace != memory`
- `checkpoint/session != durable memory`
- recall 与 write-back 默认都必须保持小预算和短记忆边界

但当前仍然缺少真正的治理层。现在系统可以写入短记忆，却还没有正式回答：

- 哪些内容是 `durable`，哪些只是 `session`、`observation` 或 `evidence`
- 时间越久的记忆如何降权
- `stale` 和 `superseded` 是不是同一回事
- 默认 recall 能拿多少条、多少 token
- 低权威写入是否能覆盖已有 durable fact

这条 change 不再是另一个 recall MVP，也不是 provider 选型。它是把之前在研究和 MVP 中被明确延后的治理项，变成后续所有 runtime change 都必须遵守的规则。

当前最直接的参考输入有三类：

- 现有 MVP:
  - [design-openmemory-recall-mvp-for-codex-workflow/design.md](/home/imax/document/test/openspec/changes/design-openmemory-recall-mvp-for-codex-workflow/design.md)
- 上游研究输入:
  - [research-ai-memory-layer-frontier-and-governance/design.md](/home/imax/document/test/openspec/changes/research-ai-memory-layer-frontier-and-governance/design.md)
- 已有边界约束:
  - [memory-boundary-contract.md](/home/imax/document/test/recallnest/docs/memory-boundary-contract.md)
  - [memory-categories.md](/home/imax/document/test/recallnest/docs/memory-categories.md)

## Goals / Non-Goals

**Goals:**

- 定义当前系统的长期 memory governance 边界，而不是继续扩大 MVP
- 固定 5 层 authority model：`canonical`、`durable`、`session`、`observation`、`evidence`
- 固定命名时间桶与可选热度映射
- 固定 `active / stale / superseded / archived` 生命周期状态及其默认读写行为
- 固定 recall budget，包括默认 `top-k`、token cap、桶内优先级和默认排除规则
- 固定 durable write / promote policy 与 conflict policy
- 固定当前 MVP memory types 到治理类别的映射
- 产出后续实现 change 必须复用的生命周期表、预算表和评估清单

**Non-Goals:**

- 不在本 change 中实现新的 runtime 代码路径
- 不在本 change 中修改 `OpenMemory` 或 `Langfuse` 服务部署
- 不在本 change 中引入自动图谱建边或自动时间衰减任务
- 不在本 change 中接入 `OpenClaw`
- 不在本 change 中替换当前 provider
- 不在本 change 中把 raw transcript / stdout / stderr 改造成 durable memory

## Team Execution Model

这条 change 按 Codex 团队模式推进，但它是治理设计，不是 runtime 实现。

### Roles

- `T0 Router / Integrator`
  - 拆分治理子问题并收口
- `T1 Spec Curator`
  - 只维护当前 OpenSpec change
- `T4 Memory Curator`
  - 固定 layer / lifecycle / budget / promote 规则
- `T5 Research Scout`
  - 只从已有本地文档提炼已达成共识的治理输入

### Parallelism

允许并行：

- `T4 Memory Curator`
- `T5 Research Scout`

必须串行：

- `T1 Spec Curator` 在前两者之后收口到 proposal / design / spec / tasks

### Write Boundaries

```text
T0 -> 任务拆分 / 最终收口
T1 -> 只改当前 change
T4 -> 只产出治理规则，不改 runtime
T5 -> 只读取既有文档与证据，不扩张研究范围
```

## Decisions

### 1. 单独开 `memory governance` change，而不是继续塞进 MVP 或 research

治理规则现在已经是一个独立主题：

- 它不是另一个 recall MVP
- 它也不是 research 输入本身

原因：

- `design-openmemory-recall-mvp-for-codex-workflow` 明确把 graph/time lifecycle/evaluation/governance 延后到了后续 boundary
- `research-ai-memory-layer-frontier-and-governance` 负责的是原理和研究共识，不是操作性治理规范

替代方案：

- 继续补到 `design-openmemory-recall-mvp-for-codex-workflow`
  - 放弃原因：会把已完成的 MVP 与新的治理层混在一起
- 继续补到 `research-ai-memory-layer-frontier-and-governance`
  - 放弃原因：研究 change 不适合承载可执行治理合同

### 2. 固定五层 authority model

这条 change 采用以下分层：

- `canonical`
  - curated docs / root rules / hand-maintained stable project rules
- `durable`
  - reusable memory that may be recalled across runs/windows
- `session`
  - current objective, open loops, temporary work state
- `observation`
  - append-only run/session/health records
- `evidence`
  - raw transcripts, artifacts, stdout/stderr, imported loose text

当前系统映射：

- `canonical` -> curated docs / root instruction files / hand-maintained notes
- `durable` -> `OpenMemory` durable recall layer
- `session` -> current runtime continuity / active run context
- `observation` -> `Langfuse`
- `evidence` -> `.artifact-cache + DVC`

原因：

- 这能把 artifact、trace、memory 的职责正式拉开
- 后续 `RecallNest` / `OpenClaw` 也可以直接沿用

替代方案：

- 只保留 `memory / trace / artifact` 三层
  - 放弃原因：无法表达 `canonical` 与 `session` 的不同 authority

### 3. 这条 change 引入显式时间桶映射，但承认此前只冻结了粗粒度时间语义

此前真正已经稳定的是：

- `created_at`
- `last_used_at`
- 粗粒度排序：`recent / today / older`

这条 change 在这个基线上引入一个更细但仍可解释的治理映射：

- `30m`
- `1h`
- `3h`
- `6h`
- `12h`
- `today`
- `older`

并可选收敛成热度层：

- `hot` = `30m / 1h / 3h`
- `warm` = `6h / 12h / today`
- `cold` = `older`

最小时间字段：

- `created_at`
- `last_used_at`

可选确认字段：

- `confirmed_at`

原因：

- 用户已经明确希望有时间窗口注意力排序
- 当前 coarse ordering 不足以支撑治理表格与后续 lifecycle 设计
- 但这是一条新治理决定，不是假装成既有冻结共识

替代方案：

- 只按向量相似度与最近使用排序
  - 放弃原因：会让召回策略变得不可解释

### 4. `stale` 和 `superseded` 必须是不同状态

状态固定为：

- `active`
- `stale`
- `superseded`
- `archived`

含义：

- `active`: 默认可召回
- `stale`: 变旧或不确定，默认不参与普通 recall
- `superseded`: 被更新事实或更高权威来源替代，默认绝不参与普通 recall
- `archived`: 保留历史，不参与普通 recall

原因：

- `stale` 是“可能还对，但不够新”
- `superseded` 是“已经被替换或矛盾”

替代方案：

- 只保留 `active / archived`
  - 放弃原因：会混淆时间衰减和事实冲突

### 5. 默认 recall budget 继续沿用 MVP 的“小预算”边界，再补上显式治理参数

此前已经稳定的默认 contract 是：

- pre-run recall = `top-3`
- post-run write-back = `1~3`
- 只允许短记忆，不允许 raw dump

这条 change 在不放大默认预算的前提下，补上显式治理参数：

- default recall `top-k` = `3`
- default memory token cap = `600`
- default per-bucket cap:
  - `hot <= 2`
  - `warm <= 1`
  - `cold = 0` unless explicitly expanded

默认优先级：

```text
canonical
  >
durable(active, same-project, directly-linked)
  >
session
  >
durable(warm)
```

默认排除：

- `superseded`
- `archived`
- `observation`
- `evidence`
- `stale` unless explicitly requested

原因：

- 这能保持与现有 MVP 一致，不会因为治理 change 反向放大 recall
- 条数限制和 token cap 同时存在，才能把 recall 压成稳定输入

替代方案：

- 只保留 `top-k`
  - 放弃原因：同一条记忆长短差异会破坏预算

### 6. durable write 与 promote 必须分 authority path

默认 authority 规则：

- raw transcript / raw artifact / Langfuse trace 不得自动成为 durable memory
- durable memory 只能来自：
  - structured write
  - reviewed promotion
  - curated canonical sync

当前 MVP memory types 的默认治理映射：

- `rule` -> durable `patterns`
- `pattern` -> durable `patterns`，debug 型可落到 `cases`
- `fact` -> durable `entities` 或 `events`，按稳定度判断
- `open_loop` -> `session` by default, only promoted to durable if explicitly marked long-lived

原因：

- 这能防止 evidence path 越权
- 也能让 `open_loop` 不被误当成长期事实

替代方案：

- 所有写回的短记忆都默认 durable
  - 放弃原因：会快速污染长期 recall

### 7. 冲突规则禁止低权威静默覆盖

默认冲突处理：

- exact duplicate -> dedupe
- same key + merge category -> merge/update
- append category -> append
- lower-authority write vs higher-authority durable/canonical -> open conflict, never silent overwrite

原因：

- durable recall 必须可解释
- 冲突应被显式审查，而不是被后写入内容静默覆盖

替代方案：

- last-write-wins
  - 放弃原因：会让 durable 层失去权威性

### 8. 这条 change 必须产出可复用的 operator-facing outputs

这条 change 必须输出三份后续复用合同：

- lifecycle table
- recall-budget table
- evaluation checklist

原因：

- 后续 runtime change 不该再次发明治理规则
- operator 需要看的不是论文语言，而是表格和检查单

## Risks / Trade-offs

- [Risk] 治理规则先于 runtime，短期内无法自动执行所有规则 -> Mitigation: 把这次 change 明确定位为 authority contract，后续 change 再实现
- [Risk] 时间桶过细导致实现复杂 -> Mitigation: 先固定语义与桶名，不强求自动调度实现
- [Risk] `open_loop` 的 durable / session 边界仍可能含糊 -> Mitigation: 默认 `session`，只有显式长期化才 promote
- [Risk] recall budget 过紧导致相关记忆漏召回 -> Mitigation: 允许显式 expanded recall path，但默认仍保持紧预算
- [Risk] 多 provider 后续接入时语义不一致 -> Mitigation: 先把治理规则定义成 provider-neutral contract

## Migration Plan

1. 以当前 `OpenMemory recall MVP` 为基线，固定治理边界而不改 runtime
2. 产出 lifecycle / budget / evaluation 三份 operator-facing 输出
3. 在下一条 runtime/deployment change 中，把当前 `OpenMemory` helper 与 future providers 对齐到这份治理合同
4. 再后续才进入：
   - automatic graph edges
   - automatic time decay
   - conflict tooling
   - evaluation instrumentation

## Open Questions

- `confirmed_at` 是否应在所有 durable promotion 中强制存在，还是只在人工确认路径中存在
- `open_loop` 超过多久应默认转为 `stale session` 而不是 durable memory
- `fact` 落到 `entities` 还是 `events` 的默认分类边界是否还需要更细的 slot 规则
- recall budget 是否应按 project size 或 mode (`exec` / `review` / `search`) 动态变化
- canonical 与 durable 的同步是否应该引入单独的 review path
