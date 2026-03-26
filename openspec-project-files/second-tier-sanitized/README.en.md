# Second-Tier Public OpenSpec Packages

This directory contains the second set of public reusable packages.

中文： [README.md](./README.md)

Compared with the first set:

- these packages are still complete, with `proposal / design / tasks / specs` fully closed
- they sit closer to execution, artifact handling, and observability
- they are published as reusable package references instead of machine-specific deployment bundles

## Package Set

| Directory | Source | Purpose |
|---|---|---|
| `09-artifact-first-local-cache-mvp` | `deploy-artifact-first-local-cache-mvp` | Defines a local artifact-cache MVP with stable structure and boundaries |
| `10-langfuse-observability-foundation` | `adopt-langfuse-observability-foundation` | Defines Langfuse as the metadata-first trace backend and rollout plan |
| `11-dvc-artifact-foundation` | `integrate-dvc-with-artifact-cache-foundation` + `initialize-dvc-for-selected-artifact-directories` | Defines DVC as the second layer for artifact versioning; the top level is integration and `follow-up-initialize/` covers the execution follow-up |
| `12-agent-context-paper-framework` | `study-agent-context-paper-framework` | Defines a reusable research framework for studying agent-context papers and source material |

## Reading Order

1. Read `evolution.md` first.
2. Read `sanitization-notes.md` second.
3. Then read `proposal / design / tasks / specs`.

## Core Translation Pattern

- Keep the OpenSpec structure.
- Replace local names, paths, and runtime labels with your own environment.
- Reuse the architecture and decision logic, not the original machine-specific deployment context.
