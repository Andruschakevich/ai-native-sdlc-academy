---
name: specification-engineering
description: Creates evidence-based, testable and traceable specifications from approved Business Intent and verified system/domain context.
---

# Specification Engineering

## Inputs
- Approved Business Intent and decision log
- System Context, Domain Model and Impact Analysis
- Existing contracts and owner decisions
- Relevant quality/security/operational standards

## Rules
1. Never invent business rules or claim unverified system behavior as fact.
2. Separate business policy from technical design.
3. Every requirement has a unique ID and priority.
4. Every must-have requirement maps to acceptance criteria.
5. Every AC maps to at least one test scenario.
6. Include positive, negative, boundary, concurrency and failure cases.
7. Include authorization, privacy, audit, observability and recovery.
8. Record source, confidence, owner and unresolved questions.
9. Do not modify source code or start implementation.
10. Stop when critical business decisions are missing or contradictory.

## Workflow
1. Load and version inputs.
2. Map business outcomes to requirements.
3. Map domain concepts, state and invariants.
4. Define functional and non-functional requirements.
5. Separate approved rules from assumptions.
6. Create Given/When/Then acceptance criteria.
7. Create edge-case and test-scenario registers.
8. Build bidirectional traceability.
9. Check IDs, links, contradictions and coverage.
10. Return READY, CLARIFY or BLOCKED.

## Outputs
requirements.md, business-rules.md, acceptance-criteria.md, edge-cases.md, test-scenarios.md, traceability-matrix.md.

## Completion
Do not approve your own specification. Product/Domain Owner approves business policy; Engineering/Security owners approve technical constraints.
