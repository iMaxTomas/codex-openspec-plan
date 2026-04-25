# 思路进化说明

## 起点问题

战略卡一开始只是“任务前先想清楚”的文字约束，但在大输出命令场景里，单靠文字习惯不够。

典型问题是：

- 全仓搜索、日志、JSON、diff 直接冲进主上下文
- wrapper、RTK、sidecar、artifact-first 只被泛泛提到，没有明确谁负责什么
- 二次搜索要么无边界扩张，要么被过硬规则误拦
- 证据散落在聊天记录里，后续复盘只能靠回忆

## 第一阶段误区

- 把“写了战略卡”当成“战略卡有效”
- 把“用 wrapper 控制输出”当成完整责任划分
- 把 counts-only 当成 main-context output contract
- 把“no sidecar decision needed”这种否定句误判成已有 sidecar decision
- 用旧 handoff 或旧报告替代当前任务的开工合同

## 收敛后的抽象

最终收敛成一条治理链：

```text
先冻结战略卡
  -> planning audit 开工前检查
  -> 大输出由 wrapper / RTK / sidecar 接住
  -> 原始输出进入 artifact
  -> 主上下文只收摘要和关键路径
  -> 证据不够时按命名 root 二次搜索
  -> 到 stop line 停下来汇报
```

这个抽象不是为了禁止大命令，而是让大命令可跑、可查、可复盘。

## 验证后修正

对抗检验后，规则同时修了两类问题：

- 过松：`none` 责任值、generic blanket、negated sidecar、stale handoff 都不能再误放行
- 过硬：targeted `git show`、`/health` curl、命名 source-root、带边界二次搜索不再误阻断

## 为什么值得复用

只要团队用 AI 跑全仓搜索、日志分析、大 JSON、测试输出、远端证据采集或多 agent 并行，这套战略卡治理就有价值。

它把“大输出命令”从：

```text
直接跑 -> 直接贴 -> 淹没上下文
```

变成：

```text
先规划 -> 原文归档 -> 摘要进主线 -> 必要时精准扩展
```

## 迁移建议

- 先从高输出命令开始，不要一开始就强迫所有轻任务写长卡
- 保留轻任务最小卡，但重任务必须写 output owner、artifact path、summary contract 和 stop line
- 规则要有 pass/fail fixture，避免治理层变成只会拦、不懂放行
- 每次误阻断或误放行，都沉淀成 fixture，而不是只改一句提示词
