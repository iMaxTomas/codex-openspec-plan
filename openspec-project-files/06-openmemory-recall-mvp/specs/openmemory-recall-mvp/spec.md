## ADDED Requirements

### Requirement: The MVP SHALL search short memories before a wrapped Codex run
The system SHALL allow operators to search a small bounded set of short memories from `OpenMemory` before a real wrapped `Codex` command runs.

#### Scenario: Search before run
- **WHEN** an operator starts a real `Codex` task under the local MVP
- **THEN** the flow first retrieves up to `top-3` short memories from `OpenMemory`
- **AND** the wrapped `Codex` run begins only after that search step

### Requirement: The MVP SHALL write back a small bounded set of memories after a run
The system SHALL allow operators to add a small bounded set of stable short memories to `OpenMemory` after a real wrapped `Codex` run completes.

#### Scenario: Add after run
- **WHEN** a wrapped `Codex` run finishes and produces usable conclusions
- **THEN** the operator or a thin helper can add `1~3` short memories to `OpenMemory`
- **AND** the write-back step does not replace raw artifact storage or trace storage

### Requirement: The MVP SHALL preserve artifact and trace separation
The system SHALL keep raw outputs in `artifact-cache` and run/session timelines in `Langfuse`, while `OpenMemory` stores only short reusable memories.

#### Scenario: Raw output remains outside memory
- **WHEN** a run produces full `stdout`, `stderr`, review text, or fetched raw content
- **THEN** that raw content remains in `artifact-cache`
- **AND** `OpenMemory` only stores short memory summaries plus metadata

### Requirement: The MVP SHALL support four minimal memory types
The system SHALL classify each written memory as one of four initial types: `rule`, `fact`, `pattern`, or `open_loop`.

#### Scenario: Memory type is assigned on write
- **WHEN** a new short memory is written during the MVP
- **THEN** it is stored with one of the four initial memory types

### Requirement: Each memory SHALL keep minimal back-links
The system SHALL preserve enough metadata for a recalled memory to point back to the current project, trace, and local artifact evidence.

#### Scenario: Memory points back to evidence
- **WHEN** a memory is written to `OpenMemory`
- **THEN** it includes at least:
  - `project`
  - `type`
  - `session_id`
  - `trace_id`
  - `artifact_handle`
  - `created_at`
  - `last_used_at`
  - `importance`

### Requirement: The MVP SHALL avoid automatic graph and decay logic
The system SHALL NOT require automatic graph-edge construction, automatic time-bucket scheduling, or automatic stale/superseded lifecycle handling in the first executable MVP.

#### Scenario: Minimal scope remains enforced
- **WHEN** the first OpenMemory MVP is implemented
- **THEN** it stops at search-before-run, add-after-run, and minimal metadata
- **AND** more advanced graph/time lifecycle logic is deferred to later changes
