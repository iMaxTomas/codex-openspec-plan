## 1. Cache Layout Bootstrap

- [x] 1.1 Create the `.artifact-cache/` directory structure for raw, derived, and traces
- [x] 1.2 Create the initial `index.sqlite`
- [x] 1.3 Create the initial `query-rounds.jsonl` and `tool-calls.jsonl`

## 2. SQLite And Trace Initialization

- [x] 2.1 Implement the minimum `sqlite` schema for `artifacts`, `query_rounds`, and `tool_traces`
- [x] 2.2 Implement append-only trace writing for query rounds
- [x] 2.3 Implement append-only trace writing for tool calls

## 3. Cache-First Fetch Helper

- [x] 3.1 Implement canonical key generation for at least the first supported workflow types
- [x] 3.2 Implement cache lookup before network fetch
- [x] 3.3 Implement raw artifact save on cache miss
- [x] 3.4 Implement compact summary save on cache miss
- [x] 3.5 Return only the compact payload to the caller

## 4. Workflow Validation

- [x] 4.1 Connect one search workflow to the cache-first helper
- [x] 4.2 Connect one web or GitHub workflow to the cache-first helper
- [x] 4.3 Validate cache miss behavior
- [x] 4.4 Validate cache hit behavior

## 5. MVP Notes

- [x] 5.1 Document the exact local paths and file conventions used by the MVP
- [x] 5.2 Document known limitations and what is intentionally deferred to DVC / MLflow / W&B
- [x] 5.3 Define the next follow-up change after MVP validation

## 6. Review Hardening Follow-up

- [x] 6.1 Store artifact and summary paths relative to the repository root instead of the caller `cwd`
- [x] 6.2 Make default artifact filenames collision-resistant for repeated same-second cache misses
- [x] 6.3 Preserve meaningful URL query params such as `ref` and `source` in canonical cache keys
- [x] 6.4 Ignore per-run Langfuse trace directories under `.artifact-cache/traces/langfuse-codex/`
