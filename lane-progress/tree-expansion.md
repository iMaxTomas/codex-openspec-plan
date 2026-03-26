## 四栏状态

```text
最后更新：2026-03-26 22:38 CST
总览：OpenSpec change 52 | archived 9 | active 5 | pending-continue 6 | backlog 11 | archive-queue 21
.
├── active (5)                 #当前主线，默认执行面
│   ├── active-surface         15/15  #总控 change，已完成但继续作为治理入口
│   ├── runner                 15/16  #只差最后一个 host-safe write blocker
│   ├── vm-agent-lab           26/27  #实验室主链几乎闭环
│   ├── hook-dispatch           4/15  #事件流刚进入实现段
│   └── multi-provider-team    10/24  #团队拓扑已定，仍在补实证
├── pending-continue (6)       #会继续，但不挤进当前主线
│   ├── local-smb-share        10/11  #接近完成，等本周窗口
│   ├── artifact-foundation    14/23  #设计过半，待继续实施
│   ├── canvas-topology         0/18  #规范扩展，暂缓
│   ├── obsidian-cli           21/22  #只差最后收尾
│   ├── ai-canvas-board        17/18  #模板主链已通
│   └── bili-summary-skill     30/42  #原型可用，剩缓存和归档收口
├── backlog (11)               #后续研究 / 未启动 / proposal-only
│   ├── gitagent-migration      0/0   #只有 proposal，尚未建 tasks
│   ├── recall-router           0/12  #未启动
│   ├── error-governance        0/28  #治理蓝图，未开工
│   ├── claim-review            0/19  #治理提案，未开工
│   ├── routing-audit           0/21  #审计提案，未开工
│   ├── control-plane           0/20  #架构蓝图，未开工
│   ├── search-layer            0/21  #架构蓝图，未开工
│   ├── ascii-cards             0/11  #扩展提案，未开工
│   ├── serpapi-replace         0/9   #替换计划，未开工
│   ├── ai-base-env             0/23  #基础环境蓝图，未开工
│   └── drift-review            0/13  #review 提案，未开工
└── archive-queue (21)         #已完成但未 archive，当前最大噪音源
    ├── memory / artifact / observability (11)
    │   ├── shared-memory              18/18  #已完成，待 archive
    │   ├── recall-mvp                 21/21  #已完成，待 archive
    │   ├── langfuse-wrapper           13/13  #已完成，待 archive
    │   ├── local-cache-mvp            22/22  #已完成，待 archive
    │   ├── memory-governance          21/21  #已完成，待 archive
    │   ├── langfuse-docker-mvp        14/14  #已完成，待 archive
    │   ├── langfuse-evaluate          14/14  #已完成，待 archive
    │   ├── observability-foundation   16/16  #已完成，待 archive
    │   ├── dvc-init                   18/18  #已完成，待 archive
    │   ├── dvc-integration            15/15  #已完成，待 archive
    │   └── memory-research            24/24  #已完成，待 archive
    ├── rules / governance (5)
    │   ├── openspec-devops            15/15  #已完成，待 archive
    │   ├── trace-first-routing        20/20  #已完成，待 archive
    │   ├── minimal-context            15/15  #已完成，待 archive
    │   ├── explanation-deploy          9/9   #已完成，待 archive
    │   └── explanation-rules          12/12  #已完成，待 archive
    └── tools / workflow (5)
        ├── gitagent-skill              9/9   #已完成，待 archive
        ├── gitagent-local-branch       9/9   #已完成，待 archive
        ├── shell-canvas               22/22  #已完成，待 archive
        ├── adapter-port               12/12  #已完成，待 archive
        └── context-study              12/12  #已完成，待 archive
```
