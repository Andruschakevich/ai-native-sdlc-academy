# Lesson 05 — Architecture & Planning

**Outcome:** Translate an approved specification into justified architecture decisions and bounded work packages that can be executed safely and, where appropriate, in parallel.

## 1. Specification, architecture and plan are different

| Artifact | Question | Example |
|---|---|---|
| Specification | What must happen? | Downgrade takes effect next billing cycle |
| Architecture | Where and how will the system enforce it? | Subscription Service stores a scheduled transition |
| Implementation plan | In what order will teams/agents work? | Agree contracts, implement eligibility, then lifecycle operations and integration |

A business invariant such as “no duplicate charge” does not dictate Redis, Kafka, database locks or a saga framework. Architecture choices depend on discovered constraints, ownership, existing patterns and operational capability.

## 2. Start from impact, not a blank diagram

For the fictional subscription product, likely affected components include:
- Web Frontend: settings, preview and confirmation;
- Identity & Access: account-scoped Admin and Billing Owner;
- Subscription API/Service: commands, lifecycle and scheduled changes;
- Billing Service: quotes, invoices, discounts and schedule;
- Payment Adapter/provider: charge, idempotency and webhooks;
- Entitlement Service: effective access and limits;
- Promotion Service: discount compatibility;
- Notifications and Analytics: confirmation, funnel and outcomes.

This is a logical training map, not an observed production architecture. In a real project, map each item to repositories, owners, APIs, schemas and consumers. Use [Impact Analysis](../case-study/02-discovery/impact-analysis.md) as the starting point.

## 3. Architecture Decision Records

An ADR records a consequential choice, alternatives, trade-offs, validation and ownership. It prevents agents from repeatedly inventing incompatible solutions.

### Example: idempotency

**Context:** a client may retry after timeout, and the provider may send duplicate webhooks. We must prevent duplicate business effects.

**Decision drivers:** durable operation identity, safe retry, auditability, recoverability and compatibility with the existing provider.

**Options:**
- UI button disabling: useful UX, insufficient server protection.
- Provider idempotency only: protects provider calls within provider semantics, but not internal state transitions.
- Database uniqueness/operation record: durable internal deduplication, requires schema and retention design.
- Distributed lock: can limit concurrency but does not by itself prove exactly-once business effect.

**Training direction:** persist an internal operation record and use provider idempotency where supported; reconcile uncertain outcomes rather than blindly retrying.

**Validation:** same-key retry, different payload with same key, concurrent requests, timeout after provider capture, duplicate/out-of-order webhook, process restart.

See [ADR-001 — Idempotency](../case-study/04-architecture/ADR-001-idempotency.md). It is accepted for the fictional training architecture only; actual provider semantics must be discovered.

### Other ADR candidates

- Subscription state ownership.
- Billing quote and price snapshot.
- Scheduled change execution.
- Entitlement reconciliation.
- Event delivery and outbox.
- API compatibility and migration approach.

Do not create an ADR for every small implementation detail. Use one when there are consequential alternatives, long-lived trade-offs or cross-team impact.

## 4. Decompose into work packages

A work package is a bounded, independently verifiable unit, not merely a task title.

A useful package contract contains:
- objective and business value;
- owner/agent role;
- inputs and exact artifact versions;
- dependencies;
- scope and exclusions;
- allowed repositories, paths and tools;
- acceptance criteria and invariants;
- expected outputs;
- tests and evidence;
- Definition of Done;
- stop conditions and approval requirements.

The training plan decomposes the initiative into:
- WP-01: service contracts, roles and sources of truth;
- WP-02: eligibility and authorization;
- WP-03: price and discount preview;
- WP-04: idempotent command model;
- WP-05: immediate upgrade;
- WP-06: scheduled downgrade and cycle changes;
- WP-07: cancel, pause, resume and reactivate;
- WP-08: entitlement updates and reconciliation;
- WP-09: audit, notification and analytics;
- WP-10: independent quality/security verification;
- WP-11: progressive release and observation.

See [Implementation Plan](../case-study/04-architecture/implementation-plan.md), [Dependency Graph](../case-study/04-architecture/dependency-graph.md), [Work Package Contracts](../orchestration/work-packages.md) and the fully populated [WP-05 Immediate Upgrade Task Packet](../case-study/05-execution/task-packet-WP-05.md).

## 5. Dependencies and parallelism

Parallel execution is safe only when:
- dependencies are complete or stable contracts are approved;
- shared interfaces have one owner;
- agents do not write the same files without coordination;
- each agent has an isolated workspace;
- outputs can be independently tested and integrated;
- resource limits and retry budgets are defined.

For example, eligibility, price preview and idempotency may be developed in parallel after domain/API contracts are approved. Upgrade and downgrade implementation may then proceed independently if they share a stable command/state contract. Integration testing depends on their integration.

Parallelism is a result of good decomposition, not a goal by itself.

## 6. Task Packet example — WP-05 Immediate Upgrade

**Objective:** implement the immediate upgrade workflow for eligible self-service subscriptions.

**Inputs:** approved Business Intent, System Context, Domain Model, requirements FR-01–FR-04/FR-10/FR-12, BR-01–BR-03/BR-10–BR-11/BR-15–BR-19, relevant ACs, ADR-001 and verified service contracts.

**Scope:** validate eligibility and actor; obtain Billing Owner approval when immediate charge applies; use authoritative quote; submit idempotent payment command; transition subscription only after required payment success; coordinate entitlement update; record audit and return authoritative operation status.

