## ADDED Requirements

### Requirement: Complex explanations SHALL start from a first-person action chain
The system SHALL explain complex toolchains and data flows by first describing the operator-facing action chain in first-person sequence before introducing system decomposition.

#### Scenario: A wrapper-based execution flow is explained
- **WHEN** the system explains a `wrapper -> tool -> persistence` chain
- **THEN** it first states the sequence as `I do X -> wrapper receives it -> wrapper starts Y -> result is saved`
- **AND** it does not begin with architecture-layer terminology

### Requirement: Explanations SHALL explicitly reject common wrong interpretations
The system SHALL proactively rule out common misunderstandings when the chain could be mistaken for internal nested calls, automatic plugin callbacks, or hidden memory behavior.

#### Scenario: A user may confuse wrapper execution with nested tool recursion
- **WHEN** the chain includes a wrapper that launches a tool process
- **THEN** the explanation explicitly states that the running tool is not internally launching another identical tool unless that is actually true
- **AND** it explicitly distinguishes current behavior from future automation

### Requirement: System decomposition SHALL follow operator understanding
The system SHALL explain wrapper responsibilities, artifact storage, and trace storage only after the operator-facing action sequence is clear.

#### Scenario: Artifact and trace roles are introduced
- **WHEN** the system needs to explain `artifact` and `Langfuse`
- **THEN** it first establishes the operator-facing sequence
- **AND** only afterwards explains what raw outputs go to artifact and what searchable metadata goes to Langfuse

### Requirement: Architecture language SHALL be expanded only after the action chain is understood
The system SHALL defer abstract architectural language until after the user can already restate the practical flow.

#### Scenario: A higher-level architecture explanation is requested
- **WHEN** the user asks for the bigger picture after understanding the basic flow
- **THEN** the system may introduce terms such as observability, truth layer, metadata layer, continuity, or control plane
- **AND** it keeps those terms secondary to the already-established action chain

### Requirement: ASCII diagrams SHALL prioritize action comprehension over taxonomy
The system SHALL use diagrams to reinforce who does what and in what order before using them to present layered abstractions.

#### Scenario: An ASCII diagram is produced for a multi-step system
- **WHEN** the system renders an ASCII explanation
- **THEN** the diagram foregrounds actors, actions, saves, and next-step reuse
- **AND** layered architecture remains secondary or appears only after the action chain is shown
