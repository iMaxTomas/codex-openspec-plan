## ADDED Requirements

### Requirement: Langfuse is the first observability backend
The system SHALL adopt Langfuse as the first platformized observability backend for agent execution traces, run metadata, tool calls, and execution transcripts.

#### Scenario: Langfuse backend is selected for first-phase observability planning
- **WHEN** the observability foundation is planned for the current agent stack
- **THEN** Langfuse is defined as the first backend target instead of LangSmith or Braintrust

### Requirement: Observability, artifact, and memory remain separate layers
The system SHALL preserve separate responsibilities for observability traces, raw artifacts, and shared memory.

#### Scenario: Raw artifacts remain outside Langfuse
- **WHEN** raw files, search outputs, GitHub snapshots, or downloaded sources are stored
- **THEN** they remain in the artifact cache and DVC-managed file layer rather than being treated as Langfuse primary storage

#### Scenario: Shared memory remains outside Langfuse
- **WHEN** long-lived project facts, preferences, cases, or continuity state are promoted
- **THEN** they are treated as shared memory concerns rather than Langfuse trace concerns

### Requirement: Thin ingestion adapters are used for event forwarding
The system SHALL use thin ingestion adapters to normalize and forward observability events into Langfuse, and SHALL NOT introduce a custom observability backend.

#### Scenario: Adapter forwards normalized events
- **WHEN** a supported client or runtime emits chat, tool, CLI, or run events
- **THEN** a thin adapter forwards normalized event metadata to Langfuse and returns trace or run identifiers without replacing the backend

### Requirement: First-phase event model covers execution essentials
The system SHALL define a minimum observability event model that covers run lifecycle, message metadata, tool-call metadata, bash or CLI execution metadata, errors or retries, and artifact handles.

#### Scenario: First-phase event classes are fixed
- **WHEN** the first implementation change is prepared
- **THEN** it uses an event model that includes run lifecycle, message metadata, tool calls, bash or CLI execution metadata, errors or retries, and artifact references

### Requirement: Codex-first rollout uses external capture
The system SHALL prioritize Codex as the first ingestion target and SHALL assume external capture or wrapper-based collection for the first phase.

#### Scenario: Codex is the first integrated client
- **WHEN** the first Langfuse integration implementation is scoped
- **THEN** Codex is treated as the first target and integration is designed around external capture rather than requiring an in-client hooks system

#### Scenario: Other clients are deferred behind Codex
- **WHEN** Claude Code, <future-control-plane>, and Gemini are considered for observability onboarding
- **THEN** they are treated as follow-up integrations after the Codex-first event path is defined