**Out of scope:** enterprise and bespoke legacy subscriptions, refunds/compensation, production deployment, destructive data changes, changing pricing policy.

**Invariants:** no duplicate charge; no activation before payment success; no entitlement for an unactivated plan; no silent discount loss; every operation is auditable; uncertain provider result is reconciled.

**Acceptance evidence:** successful upgrade; declined payment leaves current state; unauthorized actor rejected; same-key retry has one effect; timeout after provider capture reconciles; duplicate webhook does not reapply; entitlement failure creates reconciliation and prevents false success.

**Allowed changes:** explicitly assigned subscription/billing adapter paths and tests in isolated workspace. Shared contracts require contract-owner approval.

**Definition of Done:** AC coverage, relevant tests pass, complete diff reviewed, traceability updated, no open critical/high findings, report produced. Status is IMPLEMENTED, not VERIFIED or APPROVED.

## 7. Independent plan review

A Planning Reviewer checks:
- all FRs and ACs map to work packages;
- dependencies and parallelism are correct;
- contracts have clear owners;
- migrations and backward compatibility are considered;
- failure and security scenarios are covered;
- workspaces and allowed paths are defined;
- verification and release evidence are planned;
- autonomy matches risk.

Decision: READY, CLARIFY or BLOCKED. See [Plan Review](../case-study/04-architecture/plan-review.md).

## 8. L4 autonomy boundaries

| Action | Training policy |
|---|---|
| Read-only discovery | Autonomous in isolated environment |
| Draft architecture and ADR | Autonomous proposal |
| Approve critical ADR | Human Engineering Owner |
| Implement approved package | Autonomous in bounded workspace |
| Run approved CI tests | Autonomous |
| Create PR | Autonomous within policy |
| Merge financial changes | Human approval |
| Production deployment | Human approval initially |
| Financial compensation / destructive data repair | Explicit human approval |

## 9. Definition of Ready

- [ ] Intent, Discovery and specification are approved.
- [ ] Domain invariants and service ownership are known.
- [ ] Critical ADRs are accepted by owners.
- [ ] Impact and dependencies are mapped.
- [ ] Work packages have bounded scope and DoD.
- [ ] Parallel file/contract ownership is clear.
- [ ] Verification includes failure paths.
- [ ] Permissions, stop conditions and recovery are defined.
- [ ] Independent Plan Review is READY.

## 10. Practical exercise

A provider timeout can leave Payment Provider and Subscription Service in different apparent states. Do not immediately choose a retry algorithm. Prepare an ADR with at least three alternatives, trade-offs, validation tests, owners and an explicit statement of what evidence is still missing.

**Next:** [Lesson 06 — Claude Code Engineering](06-claude-code-engineering.md).

## Knowledge check — 10 questions

1. Which statement best separates specification from architecture?  
   A. Specification says what; architecture says how/where. B. They are synonyms. C. Architecture is a test. D. Specification chooses the framework.

2. What is the purpose of an ADR?  
   A. Record a consequential decision, alternatives and trade-offs. B. List every source file. C. Replace requirements. D. Approve business intent.

3. Why is a distributed lock not automatically a complete idempotency solution?  
   A. Locks are always unsafe. B. It may limit concurrency but does not guarantee one external and internal business effect across retries. C. It replaces audit. D. It makes webhook delivery synchronous.

4. When can work packages run in parallel?  
   A. Whenever there are multiple agents. B. When dependencies/contracts and ownership are stable and work is isolated. C. Before requirements exist. D. When agents can resolve policy by voting.

5. What makes a Task Packet useful?  
   A. A short title. B. Objective, inputs, scope, dependencies, permissions, ACs, evidence and stop conditions. C. An unlimited prompt. D. A model name.

6. Who approves a critical cross-service architecture decision?  
   A. Any implementation agent. B. Authorized Engineering/Architecture Owner. C. Customer Support. D. CI runner.

7. A work package changes a shared API contract while another agent edits the consumer. What should happen?  
   A. Merge whichever finishes first. B. Stop integration and resolve contract ownership/version before parallel work continues. C. Delete the consumer tests. D. Ask both agents to vote.

8. What does READY from Plan Review mean?  
   A. Production is approved. B. The plan is sufficiently bounded for the next controlled execution stage. C. Business outcome achieved. D. All code is implemented.

9. Which work is appropriate for WP-05 Immediate Upgrade?  
   A. Automatic refund of all previous upgrades. B. Production deployment. C. Idempotent payment and state transition within approved scope. D. Rewrite all billing services.

10. What is the correct approach to unknown provider semantics?  
    A. Assume common behavior. B. Record unknown and validate provider contract before implementation. C. Let the coding agent choose. D. Ignore webhooks.

### Answer key and explanations

1. **A** — Specification defines behavior; architecture chooses a justified design.  
2. **A** — ADRs preserve decision context and consequences.  
3. **B** — External side effects and event retries require durable idempotency and reconciliation.  
4. **B** — Parallelism depends on stable contracts, ownership and isolation.  
5. **B** — A task packet limits ambiguity and defines proof of completion.  
6. **B** — Technical accountability must be explicit.  
7. **B** — Shared contracts need one accountable owner and compatible versioning.  
8. **B** — It authorizes a next stage, not production release.  
9. **C** — The package should be bounded to the immediate upgrade slice.  
10. **B** — Unknown provider behavior is a discovery task, not a prompt gap to fill.
