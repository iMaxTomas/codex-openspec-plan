## ADDED Requirements

### Requirement: Changes SHALL be classified into execution lanes
The workflow SHALL classify each OpenSpec change into exactly one of the following lanes: `active`, `pending-continue`, `backlog`, or `archive-queue`.

`active` SHALL mean the change is part of the current execution surface and may be worked in the next few sessions.
`pending-continue` SHALL mean the change is paused but still expected to resume.
`backlog` SHALL mean the change is not part of current execution and SHALL not compete for default attention.
`archive-queue` SHALL mean the change is fully complete but still awaiting archive closure.

#### Scenario: A change is reviewed for placement
- **WHEN** the operator reviews a change during planning or cleanup
- **THEN** the change is assigned to exactly one execution lane

### Requirement: The active surface SHALL remain bounded
The default operator-facing view SHALL present only the bounded active surface as the primary execution list.
The workflow SHALL treat `active > 7` as an overload condition.

#### Scenario: The active surface exceeds the threshold
- **WHEN** the number of active changes becomes greater than 7
- **THEN** the workflow marks the workspace as overloaded and requires cleanup before a new change is opened

### Requirement: Completed work SHALL enter an archive queue
Changes with all tracked tasks complete but not yet archived SHALL be treated as `archive-queue` items instead of remaining mixed into the default execution surface.
The workflow SHALL treat `archive-queue > 5` as an overload condition.

#### Scenario: Too many completed changes remain unarchived
- **WHEN** more than 5 completed changes remain outside archive
- **THEN** the workflow requires archive cleanup before allowing a new change to be opened

### Requirement: New change creation SHALL honor hard gate conditions
Before a new change is opened, the workflow SHALL check overload thresholds and the latest closeout state.
If any hard gate condition is triggered, the operator SHALL first review active, pending, backlog, and archive-queue placement.

#### Scenario: A new change is requested while gates are triggered
- **WHEN** the operator wants to open a new change and at least one gate condition is active
- **THEN** the workflow blocks the new change from entering the active surface until bounded cleanup is completed
