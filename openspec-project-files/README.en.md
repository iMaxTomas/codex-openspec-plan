# Reusable OpenSpec Packages

This directory collects the public reusable OpenSpec packages from this workspace.

中文： [README.md](./README.md)

It currently contains two sets:

- First tier: 9 low-environment-binding packages
- Second tier: 4 packages prepared for public reuse around artifact, observability, DVC, and research structure

Each package directory contains:

- `proposal.md`
- `design.md`
- `tasks.md`
- `specs/`
- `evolution.md`

The second-tier packages also include `sanitization-notes.md`.

## How To Use Them

- These `proposal / design / tasks / specs` files are copied from the core OpenSpec work in `document-test`.
- Start with `evolution.md` to understand what problem the package solves and how the idea evolved.
- Then adapt repo names, runtime names, paths, thresholds, and validation commands to your own environment.

## Recommended Order

1. Start with `01-active-surface-and-archive-discipline` to narrow the execution surface.
2. Then use `02-minimal-context-and-curated-skills` and `03-codex-explanation-order-rules` to stabilize the long-lived rule layer.
3. Next use `04-trace-first-quote-routing`, `05-memory-governance-and-recall-policy`, and `06-openmemory-recall-mvp` to build the recall and provenance line.
4. Then use `07-openspec-and-codex-devops-workflow` and `09-strategy-card-output-governance` to govern workflow gates and large-output commands.
5. Finally use `08-shell-semantic-canvas-skill` to solidify expression workflows.

## Package Index

| Directory | Best for | Entry |
|---|---|---|
| `01-active-surface-and-archive-discipline` | Too many active changes, no clear mainline, archive rhythm out of control | [evolution.md](./01-active-surface-and-archive-discipline/evolution.md) |
| `02-minimal-context-and-curated-skills` | Rules, skills, and plans keep growing without a clear boundary | [evolution.md](./02-minimal-context-and-curated-skills/evolution.md) |
| `03-codex-explanation-order-rules` | Users misunderstand the operator flow because complex systems are explained in the wrong order | [evolution.md](./03-codex-explanation-order-rules/evolution.md) |
| `04-trace-first-quote-routing` | Quotes, artifacts, and memory answers keep mixing and provenance is unstable | [evolution.md](./04-trace-first-quote-routing/evolution.md) |
| `05-memory-governance-and-recall-policy` | A memory layer exists, but authority, budget, and lifecycle are not governed | [evolution.md](./05-memory-governance-and-recall-policy/evolution.md) |
| `06-openmemory-recall-mvp` | You want minimal recall without blurring artifact and trace responsibilities | [evolution.md](./06-openmemory-recall-mvp/evolution.md) |
| `07-openspec-and-codex-devops-workflow` | OpenSpec, repo rules, host config, and validation gates do not share one workflow | [evolution.md](./07-openspec-and-codex-devops-workflow/evolution.md) |
| `08-shell-semantic-canvas-skill` | You want to package a high-value shell whiteboard explanation style as a reusable skill | [evolution.md](./08-shell-semantic-canvas-skill/evolution.md) |
| `09-strategy-card-output-governance` | Large-output commands, sidecars, wrappers, artifacts, and second-pass search need a task-start contract | [evolution.md](./09-strategy-card-output-governance/evolution.md) |
| `second-tier-sanitized/` | Artifact, observability, DVC, and research-structure packages that are closer to execution | [README.en.md](./second-tier-sanitized/README.en.md) |

## Most Directly Reusable

- `01-active-surface-and-archive-discipline`
- `02-minimal-context-and-curated-skills`
- `03-codex-explanation-order-rules`
- `04-trace-first-quote-routing`
- `05-memory-governance-and-recall-policy`
- `09-strategy-card-output-governance`

These five are the most governance- and method-oriented, with the lowest environment coupling.
