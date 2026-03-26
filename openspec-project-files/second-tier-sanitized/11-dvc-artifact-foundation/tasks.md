## 1. DVC Scope

- [x] 1.1 Define the first DVC-managed artifact directories
- [x] 1.2 Define the artifact directories and files that must remain local-only
- [x] 1.3 Define the rationale for excluding traces, sqlite, and cheap summaries from first-phase DVC

## 2. DVC And SQLite Boundary

- [x] 2.1 Define how DVC-tracked files map back to local sqlite artifact rows
- [x] 2.2 Define which fields remain runtime-only versus versioning-related
- [x] 2.3 Define how cache-first lookup continues to work after DVC is introduced

## 3. DVC Initialization Plan

- [x] 3.1 Define how DVC should be initialized in this repository
- [x] 3.2 Define whether `.dvcignore` is needed for traces and sqlite
- [x] 3.3 Define the minimum first-phase commands to validate the DVC setup

## 4. Remote Deferral Rules

- [x] 4.1 Define why DVC remote is deferred from this first integration step
- [x] 4.2 Define the trigger conditions for adding a DVC remote later
- [x] 4.3 Define the likely first remote options to evaluate

## 5. Follow-Up Planning

- [x] 5.1 Produce the DVC integration note for the artifact foundation
- [x] 5.2 Produce the first implementation change that will actually initialize DVC and track the selected directories
- [x] 5.3 Define what should remain deferred to MLflow / W&B
