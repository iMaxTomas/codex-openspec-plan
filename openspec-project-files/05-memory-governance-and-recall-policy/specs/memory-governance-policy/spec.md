## ADDED Requirements

### Requirement: Memory governance SHALL define explicit authority layers
The system SHALL govern memory using explicit authority layers: `canonical`, `durable`, `session`, `observation`, and `evidence`. Each layer SHALL have a defined write authority and default read behavior.

#### Scenario: Current stack is classified
- **WHEN** the current memory stack is described for implementation follow-up
- **THEN** `OpenMemory` SHALL be treated as `durable`, `Langfuse` SHALL be treated as `observation`, `.artifact-cache + DVC` SHALL be treated as `evidence`, and temporary current-run state SHALL be treated as `session`

### Requirement: Memory governance SHALL define time buckets from the existing timestamp baseline
The system SHALL assign governed memory records using at least `created_at` and `last_used_at`, and SHALL define named governance buckets on top of that timestamp baseline.

#### Scenario: A governed memory record is evaluated for recency
- **WHEN** a governed memory record is considered for recall
- **THEN** it SHALL be assigned to one of `30m`, `1h`, `3h`, `6h`, `12h`, `today`, or `older`
- **AND** any `hot / warm / cold` tier mapping SHALL be treated as a governance mapping layered on top of those named buckets

### Requirement: Memory governance SHALL distinguish lifecycle states
The system SHALL distinguish `active`, `stale`, `superseded`, and `archived` as separate lifecycle states, and SHALL define different default recall behavior for each state.

#### Scenario: A memory has become old but not contradicted
- **WHEN** a memory has aged past the active threshold without newer confirmation
- **THEN** it SHALL be eligible for `stale`
- **AND** it SHALL not be treated as `superseded`

#### Scenario: A memory is replaced by a newer authoritative fact
- **WHEN** a newer or higher-authority memory contradicts or replaces an older durable fact
- **THEN** the older fact SHALL become `superseded`
- **AND** the superseded fact SHALL be excluded from default recall

### Requirement: Default recall SHALL enforce the existing small-budget contract plus explicit governance caps
The system SHALL preserve the current small-budget recall contract and SHALL define explicit item-count, token, and per-bucket limits plus default exclusions.

#### Scenario: Default recall runs under normal operator flow
- **WHEN** a standard recall request runs without an explicit expanded mode
- **THEN** the system SHALL limit governed durable recall to at most `3` items
- **AND** the assembled memory payload SHALL stay within `600` tokens
- **AND** default recall SHALL exclude `superseded`, `archived`, `observation`, and `evidence`

#### Scenario: Cold memory exists but no expanded recall was requested
- **WHEN** recall considers `cold` memory
- **THEN** `cold` memory SHALL not consume default recall budget unless the caller explicitly requests expanded recall

### Requirement: Durable write and promotion SHALL follow authority rules
The system SHALL require durable memory to come from authoritative write or promotion paths, and SHALL prohibit raw transcript, trace, or evidence text from silently becoming durable memory.

#### Scenario: Raw evidence is ingested
- **WHEN** a transcript fragment, stdout, stderr, review body, or raw artifact text is captured
- **THEN** it SHALL remain `evidence` or `observation`
- **AND** it SHALL not become `durable` memory unless an explicit promotion path authorizes it

#### Scenario: Current MVP memory types are governed
- **WHEN** the system maps the current MVP memory types into governed categories
- **THEN** `rule` SHALL map to durable `patterns`
- **AND** `pattern` SHALL map to durable `patterns` or `cases`
- **AND** `fact` SHALL map to durable `entities` or `events`
- **AND** `open_loop` SHALL default to `session` unless explicitly promoted as long-lived

#### Scenario: Post-run memory write-back occurs under the default contract
- **WHEN** a wrapped workflow completes under the default memory contract
- **THEN** post-run memory write-back SHALL remain limited to `1~3` short reusable memories
- **AND** raw stdout, stderr, review body, and imported artifact text SHALL remain outside durable memory

### Requirement: Governance SHALL prevent silent overwrite of higher-authority memory
The system SHALL define dedupe, merge, append, and conflict-review behavior, and SHALL forbid lower-authority writes from silently overwriting higher-authority durable or canonical memory.

#### Scenario: A lower-authority write conflicts with a higher-authority durable fact
- **WHEN** a new write conflicts with an existing higher-authority durable or canonical record
- **THEN** the system SHALL open a conflict path or preserve the higher-authority record
- **AND** it SHALL not silently replace the higher-authority record

### Requirement: Governance SHALL define reusable operator outputs and evaluation checks
The system SHALL produce reusable operator-facing outputs that later runtime changes MUST follow: a lifecycle table, a recall-budget table, and an evaluation checklist.

#### Scenario: A follow-up runtime change is proposed
- **WHEN** a later change extends memory runtime behavior
- **THEN** it SHALL reference the lifecycle table, recall-budget table, and evaluation checklist from this governance change

#### Scenario: Memory quality is reviewed
- **WHEN** memory governance is evaluated
- **THEN** the evaluation checklist SHALL cover recall quality under budget, stale/superseded suppression, promotion precision, and cross-project contamination risk
