# Lesson 08 — AI Implementation

**Outcome:** Implement one approved work package in an existing codebase, preserving business invariants and producing evidence for independent verification.

## 1. Implementation is a controlled engineering process

This lesson is not “how to ask Claude to write code”. The Implementation Agent receives an approved Task Packet from the orchestrator and must understand the system before editing.

The core loop is:

1. **Understand:** read Task Packet, specification, ADRs and relevant code.
2. **Baseline:** inspect existing behavior, tests, contracts and side effects.
3. **Plan:** identify minimal change, dependencies and risks.
4. **Implement:** change only the assigned scope.
5. **Verify:** run relevant tests and checks.
6. **Report:** return diff, evidence, limitations and handoff.

If the actual code contradicts an approved business rule, stop the affected work and raise evidence. Do not silently choose whether the code or policy is correct.

## 2. Spec-driven implementation

Maintain the chain:

`BR-03 → FR-04 → AC-01 → TS-04 → test result → implementation diff`

The implementation is not proof of correctness. Tests should derive from approved acceptance criteria, not simply mirror the code the agent has just written.

For each changed behavior, report:
- requirement and AC IDs;
- source files and symbols changed;
- tests added or modified;
- exact commands executed and outcomes;
- known limitations;
- open questions and residual risks.

## 3. Choose the right brownfield strategy

| Strategy | When useful | Risk to manage |
|---|---|---|
| Minimal patch | Local change in a well-understood component | Hidden dependencies |
| Vertical slice | User-visible behavior crosses multiple layers | Contract gaps |
| Characterization tests | Legacy behavior is poorly documented | Accidentally enshrining a defect |
| Feature flag / strangler | Risky behavior needs gradual transition | Divergent old/new behavior |
| Contract-first | Multiple services change together | Contract may be based on false assumptions |

For the subscription feature, use a vertical slice for Upgrade, but agree contracts and invariants first. Avoid rewriting the entire Subscription Service as part of the first slice.

## 4. TDD and AI agents

Use Red → Green → Refactor where appropriate:

- **RED:** write a test from an approved AC; confirm it fails for the expected reason.
- **GREEN:** implement the smallest change that satisfies it.
- **REFACTOR:** improve structure without changing approved behavior.

Rules:
- Do not delete or weaken a failing test merely to make CI green.
- If test and specification conflict, stop and clarify.
- Use characterization tests to understand legacy behavior, but do not assume existing behavior is correct.
- Add integration/contract tests when mocks cannot validate the important boundary.

## 5. Practical vertical slice — Upgrade Subscription

A possible logical execution path:

1. Frontend requests current subscription and available plans.
2. Backend authenticates actor and checks account-scoped Admin role.
3. Eligibility service excludes enterprise, bespoke legacy, overdue and disputed accounts.
4. Billing/Promotion return authoritative quote and discount impact.
5. UI displays target price, currency, effective date and next charge.
6. If immediate charge is required and Admin is not Billing Owner, request Billing Owner approval.
7. API accepts a command with an idempotency key and expected state version.
8. Billing/payment workflow processes the charge.
9. Subscription transitions only after authoritative payment success.
10. Entitlement service applies the effective access change.
11. Audit, notification and analytics events are emitted.
12. Operation status is returned from authoritative state, not optimistic frontend assumptions.

This is a logical training path. Actual system boundaries and provider semantics must be confirmed during Discovery.

### Six critical engineering concerns

**Authorization:** check roles on the backend, at the relevant action boundary. Frontend visibility is not access control.

**Financial confirmation:** price, currency, discount and effective date shown to the user must match the authoritative quote accepted for execution. Revalidate stale quotes.

**Idempotency:** duplicate submissions must not create duplicate charges or state transitions.

**Timeout:** a timeout is an unknown outcome, not proof of payment failure. Query/reconcile before retry.

**State ownership:** know which component owns payment, subscription and entitlement truth. Do not update multiple service stores blindly.

**Auditability:** retain actor, operation, confirmation, before/after state, timestamps and correlation identifiers without logging secrets.

## 6. Common AI implementation failures

| Failure | Why dangerous | Control |
|---|---|---|
| Hallucinated API/class | Agent invents a nonexistent abstraction | Verify actual symbols and call paths |
| Tests mirror implementation | Wrong code and wrong tests agree | Independent AC-derived cases |
| Overengineering | Unrelated refactor increases blast radius | Minimal scope and separate proposal |
| Silent business decision | Agent invents financial policy | CLARIFY |
| Over-mocking | Integration failure is hidden | Contract and integration tests |
| Unsafe migration | Data loss or incompatible deployment | Migration review and recovery plan |
| Hidden side effects | Unexpected events/state changes | Trace side effects and audit |

