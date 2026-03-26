## ADDED Requirements

### Requirement: The workflow SHALL require daily closeout after drift
The workflow SHALL track whether a bounded closeout has been completed for the current day.
If two consecutive days pass without closeout, the workflow SHALL enter a hard reminder state.

#### Scenario: Two days pass without closeout
- **WHEN** the operator reaches two consecutive days without a closeout record
- **THEN** the workflow requires a bounded cleanup review before opening a new active change

### Requirement: Daily closeout SHALL summarize the execution surface
Each daily closeout SHALL summarize, at minimum, the current mainline, active count, archive-queue count, pending-continue count, backlog count, and the next intended continuation point.

#### Scenario: A day ends with active work in progress
- **WHEN** the operator performs daily closeout
- **THEN** the closeout records the mainline summary and the next continuation point in a bounded format

### Requirement: Weekly overview SHALL provide a mainline-first summary
The workflow SHALL produce a weekly overview that summarizes the workspace in a mainline-first format instead of a full flat inventory.
The weekly overview SHALL include the current mainline tree, active surface, archive queue, pending-continue queue, backlog counts, and the top drift risks.

#### Scenario: Weekly review is performed
- **WHEN** the operator runs the weekly review
- **THEN** the resulting summary presents the mainline tree and lane counts before any long-name inventory
