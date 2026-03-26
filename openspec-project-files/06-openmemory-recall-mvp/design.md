## Context

当前本机已经具备以下稳定边界：

- `Codex` 负责执行
- `scripts/langfuse-local/codex_langfuse_wrapper.py` 负责捕获外显执行并写入：
  - `.artifact-cache/`
  - `Langfuse`
- `artifact-cache + DVC` 继续作为 raw 真相层
- `Langfuse` 继续作为 run / session / timeline / event 检索层

当前缺少的是“任务前先回忆一点过去、任务后再沉淀一点过去”的最小长期记忆路径。用户已经明确接受先做一个非常小的 MVP，而不是立即实现完整的：

- 时间桶自动调度
- 自动双向图谱建边
- 自动 stale / superseded lifecycle
- 多 provider 统一切换

此外，用户已经将 `OpenMemory` 仓库克隆到本地：

- `/home/imax/document/test/OpenMemory`

因此这条 change 直接把“本地 OpenMemory 参与最小 recall loop”作为今晚 MVP 的设计目标。

## Goals / Non-Goals

**Goals:**

- 定义一版今晚可执行的 `OpenMemory recall MVP`
- 明确 `OpenMemory` 只承担短记忆召回与写回，不承担 artifact 或 trace
- 固定最小读路径：运行前只召回 `top-3` 短记忆
- 固定最小写路径：运行后只写回 `1~3` 条稳定结论
- 固定最小 memory schema 和 4 类 memory type
- 保持现有 `wrapper -> artifact + Langfuse` 主链不变
- 产出实现提示词，供下一窗口直接执行

**Non-Goals:**

- 不在本阶段完成完整 memory governance
- 不实现自动图谱、自动时间衰减、自动 stale lifecycle
- 不实现 OpenClaw 接入
- 不实现 RecallNest 或 Mem0 平行接入
- 不把 OpenMemory 变成 raw artifact store
- 不把 Langfuse 改造成 memory store

## Team Execution Model

这条 MVP 今晚不再按“单 agent 串行执行”来理解，而是按一个很窄的 `Codex team` 模式执行。目标不是引入抽象 swarm，而是把写入面拆开，减少阻塞。

### Team Roles

#### T0. Router / Integrator

职责：

- 拆分今晚 MVP 的子任务
- 控制执行顺序
- 收口最终结果

限制：

- 默认不直接改实现文件

#### T1. Spec Curator

职责：

- 只维护当前 change：
  - `proposal.md`
  - `design.md`
  - `spec.md`
  - `tasks.md`
- 回写实际执行边界和验收标准

限制：

- 不改 provider runtime
- 不改核心 wrapper 实现

#### T2. Runtime Implementer

职责：

- 只负责最薄的 `OpenMemory search/add` 接入
- 只碰：
  - `scripts/`
  - `ops/`
  - 必要时一份 `README`

限制：

- 不改 Docker
- 不扩张到 OpenClaw / RecallNest / Mem0 平行接入

#### T3. Verifier

职责：

- 验证 `search before run`
- 验证 `add after run`
- 验证现有 `artifact + Langfuse` 主链没有被破坏

限制：

- 尽量不改实现
- 只补最小验证记录

#### T4. Memory Curator

职责：

- 固定今晚 MVP 的 memory schema
- 固定 memory types
- 固定 recall budget 与 write boundary

限制：

- 不碰 provider runtime
- 不做自动图谱和自动时间桶

#### T5. Research Scout

职责：

- 只确认本地 `OpenMemory` 仓库的最小可用入口
- 只回答今晚 MVP 所需的：
  - 如何 search
  - 如何 add

限制：

- 不改实现
- 不扩张到更大范围的 memory 工具比稿

### Parallelism Rules

允许并行：

- `T5 Research Scout`
- `T4 Memory Curator`
- `T2 Runtime Implementer`

必须串行：

- `T3 Verifier` 在 `T2` 之后
- `T1 Spec Curator` 在 `T3` 之后收口

### Write Boundaries

```text
T0 -> 任务拆分 / 收口，不负责大实现
T1 -> 只改当前 OpenSpec change
T2 -> 只改 scripts / ops / README
T3 -> 尽量只读与验证
T4 -> 只改 memory schema / recall boundary / policy
T5 -> 只研究本地 OpenMemory 入口
```

### Team Acceptance Criteria

今晚的团队验收不只看功能跑通，还要看：

- 角色边界是否清楚
- 写入面是否互不冲突
- `search before run` 与 `add after run` 是否都已验证
- `artifact` 与 `Langfuse` 主链是否保持稳定
- 是否已经形成可复用的团队执行顺序

## Decisions

### 1. 今晚 MVP 固定为 `search before run` + `add after run`

运行前：

