## ADDED Requirements

### Requirement: Context-recall questions SHALL be classified before retrieval begins
The system SHALL classify operator-facing context-recall requests into `trace questions`, `artifact questions`, or `memory questions` before selecting a retrieval path.

#### Scenario: Exact prior wording is requested
- **WHEN** an operator asks for a prior quote, prior question, previous wording, or an answer "一字不差"
- **THEN** the system SHALL classify the request as a `trace question`

#### Scenario: Prior research output is requested
- **WHEN** an operator asks what a previous search, research pass, or saved study produced
- **THEN** the system SHALL classify the request as an `artifact question`

#### Scenario: Stable long-term understanding is requested
- **WHEN** an operator asks about durable preferences, recurring concerns, or stable prior conclusions
- **THEN** the system SHALL classify the request as a `memory question`

### Requirement: Trace questions SHALL use trace-first routing
The system SHALL route `trace questions` to trace or timeline evidence before consulting artifact summaries or durable memory.

#### Scenario: Quote lookup is processed
- **WHEN** a `trace question` is received
- **THEN** the system SHALL consult trace or timeline evidence first
- **AND** it SHALL treat artifact as verification or fallback evidence rather than as the primary exact-quote source

### Requirement: Artifact questions SHALL use artifact-first routing
The system SHALL route `artifact questions` to stored evidence objects and summaries before consulting trace or durable memory.

#### Scenario: Research summary is requested
- **WHEN** an `artifact question` is received
- **THEN** the system SHALL consult stored artifacts and compact summaries first
- **AND** it MAY consult trace or memory only as supporting context

### Requirement: Memory questions SHALL use memory-first routing
The system SHALL route `memory questions` to durable memory first, while preserving artifact backlinks and optional trace lookup.

#### Scenario: Stable preference or long-term pattern is requested
- **WHEN** a `memory question` is received
- **THEN** the system SHALL consult durable memory first
- **AND** it SHALL preserve the ability to follow memory backlinks into artifact or trace evidence when needed

### Requirement: Routing rules SHALL avoid unnecessary trace-first cost
The system SHALL NOT force all context-recall questions into trace-first retrieval when the request is actually about artifacts or durable memory.

#### Scenario: Research artifact is requested without exact-quote language
- **WHEN** an operator asks for prior research conclusions or saved files without asking for exact prior wording
- **THEN** the system SHALL avoid defaulting that request to `trace-first`
