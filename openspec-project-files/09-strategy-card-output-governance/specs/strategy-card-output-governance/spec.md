# strategy-card-output-governance Specification

## Purpose

Define how strategy cards govern high-output commands, cross-tool responsibility, artifact-first capture, bounded summaries, and second-pass search.

## Requirements

### Requirement: Strategy cards SHALL record output contracts for high-output work

High-output or evidence-heavy tasks SHALL record output-load classification, raw-output artifact path, main-context output contract, fallback path, and stop line before execution begins.

#### Scenario: High-output task starts

- **WHEN** a task may run repo-wide search, large logs, large JSON, large diffs, broad tests, external CLI exports, or remote evidence collection
- **THEN** the strategy card SHALL record how raw output is captured
- **AND** it SHALL record where the raw output is stored
- **AND** it SHALL record what bounded summary may enter the main context
- **AND** it SHALL record when execution must stop and report

### Requirement: Cross-tool responsibility SHALL be explicit

When a task names wrappers, RTK, sidecars, artifact-first capture, planning audit, external CLIs, remote commands, JSON processors, logs, tests, search, or file reads, the strategy card SHALL identify preferred owner, fallback, raw-output owner, and main-context contract.

#### Scenario: Tool family is named

- **WHEN** a strategy card names one or more high-output tool families
- **THEN** each named family SHALL have a responsibility record
- **AND** generic blanket ownership SHALL NOT satisfy the requirement
- **AND** `none` or empty responsibility values SHALL NOT satisfy the requirement

### Requirement: Second-pass search SHALL be bounded

The system SHALL allow second-pass search when it is tied to an evidence gap, a named source root, a bounded output contract, and a stop line.

#### Scenario: Evidence is insufficient after first pass

- **WHEN** first-pass evidence is insufficient
- **AND** the strategy card names the source root or target range for the next search
- **AND** the main-context summary contract remains bounded
- **THEN** the second-pass search SHALL be allowed

### Requirement: Gates SHALL reject false compliance

Planning gates SHALL reject placeholder cards, counts-only summary contracts, negated sidecar decisions, stale handoff-only responsibility, and generic cross-tool responsibility prose.

#### Scenario: False compliance appears

- **WHEN** a plan appears to mention the required governance field only through placeholder, negated, stale, or generic wording
- **THEN** the planning gate SHALL fail
- **AND** execution SHALL stop until the current strategy card records a concrete contract
