## ADDED Requirements

### Requirement: DVC SHALL first target high-value file-centric artifact directories
The system SHALL prioritize DVC tracking for high-value raw and structured artifact directories whose contents are expensive to regenerate and worth versioning.

#### Scenario: Selecting first tracked directories
- **WHEN** DVC is first introduced into the artifact foundation
- **THEN** the initial tracked scope SHALL be limited to selected raw and derived directories rather than the entire cache root

### Requirement: Runtime lookup state SHALL remain outside first-phase DVC
The system SHALL keep runtime lookup state and high-frequency append-only traces outside the first phase of DVC tracking.

#### Scenario: Determining what not to track
- **WHEN** first-phase DVC scope is defined
- **THEN** local sqlite index files, trace logs, and cheap-to-regenerate summary files SHALL remain local-only by default

### Requirement: SQLite SHALL remain the runtime lookup layer after DVC is introduced
The system SHALL continue using local sqlite metadata for cache-first lookup even after DVC is introduced.

#### Scenario: A resource lookup occurs after DVC integration
- **WHEN** an agent checks for an existing artifact
- **THEN** runtime cache lookup SHALL continue to rely on sqlite metadata rather than treating DVC as the primary lookup mechanism

### Requirement: DVC initialization SHALL align with the Git repository root
The system SHALL initialize DVC in a way that preserves a clear relationship between Git-tracked code, `.dvc` pointer files, and the `.artifact-cache/` directories under management.

#### Scenario: First DVC setup is planned
- **WHEN** DVC setup instructions are defined
- **THEN** they SHALL assume initialization at the current Git repository root unless a strong reason is documented otherwise

### Requirement: Remote storage SHALL remain deferred until local DVC scope is stable
The system SHALL not require immediate DVC remote configuration as part of the first integration phase.

#### Scenario: First DVC integration is completed
- **WHEN** the first DVC integration plan is defined
- **THEN** remote storage SHALL remain optional and deferred until the tracked local scope has proven stable
