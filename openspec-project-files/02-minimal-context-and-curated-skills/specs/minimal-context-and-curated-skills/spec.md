## ADDED Requirements

### Requirement: Long-lived AI configuration SHALL stay minimal
The system SHALL restrict long-lived AI configuration files to high-value information that is stable across tasks and cannot be reliably inferred from the repository or environment.

#### Scenario: Global config review
- **WHEN** an `AGENTS.md`, `CLAUDE.md`, or equivalent long-lived config is reviewed
- **THEN** the review SHALL reject content that is obvious, redundant, or task-specific

### Requirement: Procedural knowledge SHALL prefer curated skills
The system SHALL place procedural, reusable, task-oriented knowledge into curated skills instead of repository-level config whenever that knowledge can be modularized.

#### Scenario: Procedural guidance identified
- **WHEN** a guidance item mainly describes a repeatable procedure, workflow, or validation routine
- **THEN** it SHALL be classified as skill-candidate content rather than long-lived config content

### Requirement: Task-specific context SHALL remain task-scoped
The system SHALL keep one-off task goals, temporary constraints, and task-specific acceptance criteria in task-scoped plans or OpenSpec changes rather than long-lived configuration.

#### Scenario: One-off task information appears
- **WHEN** task-specific information is generated during planning or execution
- **THEN** it SHALL be stored in a task-scoped artifact instead of a persistent config file

### Requirement: Self-generated config or skills SHALL require explicit review
The system SHALL not treat automatically generated config files or self-generated skills as trusted defaults.

#### Scenario: Auto-generated augmentation proposed
- **WHEN** an AI system proposes a new config block or skill without prior curation
- **THEN** it SHALL require explicit review before being adopted into persistent configuration or curated skills

### Requirement: Persistent AI configuration SHALL support periodic audits
The system SHALL provide a repeatable audit method to evaluate whether persistent AI configuration has become too long, stale, duplicated, or improperly mixed with skills or task-scoped knowledge.

#### Scenario: Periodic audit runs
- **WHEN** a periodic audit of AI configuration is performed
- **THEN** the audit SHALL classify content into keep, move-to-skill, move-to-task-plan, or remove
