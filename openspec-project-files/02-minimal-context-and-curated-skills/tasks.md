## 1. Context Boundary Rules

- [x] 1.1 Define what long-lived config files are allowed to contain
- [x] 1.2 Define what long-lived config files must not contain
- [x] 1.3 Define how personal preferences differ from task-specific context

## 2. Curated Skills Governance

- [x] 2.1 Define the criteria that make a knowledge item a curated-skill candidate
- [x] 2.2 Define what kinds of procedural knowledge should be moved out of global config into skills
- [x] 2.3 Define review requirements for adopting new curated skills

## 3. Task-Scoped Planning Rules

- [x] 3.1 Define what information must remain inside task-scoped plans or OpenSpec changes
- [x] 3.2 Define the trigger conditions that require a task-scoped plan instead of relying on persistent config alone
- [x] 3.3 Define how task-scoped plans interact with long-lived config and curated skills

## 4. Audit And Refactoring

- [x] 4.1 Create a periodic audit checklist for persistent AI configuration
- [x] 4.2 Define the audit output buckets: keep, move-to-skill, move-to-task-plan, remove
- [x] 4.3 Apply the audit lens to `add-ai-agent-base-environment` and identify what should remain there versus what should be governed by this change

## 5. Codex-Specific Application

- [x] 5.1 Decide whether this machine should use a dedicated `AGENTS.md`, rules + skills only, or a hybrid structure
- [x] 5.2 Prepare the first-pass governance checklist for this machine's Codex configuration deployment
- [x] 5.3 Define the next implementation change that will actually deploy the reviewed configuration structure
