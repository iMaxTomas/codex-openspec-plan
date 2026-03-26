• 口径按 openspec/changes 和 openspec/changes/archive 统计，共 51 个 OpenSpec change，其中 49 个在活动区，2 个已归档。第二列完成度按 tasks.md 勾选率；第四列“逻辑闭环程度”是我基于 proposal/design/tasks/是否归档做的人工判断，不是 OpenSpec 原生字段。

  已归档 2 个

  | 项目名称 | 完成度及其描述 | 需求和解决方案 | 逻辑闭环程度 |
  |---|---|---|---|
  | 2026-03-26-implement-host-codex-config-projection | 100% 9/9，已归档 | 需求：把 host Codex config 从治理层落到实现层；方案：建立 repo source、projection script、render/apply/validation 流程 | 已归档闭环 |
  | 2026-03-26-refresh-optimize-openspec-lab-rollout-baseline | 100% 9/9，已归档 | 需求：修正过时 rollout 基线；方案：刷新 optimize-openspec-lab-rollout 叙述并固化为新基线 | 已归档闭环 |

  任务全完但未归档 28 个

  | 项目名称 | 完成度及其描述 | 需求和解决方案 | 逻辑闭环程度 |
  |---|---|---|---|
  | add-codex-explanation-order-rules | 100% 12/12，任务完成 | 需求：避免复杂链路解释顺序错误；方案：把 operator-first 的解释规则抽成独立规则源 | 实质闭环，待归档 |
  | add-gitagent-codex-wrapper-skill | 100% 9/9，任务完成 | 需求：让 Codex 可稳定调用 gitagent；方案：为已装 CLI 加薄封装 skill | 实质闭环，待归档 |
  | add-minimal-context-and-curated-skills-governance | 100% 15/15，任务完成 | 需求：抑制长期上下文膨胀；方案：划清 repo config、curated skills、task-scoped plan 边界 | 实质闭环，待归档 |
  | add-shell-semantic-canvas-skill | 100% 22/22，任务完成 | 需求：固化 shell 白板式解释；方案：定义触发条件、语义原子、布局规则、反模式 | 实质闭环，待归档 |
  | adopt-langfuse-observability-foundation | 100% 16/16，任务完成 | 需求：补齐 agent 执行可观测性；方案：采用 Langfuse 作为自托管 observability backend | 实质闭环，待归档 |
  | adopt-nfs-primary-bus-and-smb-aux-port-for-vm103 | 100% 16/16，任务完成 | 需求：纠正 VM103 transport 主线；方案：NFS 做主总线，SMB 收口为 review/handoff 辅助口 | 实质闭环，待归档 |
  | automate-vm103-snapshot-and-backup-rhythm | 100% 6/6，任务完成 | 需求：把快照和备份变成自动节奏；方案：PVE 30 分钟快照 + PBS 小时备份 + 保留规则 | 实质闭环，待归档 |
  | cleanup-vm103-transport-followups | 100% 10/10，任务完成 | 需求：清理旧 SMB 桥和 NFS 属主误解；方案：退役旧目录并固定最终 side-port 结构 | 实质闭环，待归档 |
  | deploy-artifact-first-local-cache-mvp | 100% 22/22，任务完成 | 需求：把 artifact-first 设计真正落地；方案：部署本地 cache、索引与最小 helper | 实质闭环，待归档 |
  | deploy-codex-explanation-order-rules | 100% 9/9，任务完成 | 需求：把解释顺序规则真正部署到 Codex；方案：生成最小 AGENTS.md 与相关规则配置 | 实质闭环，待归档 |
  | deploy-codex-minimal-context-configuration | 100% 10/10，任务完成 | 需求：缩小 remote Codex trust boundary；方案：迁出 /root，固定 project-scoped working roots | 实质闭环，待归档 |
  | deploy-langfuse-local-docker-mvp | 100% 14/14，任务完成 | 需求：把 Langfuse 评估推进到可运行 MVP；方案：围绕官方 Docker Compose 加本地包装 | 实质闭环，待归档 |
  | deploy-recallnest-shared-memory-on-vm103 | 100% 18/18，任务完成 | 需求：让 host/VM103 工具共享同一记忆层；方案：在 VM103 部署 authoritative RecallNest | 实质闭环，待归档 |
  | design-dual-codex-collaboration-topology | 100% 14/14，任务完成 | 需求：把 host Codex 与 VM103 Codex 协作关系定型；方案：定义规划/执行/交接/证据边界 | 设计闭环完成，待归档 |
  | design-memory-governance-and-recall-policy | 100% 21/21，任务完成 | 需求：给 recall 系统补长期治理；方案：定义 canonical/durable/session/evidence 分层与预算 | 设计闭环完成，待归档 |
  | design-openmemory-recall-mvp-for-codex-workflow | 100% 21/21，任务完成 | 需求：给现有 workflow 增加最薄 recall 支路；方案：设计 OpenMemory recall MVP 与运行边界 | 设计闭环完成，待归档 |
  | evaluate-langfuse-deployment-and-codex-first-ingestion | 100% 14/14，任务完成 | 需求：先验证 Langfuse 部署与 Codex-first ingest 边界；方案：做 Docker self-host 和 wrapper MVP 评估 | 评估闭环完成，待归档 |
  | govern-openspec-and-codex-devops-workflow | 100% 15/15，任务完成 | 需求：统一 OpenSpec、repo 治理文件与 host config 的 DevOps 工作流；方案：定义验证、推广、证据门槛 | 实质闭环，待归档 |
  | harden-vm103-codex-commander-baseline | 100% 11/11，任务完成 | 需求：把 VM103 root Codex 收成稳定 commander baseline；方案：固定启动边界、workspace、handoff 规则 | 实质闭环，待归档 |
  | implement-codex-first-langfuse-wrapper | 100% 13/13，任务完成 | 需求：让 Codex-first ingest 真正跑通；方案：本地 wrapper 上报 session/run/tool/artifact 事件 | 实现闭环完成，待归档 |
  | initialize-dvc-for-selected-artifact-directories | 100% 18/18，任务完成 | 需求：执行 DVC 第一阶段落地；方案：初始化 DVC 并纳入选定 artifact 目录 | 实现闭环完成，待归档 |
  | install-gitagent-codex-branch-locally | 100% 9/9，任务完成 | 需求：不等上游 release 先用本地分支版；方案：记录安装路径、边界与验证流程 | 实操闭环完成，待归档 |
  | integrate-dvc-with-artifact-cache-foundation | 100% 15/15，任务完成 | 需求：给高价值 artifact 加版本化层；方案：将 .artifact-cache/ 选定目录纳入 DVC 管理 | 设计闭环完成，待归档 |
  | optimize-openspec-lab-rollout | 100% 22/22，任务完成 | 需求：把 lab rollout 推进纪律沉淀为规则源；方案：强调唯一主目标、停止线和分段推进 | 规则闭环完成，待归档 |
  | port-codex-adapter-to-rtk-0310 | 100% 12/12，任务完成 | 需求：把 Codex adapter 能力移植到 RTK 0.31.0；方案：升级到 config.toml + PATH shim + RTK_HOST=codex | 实现闭环完成，待归档 |
  | repair-trace-first-quote-routing | 100% 20/20，任务完成 | 需求：修复 quote/provenance 问题被错路由；方案：固化 trace-first 分类与 provenance contract | 规则闭环完成，待归档 |
  | research-ai-memory-layer-frontier-and-governance | 100% 24/24，任务完成 | 需求：系统化研究 memory layer 前沿；方案：组织论文、机制、结构规范与配置输入研究 | 研究闭环完成，待归档 |
  | study-agent-context-paper-framework | 100% 12/12，任务完成 | 需求：系统化理解 AGENTS.md / SkillsBench；方案：建立论文深读与验证框架 | 研究闭环完成，待归档 |

  完成过半但未归档 7 个

  | 项目名称 | 完成度及其描述 | 需求和解决方案 | 逻辑闭环程度 |
  |---|---|---|---|
  | stage-pve-vm-agent-lab | 96% 26/27，仅剩 1 项 | 需求：把 PVE -> VM103 -> SSH -> agent lab 组织成可回滚实验室；方案：已跑通底座、Codex/Claude/OpenClaw 主链，剩 Gemini 回归验证 | 极高，几乎闭环 |
  | ob-cli | 95% 21/22，仅剩 1 项 | 需求：稳定使用官方 Obsidian CLI skill；方案：已厘清 skill/CLI/GUI/X11 边界，剩命名 vault 收尾 | 极高，几乎闭环 |
  | ai-canvas-decision-board | 94% 17/18，仅剩 1 项 | 需求：把 AI 使用总结稳定转成 decision-first canvas；方案：模板、版式、流程已成，只差扩展规则 | 很高，主闭环已成 |
  | configure-local-smb-share-for-vm103 | 90% 10/11，仅剩 1 项 | 需求：固定 host 与 VM103 的 SMB 交换面；方案：已复用现有 share，剩 dedicated authenticated share 硬化 | 很高，工程闭环接近完成 |
  | add-bili-favorites-theme-summary-skill | 71% 30/42，原型可用 | 需求：把 B 站收藏夹整理做成稳定 skill；方案：主流程已跑通，剩字幕 provider 解耦、双轨缓存、自动归档迁移 | 中高，业务闭环已通但架构未收口 |
  | add-artifact-first-agent-persistence-foundation | 60% 14/23，设计过半 | 需求：沉淀搜索/网页/论文等高价值产物；方案：artifact-first foundation 已定，剩 DVC/MLflow/W&B 边界 | 中等，设计链通但实施链未闭 |
  | build-smb-driven-vm103-command-runner | 56% 9/16，合同已成 | 需求：把 host 到 VM103 的日常控制切到 NFS runner；方案：合同、目录、helper 已有，剩 execute/publish 与端到端 proof | 中等，关键实现闭环未形成 |

  前期规划或未启动 14 个

  | 项目名称 | 完成度及其描述 | 需求和解决方案 | 逻辑闭环程度 |
  |---|---|---|---|
  | design-vm103-multi-provider-agent-team | 41% 10/24，主控基线已定 | 需求：把 VM103 已登录 Codex 收敛成多 provider 团队主控；方案：已定 commander/bus contract，剩 live inventory、lane matrix、comparison baseline | 中低，框架有了但核心实证未补 |
  | deploy-vm103-hook-dispatch-event-flow | 26% 4/15，早期阶段 | 需求：降低长任务轮询成本；方案：用 Claude hooks + dispatch/Linux signal 做结果落盘与唤醒链 | 低，只有早期定义 |
  | migrate-gitagent-codex-wrapper-to-repo-source | 任务未建立，仅 proposal | 需求：把 host 安装态 skill 迁入 repo 管理；方案：将 gitagent-codex-wrapper 转成 repo source | 很低，提案级 |
  | add-ai-agent-base-environment | 0% 0/23，未启动 | 需求：给 AI coding agent 建统一基础环境栈；方案：把搜索、文档、网页、GitHub、playbook、回滚纳入统一 capability | 很低，蓝图级 |
  | add-ascii-markdown-canvas-cards | 0% 0/11，未启动 | 需求：在 Markdown 中表达可视化 ASCII 卡片；方案：建立 Markdown-first 的 ASCII canvas workflow | 很低，蓝图级 |
  | add-capability-claim-review-board | 0% 0/19，未启动 | 需求：长期审查高风险能力声明与框架选型；方案：设计 capability-claim review board | 很低，治理提案 |
  | ai-drift-detection-review | 0% 0/13，未启动 | 需求：识别 AI 工作会话漂移与超时；方案：定义 drift signal、review prompt、reroute summary | 很低，提案级 |
  | audit-routing-selection-misread-error | 0% 0/21，未启动 | 需求：复盘 routing 选型误读的扩散链；方案：用 review board 方式审计并建立阻断机制 | 很低，审查提案 |
  | design-agent-error-governance-and-runtime-gates | 0% 0/28，未启动 | 需求：补全从错误前提到 prototype/runtime/evidence/regression 的控制链；方案：设计总治理和运行闸门 | 很低，治理蓝图 |
  | design-ai-agent-routing-control-plane | 0% 0/20，未启动 | 需求：统一记忆/搜索/GitHub/浏览器调用顺序；方案：单独设计 runtime routing control plane | 很低，架构蓝图 |
  | design-ai-agent-search-layer | 0% 0/21，未启动 | 需求：把外部发现层从临时搜索升级为可复用层；方案：定义搜索边界、证据留存与写回规则 | 很低，架构蓝图 |
  | extend-shell-semantic-canvas-topology-grammar | 0% 0/18，未启动 | 需求：给 shell semantic canvas 增加拓扑语法；方案：在语义原子与布局间加入 topology grammar | 很低，扩展提案 |
  | implement-trace-first-context-recall-router | 0% 0/12，未启动 | 需求：把 trace/artifact/memory 路由变成可执行 helper；方案：实现最小 question classifier 与 provenance check | 很低，实施未开工 |
  | replace-google-scholar-with-serpapi | 0% 0/9，未启动 | 需求：修正 Google Scholar connector 稳定性问题；方案：底层改成 SerpAPI，同时保持 MCP 接口不变 | 很低，实施未开工 |
