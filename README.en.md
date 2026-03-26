# codex-openspec-plan

This is the homepage summary of the current OpenSpec system in the `document-test` workspace.

中文： [README.md](./README.md)

If you only need a quick view of the project layers, total plan count, and current status, this file is enough.
If you want the fully expanded layer map, see [list.md](./list.md).
If you want the time-ordered wireframe version, see [timeline-shell-canvas.md](./timeline-shell-canvas.md).
If you want the current four-lane governance view, see [lane-progress/README.en.md](./lane-progress/README.en.md).
If you want reusable OpenSpec plan packages, see [openspec-project-files/README.en.md](./openspec-project-files/README.en.md).

## Main Time Spine

```text
[00 Base / transport] -> [01 Governance] -> [01.2 Search / routing] -> [02 OpenSpec planning] -> [02.1 Delivery status]
        |                    |                    |                     |                        |
        |=> host / VM103     |=> explanation      |=> memory or web     |=> proposal / design    |=> archived      =  9
        |=> NFS / SMB        |=> minimal context  |=> trace-first       |=> tasks / specs        |=> full not arch = 23
        |=> runner / hook    |=> review / gates   |=> routing plane     |=> total 54 changes     |=> over half     =  7
        |=> provider lanes   |=> rollout control  |=> quote provenance  |=> planning surface     |=> early / plan  = 15
        |
        +----------------------------------------------------------------------------------------------+
                                                                                                       |
                                                                                                       v
                   [03 Artifact / cache / trace] -> [04 Memory / Recall] -> [04.1 A2A / multi-runtime collaboration]
                              |                               |                                |
                              |=> artifact-first cache        |=> durable / session / evidence |=> host Codex supervisor
                              |=> DVC versioning              |=> RecallNest continuity         |   -> transport surface
                              |=> Langfuse observability      |=> memory governance             |   -> VM103 lanes
                              |=> codex-first ingest          |=> recall reuse                  |   => evidence / handoff / recall
                                                                                                |
                                                                                                v
                                                      [05 Tools / workflow skills] -> [06 Research / review / audit]
```

## Reusable OpenSpec Packages

This section groups the currently public reusable packages by architecture layer. For the full directory, see [openspec-project-files/README.en.md](./openspec-project-files/README.en.md).

| Layer | Purpose | OpenSpec change count | Reusable packages |
|---|---|---:|---|
| Governance | Defines long-lived rule boundaries, explanation order, execution-surface control, and DevOps discipline | 11 | [01-active-surface-and-archive-discipline](./openspec-project-files/01-active-surface-and-archive-discipline/)<br>[02-minimal-context-and-curated-skills](./openspec-project-files/02-minimal-context-and-curated-skills/)<br>[03-codex-explanation-order-rules](./openspec-project-files/03-codex-explanation-order-rules/)<br>[07-openspec-and-codex-devops-workflow](./openspec-project-files/07-openspec-and-codex-devops-workflow/) |
| Search and routing | Defines routing order and provenance contracts across quotes, artifacts, and memory | 5 | [04-trace-first-quote-routing](./openspec-project-files/04-trace-first-quote-routing/)<br>[06-openmemory-recall-mvp](./openspec-project-files/06-openmemory-recall-mvp/) |
| Artifact / cache / observability | Defines local artifact cache structure, the DVC versioning layer, and Langfuse trace flow | 8 | [09-artifact-first-local-cache-mvp](./openspec-project-files/second-tier-sanitized/09-artifact-first-local-cache-mvp/)<br>[10-langfuse-observability-foundation](./openspec-project-files/second-tier-sanitized/10-langfuse-observability-foundation/)<br>[11-dvc-artifact-foundation](./openspec-project-files/second-tier-sanitized/11-dvc-artifact-foundation/) |
| Memory / Recall | Defines durable/session/evidence layering, recall budgets, and minimal recall integration | 4 | [05-memory-governance-and-recall-policy](./openspec-project-files/05-memory-governance-and-recall-policy/)<br>[06-openmemory-recall-mvp](./openspec-project-files/06-openmemory-recall-mvp/) |
| Tools / workflow skills | Packages reusable expression patterns and workflow methods as skills or repeatable operating patterns | 10 | [08-shell-semantic-canvas-skill](./openspec-project-files/08-shell-semantic-canvas-skill/) |
| Research / review / audit | Packages paper-study structure, research frameworks, and downstream review or brief artifacts; research counts are `strict research/study = 2`, `broad research/evaluate/audit = 4`, `summary = 3`, and `review / brief / report = 5` | 1 | [12-agent-context-paper-framework](./openspec-project-files/second-tier-sanitized/12-agent-context-paper-framework/) |

```text
[Tree Expansion]
.
├── 00 Base / transport
│   ├── host / VM103
│   ├── NFS / SMB
│   ├── runner / hook
│   └── provider lanes
├── 01 Governance
│   ├── explanation order
│   ├── minimal context
│   ├── review / runtime gates
│   └── rollout control
├── 01.2 Search / routing
│   ├── memory or web
│   ├── trace-first routing
│   ├── routing control plane
│   └── quote provenance
├── 02 OpenSpec planning
│   ├── proposal / design
│   ├── tasks / specs
│   ├── total 54 changes
│   └── planning surface
├── 02.1 Delivery status
│   ├── archived      =  9
│   ├── full not arch = 23
│   ├── over half     =  7
│   └── early / plan  = 15
├── 03 Artifact / cache / trace
│   ├── artifact-first cache
│   ├── DVC versioning
│   ├── Langfuse observability
│   └── codex-first ingest
├── 04 Memory / Recall
│   ├── durable / session / evidence
│   ├── RecallNest continuity
│   ├── memory governance
│   └── recall reuse
├── 04.1 A2A / multi-runtime collaboration
│   ├── host Codex supervisor
│   ├── transport surface
│   ├── VM103 lanes
│   └── evidence / handoff / recall
├── 05 Tools / workflow skills
│   ├── Obsidian / canvas
│   ├── gitagent / shell skills
│   └── bili / workflow packaging
└── 06 Research / review / audit
    ├── paper study
    ├── evaluate / audit
    └── review / brief / report
```
