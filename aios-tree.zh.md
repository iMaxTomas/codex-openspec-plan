# AIOS 树

我问“一个新项目该挂到哪一层”
-> 我先看 operator-facing 主线
-> 再把 transport、artifact、owner、executor 一层层拆开
-> 每一天都沉淀一个更硬的边界
-> 最后这棵树才长出今天的对照表
-> 下次再遇到新项目，我先把它挂到正确枝杈上，而不是直接混进一个大桶

```text
                                      AIOS TREE
                        这张分层对照表是怎么慢慢长成一棵树的


                                                [ 2026-03-31 ]
                                              新叶簇开始长出来
                                   “新的项目进来：hermes-agent”
                                                      |
                                                      v
                                  .--------------------------------------.
                                 / runtime-orchestration-control-plane     \
                                /              显式对照图出现               \
                               '--------------------------------------------'
                                 |                  |                  |
                                 |                  |                  |
                                 |                  |                  `=> Harness
                                 |                  |                      control plane / platform
                                 |                  |
                                 |                  `=> hermes-agent
                                 |                      runtime / product
                                 |
                                 `=> ClawTeam-OpenClaw
                                     worker-coordination shell

                                          ^
                                          |
                                          |
                                   从更早的主干继续长出来
                                          |
                                          |
             错路 <-----------------------+-----------------------> 正路
   “把 runtime、orchestration、provider、control plane 混成一类”   “每个东西只在自己那层里比较”


     [ 2026-03-29 ]                                                                  侧枝
   accepted mainline 被正式说清                                                       completion closure
             |                                                                                |
             v                                                                                v
    .-------------------------------.                                           .-----------------------------.
   / host Codex -> A2A -> OpenClaw  \                                         / truth -> latest -> wake ->  \
  / main agent -> 103 Codex          \                                       / processed summary             \
  '-----------------------------------'                                      '-------------------------------'
             |                                                                                |
             |                                                                                |
             |                                                                                `=> “结果真相层在
             |                                                                                     orchestration 之下”
             |
             +--> OpenClaw main
             |      = orchestration owner
             |
             +--> 103 Codex
             |      = bounded executor
             |
             +--> agentapi
             |      = support-only
             |
             `--> SSH
                    = break-glass / repair


                     [ 2026-03-28 ]
              transport 和 artifact 的枝杈被明确分开
                              |
                              v
                   .----------------------------------.
                  / worker 不能再临场自己决定           \
                 / repo sync / NFS / SMB / ...          \
                 '--------------------------------------'
                         /                 |                 \
                        /                  |                  \
                       v                   v                   v
                  [ repo sync ]       [ NFS ]             [ SMB ]
                  tracked rules       machine-facing      human-facing
                  和 workspace        默认 bus            export only
                                          |
                                          |
                                          `=> “SMB 不是 peer AI route”

                              \
                               \
                                `=> runtime-local evidence
                                    和 continuity memory
                                    继续保持独立表面


             [ 2026-03-26 ]                    [ 2026-03-26 ]
         transport 分流开始                 host/vm103 协作关系开始成形
                  |                                      |
                  v                                      v
      .---------------------------.          .--------------------------------.
     / NFS primary bus 和 SMB      \        / host supervisor + vm103 executor \
    / auxiliary side port 出现      \      / 协作模型开始稳定                   \
    '-------------------------------'      '------------------------------------'
                  \                                      /
                   \                                    /
                    \                                  /
                     \                                /
                      \                              /
                       \                            /
                        \                          /
                         \                        /
                          \                      /
                           \                    /
                            \                  /
                             \                /
                              \              /
                               \            /
                                \          /
                                 \        /
                                  \      /
                                   \    /
                                    \  /
                                     \/
                              ==================
                              ||    ROOT      ||
                              || operator 问：||
                              || “host 和     ||
                              || vm103 到底   ||
                              || 应该怎么配合?”||
                              ==================


    根部记忆
    --------
    不是：
      “一个大系统里所有路径都算主路径”

    而是：
      “一棵树里每根枝杈都只负责自己的事”


    root -> trunk -> branches -> leaves
    -----------------------------------
    root:
      我需要 host 和 vm103 协作

    trunk:
      ownership 和 transport 必须分开

    branches:
      repo sync / NFS / SMB / A2A / runtime-local / support-only edges

    leaves:
      OpenClaw / ClawTeam-OpenClaw / hermes-agent / Harness
      分别挂在自己的层里，而不是被混成一桶
```

## 复用锚点

不是：

- 每个新 AI 项目都只是“另一个 agent”
- 每条 transport 路径都只是“另一个 mainline”
- 每个看起来像平台的东西都放进同一张比较表

而是：

- 先把它放到树上
- 再只和同一枝杈上的邻居比较

## 时间线锚点

- `2026-03-26`
  - transport 分流和 host/vm103 协作开始分家
- `2026-03-28`
  - artifact 和 routing boundary 被明确写死
- `2026-03-29`
  - accepted mainline 以及 owner/executor 分工稳定下来
- `2026-03-31`
  - 因为加入 `hermes-agent`，四者对照表才显式长出来
