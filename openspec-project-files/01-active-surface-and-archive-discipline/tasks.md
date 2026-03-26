## 1. Define The Lane Model

- [x] 1.1 Inventory the current changes and classify each into `active`, `pending-continue`, `backlog`, or `archive-queue`
- [x] 1.2 Define the operator-facing meaning of each lane in concise wording
- [x] 1.3 Confirm which current changes remain in the default active surface and which are demoted out of it

## 2. Define Hard Gate Rules

- [x] 2.1 Document the hard gate thresholds for `active > 7`, `archive-queue > 5`, and `2 consecutive days without closeout`
- [x] 2.2 Define the exact bounded cleanup actions required when a hard gate is triggered
- [x] 2.3 Define how a new change request is routed into `active`, `pending-continue`, or `backlog`

## 3. Build Mainline-First Views

- [x] 3.1 Create a concise `主线优先` summary format for the active surface
- [x] 3.2 Create a separate view for `archive-queue` and `pending-continue`
- [x] 3.3 Create a separate backlog view so speculative and research-first items stop competing with execution items

## 4. Add Review Cadence

- [x] 4.1 Define the minimum daily closeout template
- [x] 4.2 Define the weekly overview template with a mainline tree and lane counts
- [x] 4.3 Define how the workflow detects and records `2 consecutive days without closeout`

## 5. Pilot On The Current Workspace

- [x] 5.1 Apply the lane model to the current OpenSpec workspace and produce the first bounded summary
- [x] 5.2 Use the hard gate rules against the current counts and identify what must be cleaned up first
- [x] 5.3 Run one weekly-overview dry run and adjust the format if it still feels noisy
