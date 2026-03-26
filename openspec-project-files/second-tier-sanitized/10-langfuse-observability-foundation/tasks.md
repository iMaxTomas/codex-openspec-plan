## 1. Decision Record

- [x] 1.1 Record why Langfuse is the first observability backend
- [x] 1.2 Record why LangSmith and Braintrust are deferred
- [x] 1.3 Record the boundary between Langfuse, DVC, and RecallNest

## 2. Event Model

- [x] 2.1 Define the minimum first-phase event classes:
  - run lifecycle
  - message metadata
  - tool-call metadata
  - bash/CLI execution metadata
  - errors/retries
  - artifact handles
- [x] 2.2 Define which fields are metadata-only and which payloads remain external references
- [x] 2.3 Define trace identifiers and run identifiers that later adapters must return

## 3. Ingestion Boundaries

- [x] 3.1 Define the Codex-first ingestion path using an external wrapper or bridge
- [x] 3.2 Define how Claude Code hooks can become a later ingestion source
- [x] 3.3 Define how OpenClaw later reports or relays traces without becoming the only truth layer
- [x] 3.4 Define Gemini as a later follow-up target, not a first-phase blocker

## 4. Deployment And Operations Planning

- [x] 4.1 Define whether first validation is self-hosted or a minimal project-level hosted validation
- [x] 4.2 Define security and secret boundaries for Langfuse credentials and ingestion
- [x] 4.3 Define what operational data remains outside Langfuse

## 5. Follow-up Change

- [x] 5.1 Propose a follow-up implementation change for Langfuse deployment evaluation
- [x] 5.2 Propose a follow-up implementation change for Codex-first ingestion
- [x] 5.3 Confirm that raw artifact caching and DVC versioning remain unchanged in the first Langfuse phase
