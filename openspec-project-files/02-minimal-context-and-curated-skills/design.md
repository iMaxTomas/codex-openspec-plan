## Context

研究型 change [`study-agent-context-paper-framework`](/home/imax/document/test/openspec/changes/study-agent-context-paper-framework) 已经给出较清晰的结论：
- repo-level config 应最小化，只保留模型无法从代码仓库直接推断的高价值约束
- curated skills 适合承载程序性知识，而不是让 repo config 膨胀
- task-scoped plan 应承担本次任务特有的目标、输入输出和验收要求
- 自生成 config / self-generated skills 默认不可信

与此相比，现有 [`add-ai-agent-base-environment`](/home/imax/document/test/openspec/changes/add-ai-agent-base-environment) 更像上层 AI OS 总蓝图，范围较大，容易被误用成“把所有知识都写进长期环境”的理由。因此需要一个更窄的治理型 change 来约束长期配置层。

## Goals / Non-Goals

**Goals:**
- 明确长期配置、curated skills 与 task-scoped plan 的边界
- 为本机 Codex 的 `AGENTS.md` 及其他长期配置提供瘦身规则
- 为何种知识进入 skills 提供准入标准
- 建立周期性配置审查规则
- 反向收敛 `add-ai-agent-base-environment` 对配置层的表述

**Non-Goals:**
- 本 change 不要求立刻写出最终版 `AGENTS.md`
- 本 change 不要求立即实现所有 skills
- 本 change 不处理外部平台接入的完整总纲
- 本 change 不把 task-scoped plan 自动化成 workflow

## Decisions

### 1. 长期配置层必须最小化
`AGENTS.md / CLAUDE.md / 全局 rules / 长期 prompt` 只能保留模型无法直接推断、且跨任务稳定成立的信息。

替代方案：
- 把大量 repo 介绍、目录摘要、常规说明都放进长期配置  
  放弃原因：容易增加 token 成本、误导 agent、降低任务成功率。

### 2. 程序性知识优先进入 curated skills
凡是涉及标准步骤、操作套路、验证流程、领域工作法的知识，应优先进入 curated skills。

替代方案：
- 将程序性知识保留在 repo config 中  
  放弃原因：会把长期配置写成冗长说明文档，而不是高价值约束。

### 3. 任务特有信息禁止沉淀为长期上下文
当前目标、输入输出、验收标准、一次性约束、临时环境状态，应进入 task-scoped plan 或 OpenSpec change，而不是进入长期配置。

替代方案：
- 为了“以后方便”把任务知识固化到全局  
  放弃原因：会持续制造过期上下文和误导。

### 4. 周期审查比一次性生成更重要
长期配置不应依赖一次性自动生成，而应周期性审查：
- 是否过长
- 是否过期
- 是否重复
- 是否把 skills/task-plan 的内容写进了 config

替代方案：
- 生成一次后长期不管  
  放弃原因：配置会不断漂移，最终失真。

## Risks / Trade-offs

- [风险] 最小化过头导致缺少必要上下文 -> 缓解：允许高价值、不可推断、跨任务稳定的信息保留在长期配置
- [风险] skills 数量增长过快 -> 缓解：要求 curated、聚焦、成对评估
- [风险] task-scoped plan 使用负担上升 -> 缓解：只对高重复或高复杂度任务强制使用
- [风险] 总纲与治理 change 冲突 -> 缓解：明确总纲只保留上层结构，细化规则以下层 change 为准

## Migration Plan

1. 定义长期配置允许/禁止内容清单
2. 定义进入 curated skills 的准入标准
3. 定义 task-scoped plan 的必需触发条件
4. 为本机 Codex 的现有配置准备一轮审查清单
5. 回写并收敛 `add-ai-agent-base-environment` 的配置层表述

## Open Questions

- 本机 Codex 是否需要单独的 `AGENTS.md`，还是以更细的 rules/skills 组合替代
- 周期性配置审查更适合做成 checklist、playbook 还是 review skill
- 哪些“个人偏好”应该留在长期配置，哪些应只在任务中声明
