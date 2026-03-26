## ADDED Requirements

### Requirement: Durable host Codex configuration SHALL have a repo-managed source form
The system SHALL manage durable host Codex policy and configuration through repo-tracked source artifacts and SHALL treat the installed `~/.codex` copies as deployment targets by default.

#### Scenario: Repo source exists for a host config surface
- **WHEN** a durable host Codex surface such as `AGENTS.md`, a rules file, a prompt, a skill, or a config template has a repo-tracked source artifact
- **THEN** the workflow SHALL use that repo artifact as the primary review and merge surface
- **THEN** the installed `~/.codex` copy SHALL be treated as a promoted target rather than as the only source of truth

#### Scenario: Host-only durable artifact is discovered
- **WHEN** a durable host Codex artifact exists only under `~/.codex`
- **THEN** the workflow SHALL either register it as an explicit temporary exception or create a backlog item to migrate it into a repo-managed source form

### Requirement: `config.toml` promotion SHALL separate durable structure from secret overlay
The system SHALL promote host `config.toml` through a durable structure definition plus a secret overlay mechanism rather than by directly versioning a live secret-bearing file.

#### Scenario: `config.toml` structure is promoted
- **WHEN** model selection, trusted paths, skill enablement, MCP command wiring, or shell environment policy changes
- **THEN** the workflow SHALL review those durable fields in a repo-managed source form
- **THEN** the live secret-bearing values SHALL be injected separately at promotion time

### Requirement: Host config promotion SHALL include smoke validation
The system SHALL validate promoted host Codex configuration on the target machine before the promotion is accepted as the new stable baseline.

#### Scenario: Rule or skill is promoted to host
- **WHEN** a host `AGENTS.md`, rules file, skill, or `config.toml` projection is installed or updated under `~/.codex`
- **THEN** the workflow SHALL run a smoke validation appropriate to that surface
- **THEN** the promotion evidence SHALL record whether the host accepted and could use the new configuration
