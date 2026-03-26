## Context

当前已有两类输入材料。第一类是本地讨论稿：[`<discussion-note-a.md>`](<repo-root>/codex-obs/<discussion-note-a.md>) 讨论了 repository-level context files 经常因为冗余、显而易见、错误引导而伤害 agent 表现；[`<discussion-note-b.md>`](<repo-root>/codex-obs/<discussion-note-b.md>) 则补充了 Hacker News 讨论中的实践侧视角，强调高质量、针对性的人工上下文在大项目中仍可能有价值。第二类是本地已下载的 arXiv TeX Source：[`2602.11988-TeX-Source.tar.gz`](<repo-root>/codex-obs/2602.11988-TeX-Source.tar.gz) 与 [`2602.12670-TeX-Source.tar.gz`](<repo-root>/codex-obs/2602.12670-TeX-Source.tar.gz)。

这次 change 的目标不是直接产出最终规则，而是先建立一个“如何从讨论稿到论文，再从论文回到可复用 OpenSpec”的研究框架。

## Goals / Non-Goals

**Goals:**
- 用一个最小但完整的 OpenSpec 计划组织本次深入理解
- 先从两篇本地讨论稿提炼初始框架
- 明确 `<paper-reading-skill>` 在阅读链路中的角色
- 用两篇论文验证并修正“配置文件 vs 技能模块 vs 最小上下文”的判断
- 为后续沉淀 rules、skills、playbooks 提供理论与实证依据

**Non-Goals:**
- 本 change 不要求立即完成所有论文笔记与最终结论
- 本 change 不直接改写现有 `AGENTS.md`、`CLAUDE.md`、skill 或 rule 文件
- 本 change 不尝试现在就自动化为完整 workflow

## Decisions

### 1. 先做研究型 OpenSpec，而不是直接写最终规则
先把这次阅读和框架提炼过程结构化，再把结论下沉为 rules/skills。  
原因：当前最缺的是稳定框架，不是更多零散结论。

替代方案：
- 直接根据直觉改规则  
  放弃原因：容易把局部经验误当成通用规律。

### 2. 先用本地讨论稿建立初始框架，再用论文校正
阅读顺序固定为：讨论稿 -> 论文源码 -> 可复用计划。  
原因：这样能先暴露已有假设，再用论文验证，而不是被论文结构牵着走。

替代方案：
- 直接从论文开始  
  放弃原因：容易忽略当前团队自己的问题意识和具体痛点。

### 3. 把 `<paper-reading-skill>` 作为首选阅读工具，而不是自己手写解析器
论文已经有本地 TeX Source，后续阅读应优先复用现成 skill。  
原因：这次 change 的重点是理解与沉淀，不是再造 TeX 解析轮子。

替代方案：
- 手工解包并自写阅读脚本  
  放弃原因：偏离主题，也会重复造轮子。

### 4. 本次框架重点比较三类对象
需要明确区分：
- repository-level config/context file
- reusable skills/modules
- 最小必要上下文与任务级计划

原因：两篇论文和两篇讨论稿的共同核心，正是这些对象之间的边界和收益差异。

## Risks / Trade-offs

- [风险] 计划写得过大，重新变成泛研究项目 -> 缓解：只聚焦两篇讨论稿和两篇论文
- [风险] 过早下结论，忽略论文细节 -> 缓解：把最终框架放在论文深读之后产出
- [风险] 工具安装本身偏离主题 -> 缓解：只把 `<paper-reading-skill>` 作为首个最小阅读工具
- [风险] 研究成果停留在文档，不进入可复用资产 -> 缓解：在 tasks 中显式要求回写成可复用 OpenSpec 计划

## Migration Plan

1. 安装或确认 `<paper-reading-skill>`
2. 从两篇本地讨论稿提炼初始框架
3. 用该框架阅读两篇论文的 TeX Source
4. 输出对“配置文件、技能模块、最小上下文”的对照结论
5. 把结论沉淀为后续可复用的 OpenSpec 计划骨架

## Open Questions

- `<paper-reading-skill>` 是否应被正式纳入长期研究 skill 栈
- 后续框架更适合沉淀成 rules、skill，还是先沉淀成 playbook
- 这两篇论文是否足以支撑“最小上下文优先”的通用规则，还是还需要更多研究样本
