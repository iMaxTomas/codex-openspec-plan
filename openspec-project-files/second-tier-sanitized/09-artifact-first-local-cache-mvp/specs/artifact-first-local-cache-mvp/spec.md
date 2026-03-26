## ADDED Requirements

### Requirement: Local artifact cache SHALL be bootstrapped in-repo
The system SHALL create a local `.artifact-cache/` foundation within the repository for raw artifacts, derived artifacts, traces, and index storage.

#### Scenario: MVP initialization runs
- **WHEN** the local cache MVP is initialized
- **THEN** the repository SHALL contain a usable `.artifact-cache/` structure with the minimum required files

### Requirement: The local cache SHALL support indexed artifact lookup
The system SHALL provide a local `sqlite` index that allows callers to look up existing artifacts before refetching resources.

#### Scenario: A fetch request is repeated
- **WHEN** a caller requests a resource whose canonical key already exists in the local artifact index
- **THEN** the system SHALL treat the request as a cache hit and avoid unnecessary refetching by default

### Requirement: Cache miss handling SHALL persist raw and derived outputs
The system SHALL save both the raw fetched payload and a compact derived summary when a cache miss occurs for a supported workflow.

#### Scenario: A new resource is fetched
- **WHEN** a supported workflow fetches a resource not present in the cache
- **THEN** the system SHALL save the raw artifact, save a compact summary, and register both in the local index

### Requirement: High-volume results SHALL re-enter the agent as compact payloads
The system SHALL return only compact summary payloads to the caller instead of reinjecting full raw results into active agent context.

#### Scenario: A cache miss completes
- **WHEN** a new artifact has been fetched and stored
- **THEN** the caller SHALL receive a compact payload containing at least the artifact id, source, paths, and short summary

### Requirement: The MVP SHALL validate both miss and hit paths
The system SHALL validate both initial fetch behavior and repeated fetch behavior for supported workflows.

#### Scenario: MVP verification runs
- **WHEN** the MVP validation step is executed
- **THEN** it SHALL demonstrate one cache miss path and one cache hit path
