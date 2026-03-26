## ADDED Requirements

### Requirement: The skill SHALL fix semantic building blocks instead of a single rigid layout
The system SHALL define the shell canvas skill around reusable semantic building blocks rather than one frozen page layout.

#### Scenario: Skill is used on a new concept
- **WHEN** the skill is triggered for a new concept or workflow explanation
- **THEN** it SHALL organize the output using reusable semantic roles such as question, core judgment, wrong path, right path, gate or owner, evidence, reuse, and correction

### Requirement: The skill SHALL preserve operator-first explanation flow
The system SHALL keep the shell canvas skill grounded in the operator-facing action chain before expanding into architecture vocabulary.

#### Scenario: Complex concept is explained
- **WHEN** the skill explains a complex concept, flow, or governance chain
- **THEN** it SHALL begin from the operator-facing action chain and only then expand into supporting structure and terminology

### Requirement: The skill SHALL use a layout selection system
The system SHALL choose a layout prototype based on the topic being explained instead of always using one universal layout.

#### Scenario: Topic type changes
- **WHEN** the skill is used for a concept-correction topic, a process-flow topic, a role-splitting topic, a comparison topic, or a layered-system topic
- **THEN** it SHALL select an appropriate layout prototype and MAY combine a secondary prototype when needed

### Requirement: The skill SHALL treat default layout as default, not mandatory
The system SHALL allow a default shell canvas layout without requiring that every response use the same region arrangement or the same number of cards.

#### Scenario: Simple or unusual topic is explained
- **WHEN** the topic does not benefit from the default `left/center/right/bottom` arrangement
- **THEN** the skill SHALL be allowed to omit regions, resize emphasis, or choose another prototype without violating the skill

### Requirement: The skill SHALL keep detailed layout knowledge in references
The system SHALL keep the core trigger and workflow concise in `SKILL.md` and move detailed layout patterns, expansion strategies, and anti-patterns into references files.

#### Scenario: Skill body is authored
- **WHEN** the skill is authored or updated
- **THEN** `SKILL.md` SHALL stay concise while detailed layout guidance is stored in reference files that can be loaded on demand

### Requirement: The skill SHALL not force explicit L0/L1/L2 output labels
The system SHALL allow multi-level expansion without requiring output to expose `L0`, `L1`, or `L2` labels as a fixed contract.

#### Scenario: Same-screen expansion is needed
- **WHEN** the skill expands overview and local detail in the same shell canvas
- **THEN** it SHALL be allowed to represent expansion implicitly through layout and card nesting rather than fixed level labels

### Requirement: The skill SHALL preserve a correction anchor
The system SHALL preserve a compact correction anchor such as `not this, but this` for complex concept-correction outputs.

#### Scenario: High-risk misunderstanding is explained
- **WHEN** the explanation addresses a likely or repeated misunderstanding
- **THEN** the skill SHALL include a compact correction anchor that states the wrong interpretation and the corrected interpretation

### Requirement: The skill SHALL define anti-patterns
The system SHALL define anti-patterns so the shell canvas style does not collapse into plain tables, rigid template filling, or generic linear flowcharts.

#### Scenario: Layout guidance is documented
- **WHEN** the skill documents its usage rules
- **THEN** it SHALL identify output anti-patterns such as pure terminal tables, pure top-to-bottom flow only, rigid symmetric grids, or layout-free article fallback
