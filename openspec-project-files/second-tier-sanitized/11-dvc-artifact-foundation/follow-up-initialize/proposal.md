## Why

`integrate-dvc-with-artifact-cache-foundation` has already defined the first DVC-managed scope, the local-only boundary, and the DVC/sqlite responsibility split. The next step is to execute that plan with the smallest possible repository change.

This execution change should initialize DVC at the Git root, track only the selected high-value artifact directories, and verify that local cache-first lookup still works without pulling sqlite or trace logs into DVC.

## What Changes

- initialize DVC in the current repository
- add the selected `.artifact-cache/` directories to DVC
- keep sqlite, traces, and cheap summaries local-only
- validate the local-only DVC workflow
- document the first operating mode before any remote is added

## Capabilities

### New Capabilities
- `dvc-initialized-artifact-directories`: selected artifact directories are versioned through DVC while runtime lookup remains local

### Modified Capabilities
- `artifact-first-local-cache-mvp`: gains a first-phase file versioning layer
