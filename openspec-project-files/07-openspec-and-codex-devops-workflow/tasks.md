## 1. Inventory And Classification

- [x] 1.1 Inventory current governed candidates across `openspec/changes/**`, repo policy files, repo prompts, repo skill sources, governance scripts, and durable host `~/.codex` config surfaces
- [x] 1.2 Classify each inventoried surface as governed durable source, governed deployment target, sensitive overlay, or runtime exclude
- [x] 1.3 Refresh the rule-source mapping from `optimize-openspec-lab-rollout` and related governance changes so this workflow reuses current rules instead of stale assumptions

## 2. Unified DevOps Lifecycle

- [x] 2.1 Define the standard governed session header: primary milestone, stop line, owner, promotion target, and sidecar list
- [x] 2.2 Define the default isolation model for governed work: branch/worktree boundaries, single write owner, and read-heavy subagent usage
- [x] 2.3 Define the required validation, test, revalidation, optimization review, and adoption evidence gates for each governed surface class

## 3. Host Codex Config Promotion

- [x] 3.1 Choose the repo source layout for durable host Codex config, including AGENTS, rules, prompts, skills, and `config.toml` structure artifacts
- [x] 3.2 Split `config.toml` governance into durable structure, secret overlay contract, and target-machine render/promotion flow
- [x] 3.3 Define how host-only durable skills or rules are either migrated into repo source control or recorded as explicit temporary exceptions

## 4. Validation And Deployment Tooling

- [x] 4.1 Define smoke validation commands for promoted host `AGENTS.md`, rules, skills, and `config.toml`
- [x] 4.2 Define the minimum evidence package that links change, branch/worktree, validation outputs, host promotion result, and adoption decision
- [x] 4.3 Define how sync or projection steps are executed so repo-tracked sources and host deployment targets do not drift silently

## 5. Pilot Adoption

- [x] 5.1 Apply the new workflow to the highest-value governance surfaces first: repo `AGENTS.md`, `codex-search-before-build.rules`, `optimize-openspec-lab-rollout`, and sync/governance scripts
- [x] 5.2 Document explicit excludes for auth state, sessions, logs, sqlite state, caches, tmp artifacts, backups, and scratch files
- [x] 5.3 Open follow-up changes for any remaining surfaces that cannot be migrated into the unified DevOps workflow within this first rollout
