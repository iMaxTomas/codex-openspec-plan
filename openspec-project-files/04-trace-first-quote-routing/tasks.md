## 1. Question Classification And Routing

- [x] 1.1 Define the operator-facing question classes for `trace`, `artifact`, and `memory` context-recall requests
- [x] 1.2 Define the trigger patterns that force `trace-first` routing for exact quote, prior-turn, and prior-question requests
- [x] 1.3 Define the default routing order for `artifact questions` and `memory questions` without expanding them into `trace-first`
- [x] 1.4 Define the minimum examples that distinguish `trace question`, `artifact question`, and `memory question`

## 2. Provenance Answer Contract

- [x] 2.1 Define the minimum provenance anchors required before the system may claim an exact prior quote or exact prior user question
- [x] 2.2 Define how trace-derived, artifact-derived, and memory-derived answer components are labeled when provenance sensitivity matters
- [x] 2.3 Define the downgrade behavior when exact-quote anchors are incomplete or unavailable
- [x] 2.4 Define the explicit disambiguation rule for similar-topic thread collisions

## 3. Reference-Case Validation

- [x] 3.1 Validate the routing rules against the `review-board / 低级错误扩散` thread
- [x] 3.2 Validate the routing rules against the `AI 模块化 / ontology` thread
- [x] 3.3 Validate that a request for “原话 / 一字不差” does not fall back to artifact or memory as primary authority
- [x] 3.4 Validate that a request for “上次研究出了什么” still routes to artifact-first rather than unnecessarily forcing trace-first

## 4. Follow-Up Implementation Boundary

- [x] 4.1 Record the minimum runtime hook needed to enforce `trace-first` question routing in a future implementation change
- [x] 4.2 Record the minimum trace identifiers and local conversation anchors needed for provenance-safe quote lookup
- [x] 4.3 Record how artifact verification and memory backlinks participate without replacing trace authority
- [x] 4.4 Record the next implementation change boundary without expanding this correction change into a new memory or observability redesign

## Outputs Produced

- [x] [question-routing-rules.md](/home/imax/codex-workspaces/document-test/openspec/changes/repair-trace-first-quote-routing/question-routing-rules.md)
- [x] [provenance-answer-checklist.md](/home/imax/codex-workspaces/document-test/openspec/changes/repair-trace-first-quote-routing/provenance-answer-checklist.md)
- [x] [reference-case-validation.md](/home/imax/codex-workspaces/document-test/openspec/changes/repair-trace-first-quote-routing/reference-case-validation.md)
- [x] [next-implementation-boundary.md](/home/imax/codex-workspaces/document-test/openspec/changes/repair-trace-first-quote-routing/next-implementation-boundary.md)
