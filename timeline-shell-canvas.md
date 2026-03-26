# Document-Test OpenSpec Timeline Shell Canvas

先记操作员视角这条链：

`我问这个项目到底包含什么 -> 系统不再逐个列 51 个 change -> 改按时间顺序和层级来展开 -> 每一层沉淀计划/实现/证据/记忆 -> 下次我直接复用这张图`

```text
not this: 51 个互相散开的计划名
but this: 一条按时间展开的主轴 + 挂在主轴上的层级卡片


  operator chain:

  [我问: 这个项目现在到底有哪些层]
        -> [不要再逐个读 51 个 change]
        -> [按时间顺序拉出主轴]
        -> [把层级卡片挂到主轴上]
        => [下次继续时直接复用这张图]


  main time spine:

  [00 基座/transport] -> [01 规则治理] -> [01.2 搜索/路由] -> [02 OpenSpec 计划面] -> [02.1 实施状态]
          |                    |                    |                     |                        |
          |=> host / VM103     |=> explanation      |=> memory 还是 web   |=> proposal / design    |=> archived      =  2
          |=> NFS / SMB        |=> minimal context  |=> trace-first       |=> tasks / specs        |=> full not arch = 28
          |=> runner / hook    |=> review / gates   |=> routing plane     |=> 全部 51 个 change    |=> over half     =  7
          |=> provider lanes   |=> rollout control  |=> quote provenance  |=> planning surface     |=> early / plan  = 14
          |
          +----------------------------------------------------------------------------------------------+
                                                                                                         |
                                                                                                         v
                     [03 Artifact / cache / trace] -> [04 Memory / Recall] -> [04.1 A2A / 多执行面协作]
                                |                               |                                |
                                |=> artifact-first cache        |=> durable / session / evidence |=> host Codex supervisor
                                |=> DVC versioning              |=> RecallNest continuity         |   -> transport surface
                                |=> Langfuse observability      |=> memory governance             |   -> VM103 lanes
                                |=> codex-first ingest          |=> recall reuse                  |   => evidence / handoff / recall
                                                                                                  |
                                                                                                  |  not a standalone magic protocol
                                                                                                  |  but a real cross-runtime chain
                                                                                                  v
                                                        [05 工具 / 技能工作流] -> [06 研究 / 评审 / 审计]
                                                                     |                         |
                                                                     |=> Obsidian / gitagent   |=> research / study
                                                                     |=> canvas / bili         |=> evaluate / audit
                                                                     |=> 日常 workflow 落点     |=> 给前面几层纠偏


  bottom reuse:

  [我下次继续项目]
        -> 先顺着主轴看自己卡在哪个时间段
        -> 再看该层右侧挂的关键内容
        -> 需要细节时再回到 list.md
        => 不需要重新扫 51 个 change 名字


  side count snapshot:

  governance .............. 11
  search / routing ........  5
  transport / A2A ......... 12
  artifact / trace ........  8
  memory / recall .........  4
  tools / workflows ....... 10
  strict research .........  1


  reading hint:

  ->  = 时间推进 / 动作链
  =>  = 产物 / 证据 / 复用落点
  |=> = 该层挂出来的关键内容
```

简读：

- 这张图把项目从“很多离散计划”压成“一条时间主轴”。
- 这次采用的是 `shared backbone` 主原型，下面挂层级卡片，不再画成纯纵向链。
- 真正的主题层是 `00 / 01 / 01.2 / 03 / 04 / 04.1 / 05 / 06`。
- `02` 和 `02.1` 更像横切的 planning / status 视角。