## 7. Implementation Skill

The [Implement Work Package Skill](../skills/implement-work-package/SKILL.md) defines:
- inputs: approved Task Packet, specification, ADRs, context and code;
- preconditions: READY status, dependencies complete, rules approved;
- workflow: inspect, baseline, plan, test, implement, verify, diff review, report;
- constraints: no unrelated changes, no test weakening, no production data, no merge/deploy;
- outputs: summary, files, AC mapping, test results, evidence, risks and next action.

Valid final statuses are IMPLEMENTED, NEEDS_FIX, BLOCKED and CLARIFICATION_REQUIRED. Do not use VERIFIED or APPROVED for the agent's own work.

## 8. Implementation Readiness Gate

- [ ] Work package is READY.
- [ ] Requirements and ACs are approved.
- [ ] Dependencies and contracts are complete.
- [ ] Relevant ADRs are accepted.
- [ ] Allowed repositories and paths are defined.
- [ ] Critical invariants are included in context.
- [ ] Tests and evidence are specified.
- [ ] Secrets and external access are restricted.
- [ ] Stop conditions, budget and retry limits are defined.

## 9. Practical exercise — WP-05

Using [WP-05 Immediate Upgrade](../case-study/04-architecture/implementation-plan.md) and the [work package contract](../orchestration/work-packages.md):
1. Draft a Task Packet.
2. Identify the exact requirements and ACs.
3. Design tests for success, decline, timeout, duplicate command and webhook, authorization failure and entitlement outage.
4. Define the smallest implementation scope.
5. Write an implementation report that clearly distinguishes executed checks from planned checks.

**Next:** [Lesson 09 — Quality Engineering](09-quality-engineering.md).

## Knowledge check — 10 questions

1. What must the Implementation Agent do before editing?  
   A. Rewrite the service. B. Read the task packet, relevant artifacts and existing code/tests. C. Start production deployment. D. Delete failing tests.

2. What should a test be derived from?  
   A. The implementation's current behavior only. B. Approved requirements and acceptance criteria. C. The agent's confidence. D. A random sample.

3. What does a provider timeout mean?  
   A. Payment definitely failed. B. Payment definitely succeeded. C. Outcome is unknown until reconciled. D. Retry with a new key immediately.

4. Why are characterization tests used?  
   A. To prove legacy behavior is correct. B. To capture observed behavior before change when documentation is incomplete. C. To replace acceptance criteria. D. To test only UI text.

5. What is a vertical slice?  
   A. A complete user-visible path across relevant layers. B. All frontend tasks first. C. All database migrations first. D. A refactor of every service.

6. Why is frontend role hiding insufficient?  
   A. Users cannot inspect HTML. B. Authorization must be enforced at the backend/action boundary. C. Backend is not involved in billing. D. UI cannot call APIs.

7. What should happen if code behavior conflicts with approved Business Rule?  
   A. Follow legacy behavior silently. B. Change business rule in code. C. Stop affected work, provide evidence and request owner clarification. D. Remove the rule.

8. What is a valid implementation-agent final status?  
   A. VERIFIED. B. APPROVED. C. IMPLEMENTED. D. RELEASE_COMPLETE.

9. Why avoid overengineering in a bounded package?  
   A. It prevents all refactoring. B. It expands blast radius beyond approved scope. C. It reduces test count. D. It makes code shorter.

10. Which report is most useful to the orchestrator?  
    A. “Done, looks good.” B. Summary, changed files, exact test outcomes, AC mapping, evidence, limitations and risks. C. Model's private reasoning. D. Token count only.

### Answer key and explanations

1. **B** — Brownfield understanding is a precondition to safe changes.  
2. **B** — Requirements define expected behavior.  
3. **C** — Timeout is ambiguous; reconcile before retrying financial effects.  
4. **B** — Observed behavior is captured without declaring it the correct policy.  
5. **A** — A vertical slice exposes cross-layer integration early.  
6. **B** — Backend enforcement protects APIs from unauthorized calls.  
7. **C** — Business decisions belong to authorized owners.  
8. **C** — Implementation agents report their own work, not independent verification.  
9. **B** — Keep changes bounded and reviewable.  
10. **B** — Structured evidence enables independent decisions.
