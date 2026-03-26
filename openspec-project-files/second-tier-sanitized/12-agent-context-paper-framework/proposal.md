## Why

当前需要把关于 `AGENTS.md / CLAUDE.md / skills / context management` 的零散讨论，整理成一个可复用的研究框架，而不是继续停留在经验判断。`del-ur-CONFIG.md` 和 `AGENT-TALK.md` 已经提供了问题意识，但还缺少基于论文源码的系统化验证与沉淀。

## What Changes

- 新增一个面向论文深读与框架沉淀的研究型 change，用于组织这次对 `Evaluating AGENTS.md` 与 `SkillsBench` 两篇论文的深入理解。
- 先从本地讨论稿 `del-ur-CONFIG.md` 与 `AGENT-TALK.md` 中提炼初始框架，明确“配置文件、技能模块、上下文管理、可复用工作流”的关键张力。
- 把安装并使用 `read-arxiv-paper` 作为首个阅读工具接入动作，用于高质量读取本地 arXiv TeX Source。
- 基于 `2602.11988` 与 `2602.12670` 两篇论文的 TeX Source 深读，修正并充实初始框架。
- 产出一个后续可复用的 OpenSpec 计划，用于指导 AI agent 的上下文配置、skills 使用、以及复用优先工作流设计。

## Capabilities

### New Capabilities
- `research-paper-framework`: 定义一种可复用的论文深读与框架沉淀流程，用于把本地讨论稿、论文源码阅读和 OpenSpec 规划串成一个标准研究路径

### Modified Capabilities

- None.

## Impact

- 影响本地研究方法：从“先写配置/规则”转向“先有框架，再用论文验证”
- 影响后续 `AGENTS.md`、skills、rules、playbook 与 workflow 的设计依据
- 需要使用本地论文源码包与新 skill 工具完成深入阅读
- 会新增一组研究型 OpenSpec 文档，用于后续复用与扩展
