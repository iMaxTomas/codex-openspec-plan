## ADDED Requirements

### Requirement: Governed change sessions SHALL declare a primary milestone and stop line
Any session that modifies a governed durable source or governed deployment target SHALL record one primary milestone, a stop line, and any sidecar work before execution begins.

#### Scenario: Session starts on a governed change
- **WHEN** an operator starts work on a governed OpenSpec, policy, script, prompt, skill, or host-config promotion slice
- **THEN** the session SHALL name one primary milestone that defines success for that slice
- **THEN** the session SHALL also record the stop line and any non-blocking sidecar tasks

### Requirement: Shared-write governed work SHALL use explicit ownership and isolation
The system SHALL keep one write owner for shared governance surfaces unless parallel writes are isolated through a Git branch, worktree, or another explicit isolated root.

#### Scenario: Read-heavy side task uses subagents
- **WHEN** a governed task is read-heavy, independently summarizable, and does not need shared writes
- **THEN** the workflow SHALL allow built-in subagents or similar bounded side work
- **THEN** the main thread SHALL keep ownership of integration and final promotion decisions

#### Scenario: Parallel writes require isolation
- **WHEN** two tasks would modify the same governed repository or config surface in parallel
- **THEN** the workflow SHALL either keep those writes serial or isolate them through explicit branch/worktree boundaries
- **THEN** it SHALL NOT treat plain multi-window editing of the same checkout as sufficient isolation

### Requirement: Governed changes SHALL pass validation, test, and revalidation gates before adoption
Any change to a governed durable source or governed deployment target SHALL run a validation chain that includes static validation, behavioral testing, and post-fix revalidation before it can be adopted as a stable baseline.

#### Scenario: Governance-relevant modification is proposed
- **WHEN** a governed rule, prompt, skill, script, OpenSpec artifact, or host config source is updated
- **THEN** the workflow SHALL run the validation and test steps defined for that surface
- **THEN** it SHALL re-run the required checks after material fixes before marking the slice ready for adoption

### Requirement: Stable adoption SHALL require evidence and optimization review
The system SHALL require a minimum evidence package and an optimization review before a governed change is merged or promoted as stable practice.

#### Scenario: Adoption decision is made
- **WHEN** a governed change is proposed for merge, promotion, or stable reuse
- **THEN** the workflow SHALL record the responsible owner, the related change or branch, the validation/test/revalidation evidence, and the promotion target
- **THEN** the workflow SHALL also record whether the change keeps long-lived config minimal and whether it adds avoidable operational overhead or host drift risk
