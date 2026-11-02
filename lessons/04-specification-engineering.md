# Lesson 04 — Specification Engineering

**Outcome:** Turn approved intent and discovered system knowledge into a testable, traceable contract for implementation and independent verification.

## 1. Why a feature description is not a specification

“Add self-service subscription management. Upgrade is immediate, downgrade takes effect next cycle. Preserve billing consistency and discounts.”

This is a useful summary, but not an executable contract. It does not say what happens when payment is declined, a provider times out after capture, a webhook is duplicated, two commands race, a discount expires between preview and confirmation, or entitlement delivery fails.

An autonomous agent will fill gaps somehow. The risk is that it invents plausible but unauthorized behavior. Specification Engineering reduces the space of acceptable interpretations.

The input is not just a Business Intent. It is:
- approved [Business Intent](../case-study/01-intent/business-intent.md);
- evidence-backed [System Context](../case-study/02-discovery/system-context.md);
- reviewed [Domain Model](../case-study/02-discovery/domain-model.md);
- [Impact Analysis](../case-study/02-discovery/impact-analysis.md);
- confirmed owner decisions and existing API/event contracts.

## 2. Seven layers of a complete specification

| Layer | Question | Subscription example |
|---|---|---|
| Business requirements | Why does this matter? | Reduce avoidable Support contacts |
| Functional requirements | What must the product do? | Admin can preview an eligible upgrade |
| Business rules | What behavior is allowed? | Upgrade activates only after required approval and successful payment |
| Non-functional requirements | What properties must hold? | Account-scoped authorization, audit, reliability |
| Acceptance criteria | How can a behavior be accepted? | Given payment decline, current plan remains effective |
| Test scenarios | What evidence will prove it? | Payment decline integration test |
| Constraints/dependencies | What must not be broken or what must exist? | Provider contract, entitlement ownership, no production mutation |

These layers must be linked. A table of disconnected requirements is not enough.

## 3. Requirement quality

A good requirement is:
- uniquely identified;
- singular and unambiguous;
- observable or testable;
- scoped to an actor and condition;
- consistent with approved business rules;
- traceable to its source and verification evidence.

Avoid “system should be fast”, “handle errors gracefully” or “secure the endpoint”. Instead define the measurable property or explicitly state that its threshold is awaiting baseline/SLO agreement.

For example:
- Weak: “The system should handle duplicate upgrade requests.”
- Strong: “For the same account, operation type and idempotency key, repeated submissions return the same logical operation and do not create a second payment effect. Reuse of the key with a different request fingerprint is rejected.”

## 4. Functional and non-functional requirements

The case study defines FR-01 through FR-14 and NFR-01 through NFR-10 in [requirements.md](../case-study/03-specification/requirements.md).

A few important examples:

- **FR-03:** preview includes target price, currency, effective date, next charge and discount impact.
- **FR-04:** upgrade becomes effective immediately only after required approval and successful payment.
- **FR-05:** downgrade is scheduled for the next billing cycle.
- **FR-11:** downgrade is blocked if current usage exceeds target limits; no data is deleted.
- **NFR-01:** authorization is account-scoped and enforced server-side.
- **NFR-03:** duplicate commands and webhooks do not duplicate business effects.
- **NFR-04:** divergence between payment, subscription and entitlement state has a defined reconciliation path.
- **NFR-09:** audit records actor, operation, before/after state and correlation metadata.

Do not confuse NFRs with arbitrary numbers. Latency and availability thresholds must come from agreed SLOs and observed baseline, not from an agent inventing impressive-looking values.

## 5. Business rules are not implementation decisions

Business rules define acceptable behavior; architecture defines how the system enforces it.

Examples:
- BR-03: upgrade is effective immediately only after required confirmation and successful payment.
- BR-04: downgrade takes effect next billing cycle.
- BR-10: retain a discount only when Promotion policy confirms compatibility and validity.
- BR-14: block downgrade above target limits; do not delete data.
- BR-15: repeated logical commands/events do not duplicate effects.

These rules do not automatically dictate Kafka, Redis, a database lock, a saga library or a particular provider. Those are architecture decisions to be justified later.

See [business-rules.md](../case-study/03-specification/business-rules.md).

## 6. Acceptance criteria: Given / When / Then

Acceptance criteria express observable behavior in a controlled context.

### AC-01 — Successful upgrade
**Given** an eligible active subscription, an Admin and any required Billing Owner approval  
**When** the user confirms and payment succeeds  
**Then** the subscription moves to the target plan, entitlements converge to the new effective plan, the operation is audited and confirmation reflects authoritative state.

### AC-02 — Payment declined
**Given** an eligible subscription  
**When** the upgrade payment is declined  
**Then** the current effective plan and entitlements remain unchanged, and the failure is recorded.

### AC-03 — Downgrade scheduled
**Given** usage is within target-plan limits  
**When** an Admin confirms downgrade  
**Then** a scheduled change is stored for the next billing cycle and current entitlements remain active until the effective date.

### AC-04 — Downgrade exceeds limits
**Given** current usage exceeds target limits  
**When** downgrade is requested  
**Then** the system explains the excess, blocks confirmation and does not delete data.

### AC-05 — Duplicate request
**Given** a logical operation already exists for an idempotency key  
**When** the same request is submitted again  
**Then** the existing operation is returned and no duplicate financial effect occurs.

More scenarios are in [acceptance-criteria.md](../case-study/03-specification/acceptance-criteria.md).

## 7. Edge cases are first-class specification

