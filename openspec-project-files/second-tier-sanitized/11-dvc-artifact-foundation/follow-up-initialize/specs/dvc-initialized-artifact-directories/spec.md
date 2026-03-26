## ADDED Requirements

### Requirement: DVC SHALL be initialized at the repository root for first-phase artifact tracking
The system SHALL initialize DVC at the current Git repository root when selected artifact directories are first brought under DVC management.

#### Scenario: First DVC setup is executed
- **WHEN** the first implementation step for DVC is performed
- **THEN** DVC SHALL be initialized at the repository root rather than in a nested cache subdirectory

### Requirement: Only selected high-value artifact directories SHALL be tracked in the first phase
The system SHALL limit first-phase DVC tracking to the selected high-value artifact directories defined by the planning change.

#### Scenario: DVC adds first artifact directories
- **WHEN** first-phase DVC tracking is configured
- **THEN** only the selected raw and derived directories SHALL be added

### Requirement: Runtime lookup state SHALL remain outside first-phase DVC execution
The system SHALL preserve sqlite lookup state, trace logs, and cheap summaries as local-only runtime state during the first execution phase.

#### Scenario: Runtime state is reviewed after DVC initialization
- **WHEN** the first DVC execution step completes
- **THEN** sqlite, traces, and cheap summaries SHALL remain outside the tracked DVC scope
