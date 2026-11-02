# Case Study Artifact Index

| Stage | Artifact | Purpose |
|---|---|---|
| Intent | [Business Intent](01-intent/business-intent.md) | Business purpose, scope and metrics |
| Discovery | [System Context](02-discovery/system-context.md) | Existing system model |
| Discovery | [Domain Model](02-discovery/domain-model.md) | Domain concepts and invariants |
| Discovery | [Impact Analysis](02-discovery/impact-analysis.md) | Affected components and risks |
| Specification | [Requirements](03-specification/requirements.md) | Functional and non-functional requirements |
| Specification | [Business Rules](03-specification/business-rules.md) | Approved domain rules |
| Specification | [Acceptance Criteria](03-specification/acceptance-criteria.md) | Testable behavior |
| Specification | [Edge Cases](03-specification/edge-cases.md) | Failure and boundary cases |
| Specification | [Test Scenarios](03-specification/test-scenarios.md) | Verification scenarios |
| Specification | [Traceability](03-specification/traceability-matrix.md) | Requirement to evidence mapping |
| Architecture | [Architecture](04-architecture/architecture-overview.md) | Service boundaries and logical design |
| Architecture | [ADR-001](04-architecture/ADR-001-idempotency.md) | Idempotency decision |
| Planning | [Implementation Plan](04-architecture/implementation-plan.md) | Work packages |
| Planning | [Dependency Graph](04-architecture/dependency-graph.md) | Dependencies |
| Planning | [Plan Review](04-architecture/plan-review.md) | Readiness conditions |
| Architecture | [ADR-002](04-architecture/ADR-002-entitlement-reconciliation.md) | Entitlement consistency and reconciliation |
| Architecture | [Logical API and Event Contracts](04-architecture/api-contracts.md) | Example service boundaries and payloads |
| Execution | [WP-05 Task Packet](05-execution/task-packet-WP-05.md) | Complete bounded implementation contract |

Update upstream decisions first and review every downstream dependency. Never silently override business rules.