- 先从 `OpenMemory` 搜索 `top-3` 短记忆
- 再启动现有 `wrapper -> Codex`

运行后：

- 从本次 run 结果中提炼 `1~3` 条短记忆
- 再写回 `OpenMemory`

原因：

- 这是最薄且最能体现价值的 recall loop
- 它不会破坏现有 `artifact` 与 `Langfuse` 主链
- 它已经足够验证 “memory 参与运行” 这件事

### 2. 今晚 MVP 只存四类 memory

最小 memory 类型固定为：

- `rule`
- `fact`
- `pattern`
- `open_loop`

原因：

- 这四类已经覆盖用户当前最常见的可复用知识
- 避免一开始把 memory 类型做得过多、过细

### 3. memory 只存短结论，不存 raw

`OpenMemory` 本阶段只允许写入：

- 规则型短记忆
- 项目事实型短记忆
- 模式型短记忆
- 待继续事项型短记忆

不直接写入：

- 整个 `stdout.txt`
- 整个 `stderr.txt`
- 整个 review 正文
- 搜索 JSON 原文

原因：

- raw 真相层已经由 `artifact-cache` 承担
- trace 检索层已经由 `Langfuse` 承担
- memory 若直接吞 raw，会与两层职责混杂

### 4. 每条 memory 都必须带回链 metadata

最小 metadata 固定为：

- `project`
- `type`
- `session_id`
- `trace_id`
- `artifact_handle`
- `created_at`
- `last_used_at`
- `importance`

原因：

- 这样 memory 命中后可以继续指回 `Langfuse` 和 `artifact`
- 保持“memory 不是孤立 note，而是系统中的一个可回链对象”

### 5. 今晚不做自动图谱，只做轻连接

本阶段不实现：

- memory-to-memory 自动双向建边
- 自动关系扩展
- 自动时间桶重排

只要求每条 memory 至少能回链到：

- `trace_id`
- `artifact_handle`
- `project`

原因：

- 今晚 MVP 的目标是先把 recall loop 跑通
- 自动图谱属于下一阶段

### 6. 今晚不做复杂时间桶，只记录最小时间字段

本阶段只要求：

- `created_at`
- `last_used_at`

召回时可以用最简单的：

- 最近
- 今天
- 更早

作为人工或轻脚本排序依据。

原因：

- 用户虽然已经提出 `30m / 1h / 3h / 6h / 12h / today / older` 的理想模型
- 但今晚 MVP 不应先实现完整时间调度器

### 7. `OpenMemory` 是 recall 层，不是唯一入口

运行链仍然是：

- `OpenMemory search`
- `wrapper`
- `Codex`
- `artifact + Langfuse`
- `OpenMemory add`

原因：

- 当前 `wrapper` 已经稳定工作
- 这条 change 的目标是 memory 插入，而不是替换现有入口

## Risks / Trade-offs

- [Risk] 过早把 OpenMemory 当作万能层
  Mitigation: 在 spec 中固定它不替代 artifact 与 Langfuse。

- [Risk] 今晚就尝试实现完整时间桶和自动图谱
  Mitigation: 固定 MVP 只做 `top-3 recall` 与 `1~3 write-back`。

- [Risk] 写入内容过长，重新造成上下文膨胀
  Mitigation: 只允许写入短结论，并要求附带回链 metadata。

- [Risk] 只做 search/add 而看不出价值
  Mitigation: 要求至少在一条真实 `Codex` 工作流前后各执行一次 search/add。

## Migration Plan

1. 核对本地 `OpenMemory` 仓库及可运行入口
2. 定义今晚 MVP 的 memory schema 和 4 类 memory type
3. 增加一个最薄的 `search before run` 操作
4. 增加一个最薄的 `add after run` 操作
5. 用一条真实 `Codex` 工作流验证 recall loop
6. 回写 README / OpenSpec tasks / execution notes

推荐团队执行顺序：

1. `T5` 确认本地 `OpenMemory` 最小入口
2. `T4` 固定最小 memory schema 与 recall/write boundary
3. `T2` 实现最薄 `search/add` 接入
4. `T3` 用真实 wrapped `Codex` 工作流验证 recall loop
5. `T1` 回写 tasks / notes / acceptance
6. `T0` 收口下一步边界

## Open Questions

- 本地克隆的 `CaviraOSS/OpenMemory` 是否提供今晚 MVP 所需的最小 API / CLI 入口
- 若其本地运行方式偏重，是否需要临时改为 `Mem0/OpenMemory official` 路线
- `importance` 初始值是固定常量，还是根据 `rule/fact/pattern/open_loop` 给默认权重
- `open_loop` 是否需要单独的过期或关闭状态
- 后续真正引入时间桶和自动双向连接时，优先放在 provider 层还是 wrapper 层
