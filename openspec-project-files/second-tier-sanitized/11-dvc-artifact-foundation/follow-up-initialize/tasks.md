## 1. Repository Setup

- [x] 1.1 Confirm DVC is available in the current environment
- [x] 1.2 Initialize DVC at the Git repository root
- [x] 1.3 Inspect the initial `.dvc/` metadata and Git changes

## 2. Track Selected Artifact Directories

- [x] 2.1 Add `.artifact-cache/raw/search` to DVC
- [x] 2.2 Add `.artifact-cache/raw/web` to DVC
- [x] 2.3 Add `.artifact-cache/raw/github` to DVC
- [x] 2.4 Add `.artifact-cache/raw/papers` to DVC
- [x] 2.5 Add `.artifact-cache/derived/extracts` to DVC
- [x] 2.6 Add `.artifact-cache/derived/metadata` to DVC

## 3. Preserve Local-Only Runtime State

- [x] 3.1 Confirm `index.sqlite` remains outside DVC
- [x] 3.2 Confirm `traces/` remain outside DVC
- [x] 3.3 Confirm `derived/summaries` remain outside DVC

## 4. Validate Local-Only DVC Workflow

- [x] 4.1 Verify DVC status for the selected directories
- [x] 4.2 Verify Git sees the expected `.dvc` metadata and pointer files
- [x] 4.3 Verify cache-first lookup still uses local sqlite without behavior change

## 5. Document First Operating Mode

- [x] 5.1 Document the local-only DVC workflow
- [x] 5.2 Record installation caveats if DVC is missing
- [x] 5.3 Define the next step toward optional remote storage