Edge cases are not an appendix to write after implementation. They are where business and technical assumptions become visible.

| Scenario | Expected handling |
|---|---|
| Provider timeout after charge request | Treat outcome as unknown; reconcile before retry |
| Duplicate webhook | Deduplicate by provider event identity |
| Out-of-order webhook | Validate against authoritative operation/state version |
| Discount expires after preview | Recalculate and require renewed price confirmation |
| Admin role revoked during flow | Re-check authorization at the critical action boundary |
| Upgrade and cancel race | Apply an explicit conflict policy; do not guess |
| Entitlement update fails | Mark operation incomplete, create reconciliation work and block completion |
| Provider unavailable | Do not report success without authoritative confirmation |

See the full [edge-case register](../case-study/03-specification/edge-cases.md). If a business outcome is not approved, the artifact must say **OPEN / OWNER DECISION REQUIRED**, not invent a rule.

## 8. Test scenarios and traceability

A test scenario is a verification plan; it is not necessarily a test implementation yet.

The traceability chain is:

`Business Intent → FR/NFR/BR → Acceptance Criteria → Test Scenario → Test Evidence → Release decision`

The [traceability matrix](../case-study/03-specification/traceability-matrix.md) maps requirements to ACs and tests. Every must-have requirement needs a verification path. A requirement without evidence is not ready for autonomous implementation.

Traceability also works in reverse: a test with no requirement may be testing accidental behavior or an unapproved feature.

## 9. Specification workflow and independent review

The [Specification Engineering Skill](../skills/specification-engineering/SKILL.md) should:

1. load approved intent and discovery artifacts;
2. map business outcomes to requirements;
3. identify domain entities and invariants;
4. separate business rules from technical design;
5. define NFRs and constraints;
6. write acceptance criteria including negative and failure paths;
7. create test scenarios;
8. build traceability;
9. run consistency checks;
10. return READY, CLARIFY or BLOCKED.

The Specification Agent creates a draft. A separate Specification Reviewer inspects omissions, contradictions, unsupported assumptions and traceability. Product/Domain owners approve business rules. A reviewer cannot approve a business decision outside their authority.

## 10. Definition of Ready

- [ ] All requirements have unique IDs.
- [ ] Requirements trace to the Business Intent.
- [ ] System-specific claims trace to discovery evidence.
- [ ] Business rules are approved.
- [ ] Critical edge cases are described.
- [ ] Positive, negative, boundary and failure paths exist.
- [ ] Acceptance criteria are objectively verifiable.
- [ ] Security, privacy, observability and recovery are addressed.
- [ ] Traceability reaches test scenarios.
- [ ] No critical contradiction or unresolved business decision remains.
- [ ] Independent specification review is READY.
- [ ] Authorized owner has approved the specification version.

## 11. Practical exercise

Take the case-study requirement FR-04. Create:
1. one happy-path AC;
2. three negative/failure ACs;
3. one concurrency AC;
4. corresponding test scenarios;
5. traceability links;
6. a list of decisions that require Product Owner rather than Engineering Owner approval.

**Next:** [Lesson 05 — Architecture & Planning](05-architecture-planning.md).

## Knowledge check — 10 questions

1. What is the primary purpose of a specification?  
   A. Select the database. B. Constrain interpretation and define testable expected behavior. C. Replace discovery. D. Generate prompts.

2. Which is the strongest requirement?  
   A. “Handle retries well.” B. “Make billing reliable.” C. “Repeated same-key requests return the same logical operation and create no duplicate payment effect.” D. “Use Redis.”

3. Who owns approval of a business rule?  
   A. Coding agent. B. CI. C. Authorized Product/Domain Owner. D. Database administrator by default.

4. Which statement is a business rule rather than an architecture decision?  
   A. Use Kafka. B. Store idempotency keys in PostgreSQL. C. Downgrade takes effect next billing cycle. D. Use a distributed lock.

5. Why use Given/When/Then?  
   A. It makes code compile. B. It expresses observable preconditions, action and expected outcome. C. It replaces all tests. D. It defines deployment.

6. A provider times out after a charge request. What should the spec require?  
   A. Retry payment immediately. B. Assume declined. C. Treat result as unknown and reconcile before another financial action. D. Activate plan optimistically.

7. Why is traceability bidirectional?  
   A. To increase document count. B. To ensure each requirement has evidence and each test has an authorized reason. C. To replace code review. D. To let agents add scope.

8. What should happen when a critical business rule is unresolved?  
   A. Agent chooses a likely rule. B. Mark it approved. C. CLARIFY/BLOCKED and request owner decision. D. Omit related tests.

9. Which artifact contains detailed failure and boundary conditions?  
   A. Edge-case register. B. Model routing. C. Release dashboard. D. README only.

10. Does a READY specification authorize production release?  
    A. Yes. B. No; it authorizes the next planning/execution stage subject to further gates. C. Only if tests are green. D. Only for billing.

### Answer key and explanations

1. **B** — Specification makes intended behavior precise and verifiable.  
2. **C** — It defines observable semantics without prematurely choosing technology.  
3. **C** — Business policy requires an accountable business owner.  
4. **C** — It defines the product's expected timing behavior.  
5. **B** — ACs make expected behavior explicit and testable.  
6. **C** — Timeout does not prove failure; reconciliation prevents duplicate charges.  
7. **B** — Requirements need proof; tests need traceable intent.  
8. **C** — Agents must not create policy by implication.  
9. **A** — Edge cases record failure and boundary behavior.  
10. **B** — Specification approval is not a deployment authorization.
