## 1. Rule Extraction

- [x] 1.1 Extract the core principle: explain the operator-facing action chain before the architecture
- [x] 1.2 Extract the rule that wrong interpretations must be explicitly rejected early
- [x] 1.3 Extract the rule that architecture vocabulary is delayed until after practical understanding

## 2. Rule Drafting

- [x] 2.1 Draft the first-pass `codex explanation order rules` text in a deployable form
- [x] 2.2 Draft concise examples using the pattern `I do X -> wrapper receives it -> wrapper starts Y -> result is saved`
- [x] 2.3 Draft a short “not this, but this” section for common misunderstandings

## 3. Placement And Boundary

- [x] 3.1 Clarify that these rules are content objects, not governance rules
- [x] 3.2 Clarify where these rules may later be deployed: long-lived rules, minimal AGENTS section, or equivalent Codex config
- [x] 3.3 Clarify what these rules must not try to cover: project-specific task plans or one-off explanations

## 4. Ready-To-Deploy Artifact

- [x] 4.1 Produce a `codex-explanation-order-rules.md` draft that can later be copied into Codex configuration
- [x] 4.2 Add a short prompt/rules version for compact deployment
- [x] 4.3 Record the next implementation step that will actually deploy the reviewed rules into the local Codex setup
