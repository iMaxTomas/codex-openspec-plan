# 思路进化说明

## 起点问题

当 OpenSpec change 逐渐增多时，`主线 active`、`做完但没归档`、`待继续`、`后续研究` 会混在一张列表里。问题不是 change 太多，而是执行面没有被硬性收窄。

## 第一阶段误区

- 直接平铺所有 change 名称
- 靠记忆判断“哪些还在做”
- 把 `已完成未归档` 和 `未启动 backlog` 一起留在默认视图里

## 收敛后的抽象

最终把 change 分成 4 条 lane：
- `active`
- `pending-continue`
- `backlog`
- `archive-queue`

同时再加 3 个硬门槛：
- `active > 7`
- `已完成未归档 > 5`
- 连续两天没做收口

## 为什么值得复用

这是一个通用的 OpenSpec 执行面治理模型，不依赖你的具体业务主题。只要 workspace 里同时存在规划、实施、研究和已完成未归档的 change，这套 lane 模型就能直接用。

## 迁移建议

- 先替换 lane 的中文命名和阈值
- 再决定 daily closeout / weekly overview 的节奏
- 最后再根据团队规模决定 `active` 上限
