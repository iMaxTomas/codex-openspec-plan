## Context

The artifact-first local cache MVP is already running with:

- `.artifact-cache/`
- `index.sqlite`
- `query-rounds.jsonl`
- `tool-calls.jsonl`
- cache-first helper scripts

The DVC planning change has already defined:

- first tracked directories
- local-only directories
- sqlite as runtime lookup
- remote deferral

This change executes that plan with minimal scope.

## Goals / Non-Goals

**Goals:**

- initialize DVC at repo root
- track selected high-value directories
- keep sqlite/traces/summaries out of DVC
- validate a minimal local-only workflow

**Non-Goals:**

- no remote configuration
- no MLflow integration
- no W&B integration
- no expansion to the entire `.artifact-cache/`

## Decisions

### 1. Initialize DVC At Repo Root

DVC SHOULD be initialized at `<repo-root>`.

### 2. Track Only Selected Directories

First tracked directories:

- `.artifact-cache/raw/search`
- `.artifact-cache/raw/web`
- `.artifact-cache/raw/github`
- `.artifact-cache/raw/papers`
- `.artifact-cache/derived/extracts`
- `.artifact-cache/derived/metadata`

### 3. Preserve Runtime Lookup Boundary

The following remain local-only:

- `.artifact-cache/index.sqlite`
- `.artifact-cache/traces/`
- `.artifact-cache/derived/summaries`

### 4. Validate Without Remote

First validation should prove:

- DVC initializes successfully
- selected directories become tracked
- sqlite lookup still works unchanged

## Risks / Trade-offs

- [risk] DVC not installed locally
  - mitigation: document installation requirement and stop cleanly if absent
- [risk] DVC updates repo ignore behavior
  - mitigation: keep first phase narrow and inspect resulting Git changes
- [risk] confusion between sqlite and DVC roles
  - mitigation: keep runtime lookups unchanged and document boundary
