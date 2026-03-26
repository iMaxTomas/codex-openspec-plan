## ADDED Requirements

### Requirement: Exact-quote claims SHALL require provenance anchors
The system SHALL require provenance anchors before it may claim that a returned sentence is the operator's exact prior wording or exact prior question.

#### Scenario: Exact quote is returned
- **WHEN** the system answers that a sentence is the operator's exact earlier wording
- **THEN** the answer SHALL be backed by at least a source session anchor and a source turn anchor or equivalent local conversation position
- **AND** it SHALL include a source trace identifier when trace infrastructure is available

### Requirement: Artifact or memory SHALL NOT impersonate exact-quote authority
The system SHALL NOT present artifact summaries or durable memory as if they were primary exact-quote evidence.

#### Scenario: Artifact summary resembles a prior user message
- **WHEN** an artifact summary or durable memory is semantically similar to a prior user message
- **THEN** the system SHALL NOT claim that summary or memory record is the exact original wording unless trace-first evidence confirms it

### Requirement: Provenance-sensitive answers SHALL downgrade certainty when anchors are incomplete
The system SHALL lower certainty or request clarification when a provenance-sensitive request lacks enough evidence for an exact answer.

#### Scenario: Trace evidence is incomplete
- **WHEN** the system cannot lock an exact source turn for a quote or prior-question request
- **THEN** it SHALL avoid presenting the answer as one-to-one exact wording
- **AND** it SHALL either state the uncertainty or ask the operator to disambiguate the intended thread

### Requirement: Similar-topic thread collisions SHALL trigger explicit disambiguation
The system SHALL explicitly disambiguate between similar topic threads when more than one candidate thread could satisfy a provenance-sensitive request.

#### Scenario: Two related threads are both plausible
- **WHEN** the system detects multiple threads with similar themes but different provenance
- **THEN** it SHALL present the competing thread identities or ask a clarifying question before selecting one as the source

### Requirement: Provenance-sensitive answers SHALL preserve source-layer labeling
The system SHALL preserve whether a returned answer is trace-derived, artifact-derived, or memory-derived whenever provenance sensitivity matters.

#### Scenario: Answer mixes recall layers
- **WHEN** a provenance-sensitive answer uses trace plus artifact or memory support
- **THEN** the system SHALL preserve which part came from trace authority and which parts came from artifact or memory support
