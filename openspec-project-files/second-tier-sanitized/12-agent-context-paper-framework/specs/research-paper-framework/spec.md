## ADDED Requirements

### Requirement: Study process SHALL begin with a local framing pass before paper deep reading
The system SHALL require a first-pass framework extraction from local discussion artifacts before any deep reading of research-paper source files begins.

#### Scenario: Local framing precedes paper reading
- **WHEN** a new research-reading task is started from local notes and downloaded paper sources
- **THEN** the process SHALL first extract an initial framework from the local notes

### Requirement: Research reading SHALL use source-faithful paper access when available
The system SHALL prefer TeX Source based reading workflows over ad hoc summaries when arXiv source archives are already available locally.

#### Scenario: Local TeX source exists
- **WHEN** a paper source archive is already present locally
- **THEN** the study plan SHALL treat the source archive and its top-level TeX entrypoint as the primary reading target

### Requirement: The framework SHALL explicitly compare config files, skills, and minimal context
The system SHALL produce a framework that distinguishes repository-level context files, reusable skills, and minimal task-scoped context as separate design objects.

#### Scenario: Framework synthesis
- **WHEN** the plan synthesizes results from discussions and papers
- **THEN** it SHALL include explicit comparison criteria for config files, skills/modules, and minimal context strategies

### Requirement: The study output SHALL feed a reusable OpenSpec plan
The system SHALL convert the results of the paper-reading process into a reusable OpenSpec plan rather than leaving them as isolated notes.

#### Scenario: Research phase completes
- **WHEN** the initial reading and synthesis phase is complete
- **THEN** the output SHALL include a follow-on OpenSpec planning artifact that can guide future rules, skills, or playbooks
