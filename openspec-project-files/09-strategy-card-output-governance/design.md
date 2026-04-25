# Strategy Card Output Governance Design

## Operator Flow

```text
我准备跑一个大输出任务
  -> 先冻结战略卡
  -> planning audit 检查是否有输出治理字段
  -> wrapper / RTK / sidecar 负责接住原始输出
  -> artifact 保存完整结果
  -> 主上下文只接收摘要、关键路径、少量片段
  -> 如果证据不够，再按边界二次搜索
  -> 达到 stop line 后停下来汇报
```

## Card Shape

重任务战略卡至少要写：

- `Task goal`: 本轮要解决什么
- `Execution path`: 先跑什么、后跑什么
- `Output-load classification`: 轻输出 / 中输出 / 高输出
- `Tool responsibility`: 每类工具谁负责
- `Artifact path`: 原始输出放哪里
- `Main-context contract`: 主上下文只接收什么
- `Fallback`: 首选工具不足时怎么换
- `Sidecar decision`: 使用 sidecar 或明确不用的理由
- `Stop line`: 什么情况必须停下来汇报

轻任务可以用最小卡，但也要有目标、路径、预期结果和 stop line。

## Responsibility Record

推荐用这种最小记录：

```text
Tool family: repo-wide search
Preferred owner: wrapper
Fallback: targeted rg by source root
Raw output: artifacts/search/raw.txt
Main context: hit count, key files, selected snippets only
Stop line: stop if hits expand beyond the named roots
```

这能防止“wrapper handles output”这种空泛句子混过 gate。

## Gate Rules

必须阻断：

- 没有战略卡
- 只有标题或占位文本
- `none` / 空责任值
- counts-only 冒充主上下文合同
- 泛泛写“每类工具都由 wrapper 负责”
- 否定 sidecar wording 冒充 sidecar decision
- 旧 handoff 替代当前战略卡

必须放行：

- targeted `git show`
- targeted `/health` 或 status curl
- named source-root 搜索
- 有 evidence gap 的精准二次搜索
- 自然语言 stop line，只要边界明确

## Validation Strategy

每条新规则都要有 fixture：

- fail fixture：证明坏写法会被拦住
- pass fixture：证明合理执行不会被误拦
- red-team fixture：专门测否定句、伪责任、过宽 blanket、旧 handoff

验证命令建议：

```bash
node scripts/planning-audit.mjs <change-id> --output-gates-only
node scripts/planning-audit.mjs <change-id> --task-start-gates-only
openspec validate <change-id> --strict
```

## Result

升级前：

```text
大命令 -> 原始输出进聊天 -> 上下文膨胀 -> 后续靠记忆总结
```

升级后：

```text
大命令 -> 原始输出进 artifact -> 摘要进主上下文 -> 按证据缺口精准扩展
```
