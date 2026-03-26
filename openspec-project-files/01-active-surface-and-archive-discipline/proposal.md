## Why

当前 OpenSpec change 已经积累到“主线、已完成未归档、待继续、纯研究 backlog”混在同一视图里，导致你每次回看时都要重新分辨什么是现在真正在做的事。问题不是 change 太少，而是执行面没有被硬性收窄，收口节奏也没有被固定下来。

## What Changes

- Add a bounded `active surface` model that separates `主线 active`、`待继续 pending`、`backlog` and `archive queue`.
- Add hard reminder gates before opening a new change when overload thresholds are exceeded.
- Add a daily closeout rhythm that runs when two consecutive days pass without收口.
- Add a weekly overview that shows the mainline tree, archive queue, pending queue, and backlog counts in one place.
- Add concise operator-facing views so the default summary stays `主线优先`, not full-name-first.

## Capabilities

### New Capabilities
- `active-surface-governance`: Define the lane model, thresholds, and pre-new-change gate behavior for OpenSpec changes.
- `review-cadence`: Define the daily closeout and weekly overview rhythm for keeping the active surface bounded.

### Modified Capabilities
- None.

## Impact

- Affected systems: OpenSpec planning workflow, change review discipline, archive discipline, daily/weekly summary artifacts, and any helper scripts that compute counts or generate views.
- Affected operator behavior: opening new changes, deciding whether a change is active vs pending vs backlog, and closing each day with a bounded summary.
- No external API impact.
