## ADDED Requirements

### Requirement: Candidate governance surfaces SHALL be classified before adoption
The system SHALL classify every candidate OpenSpec, repo policy, script, prompt, skill, or host Codex config surface as governed durable source, governed deployment target, sensitive overlay, or runtime exclude before it enters the stable DevOps workflow.

#### Scenario: Durable repo asset is admitted
- **WHEN** a file such as an OpenSpec artifact, repo `AGENTS.md`, repo rule file, repo prompt, repo skill source, or governance script is proposed for stable reuse
- **THEN** the workflow SHALL classify it as a governed durable source before validation and merge decisions are made

#### Scenario: Host install path is recognized as a target
- **WHEN** a persistent host Codex file such as `~/.codex/AGENTS.md`, `~/.codex/rules/*.rules`, `~/.codex/skills/**`, or `~/.codex/config.toml` is reviewed
- **THEN** the workflow SHALL record whether that path is a deployment target, a source-of-truth exception, or an unmanaged runtime file

### Requirement: Runtime state and scratch surfaces SHALL stay out of the governed durable flow
The system SHALL exclude auth state, history, logs, sqlite databases, sessions, caches, tmp artifacts, backups, and scratch working notes from the same merge and adoption path used for durable governance surfaces.

#### Scenario: Runtime state is excluded
- **WHEN** a file under `~/.codex` is identified as auth, history, log, sqlite, session, cache, or temporary state
- **THEN** the workflow SHALL mark it as runtime exclude
- **THEN** it SHALL NOT require the same review and merge path used for durable governance sources

#### Scenario: Scratch repo artifacts are excluded
- **WHEN** a scratch note, swap file, ad-hoc canvas, or temporary evidence bundle appears in the repo
- **THEN** the workflow SHALL keep it out of the governed durable path unless it is explicitly promoted into a named change artifact

### Requirement: Sensitive values SHALL be governed by source and injection contract, not by committed literal value
The system SHALL govern where a sensitive value comes from and how it is injected, but SHALL NOT require storing the live secret value inside the durable configuration source.

#### Scenario: Secret-bearing config is reviewed
- **WHEN** a durable config file contains API keys, tokens, account identifiers, or similar sensitive literals
- **THEN** the workflow SHALL separate the durable structure from the live secret values
- **THEN** it SHALL govern the injection contract instead of treating the committed literal as the stable source of truth
