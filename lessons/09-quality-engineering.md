# Lesson 09 — Quality Engineering

**Outcome:** Build an independent verification system that evaluates AI-generated changes against approved requirements, invariants and risk.

## 1. Testing, verification, validation and Quality Engineering

| Concept | Question |
|---|---|
| Testing | Does this specific behavior work? |
| Verification | Does the implementation conform to the approved specification and contracts? |
| Validation | Does the product solve the real business problem? |
| Quality Engineering | How do we systematically build, verify and measure quality throughout delivery? |

A green unit suite can coexist with poor product outcomes. An upgrade can pass tests but produce an unexpected price, fail to update entitlements or increase billing complaints.

## 2. Layered test architecture

| Level | Purpose | Example |
|---|---|---|
| Unit | Pure logic | Discount compatibility and eligibility |
| Component | Component with controlled dependencies | Upgrade command handler |
| Contract | API/event compatibility | Subscription ↔ Billing quote contract |
| Integration | Real component interaction | Payment confirmation to subscription transition |
| E2E | User journey | Admin upgrade with Billing Owner approval |
| Resilience | Failure/retry behavior | Timeout, duplicate webhook, entitlement outage |
| Production verification | Real deployed signals | Payment/entitlement mismatch and Support contacts |

Do not optimize for equal test counts at each layer. Match test type to risk and failure mode. Mocks are useful but cannot replace contract or integration evidence for important boundaries.

## 3. Independent verification

The Implementation Agent produces a change and its report. Verification must not simply trust that report.

A useful independent reviewer:
1. loads approved intent, rules, requirements, ACs and ADRs;
2. inspects the actual diff;
3. maps each changed behavior to ACs;
4. inspects whether tests truly assert expected behavior;
5. runs permitted checks independently;
6. adds negative, boundary and failure cases;
7. checks security, concurrency, audit and recovery;
8. reports findings with reproducible evidence.

A different agent name does not guarantee independence. Independence comes from separate context, direct evidence access, no reliance on author claims and a clear role boundary. A different model can reduce correlated error but does not guarantee correctness.

See [Verification Agent contract](../claude-code/agents/verification-agent.md) and [verification report example](../quality/verification-report.md).

## 4. Contract testing

Microservice defects often occur at service boundaries. Suppose Subscription expects:

```json
{"paymentStatus":"SUCCEEDED","operationId":"op-123"}
```

But Billing emits:

```json
{"status":"SUCCESS","id":"op-123"}
```

Each service's unit tests may pass, while the integration fails. Contract tests verify field names/types, required fields, error semantics, event schema, versioning and backward compatibility.

Agents must use one approved contract artifact; they must not independently invent producer and consumer schemas.

## 5. Mutation testing

Mutation testing deliberately introduces small defects to see whether tests detect them.

For example, change:

```java
if (paymentStatus == SUCCEEDED) {
    activateNewSubscription();
}
```

to an incorrect condition. If the suite still passes, it may not be checking the invariant.

[
Mutation Score =
\frac{Killed\ Mutants}{Non\text{-}equivalent\ Mutants}\times 100\%
]

A high score does not prove correctness. A low score on payment, authorization or entitlement logic signals weak tests. Use mutation testing selectively on critical modules rather than on every edit.

## 6. Security and reliability verification

For Subscription Management, include:
- authentication and account isolation;
- Admin/Billing Owner authorization;
- idempotency and replay;
- concurrency (upgrade vs cancel, duplicate submit);
- provider timeout and webhook signature/deduplication;
- payment/subscription/entitlement consistency;
- privacy and secret redaction;
- audit completeness;
- recovery and reconciliation.

Test personas should include standard monthly, annual, compatible discount, incompatible discount, enterprise, overdue, disputed, Admin without Billing Owner, pending operation and usage above downgrade limits.

## 7. Quality gates

### Hard gates
Block progression on:
- Critical/High security findings;
- failed mandatory acceptance criteria;
- broken business invariants;
- incompatible API/event contracts;
- failed mandatory integration checks;
- unreviewed destructive migration risk.

### Measurable thresholds
Set thresholds from baseline and risk: changed-code coverage, mutation score, static analysis, performance regression and flaky-test rate.

### Human approval gates
Require explicit owner approval for high-risk merge, financial policy exceptions, production release, data repair or compensation.

A warning must not be used to hide a critical issue.

## 8. Risk-based verification

| Risk | Example | Controls |
|---|---|---|
| Low | Documentation or local UI text | Lint, basic checks, review |
| Medium | New API endpoint | Unit, contract, integration, review |
| High | Billing, identity, subscription state | Full relevant suite, independent security/verification, human gate |
| Critical | Irreversible production data/financial operation | Special plan, independent validation, explicit authorization |

The same feature can contain several risk classes. Do not assign one average risk to the whole PR.

## 9. Verification Skill and findings

The [independent-verification Skill](../skills/independent-verification/SKILL.md) returns VERIFIED, VERIFIED_WITH_NON_BLOCKING_FINDINGS, NEEDS_FIX or BLOCKED.

A finding should include:
- ID and severity;
- category;
- requirement/AC;
- file/line or reproducible evidence;
- expected versus actual behavior;
- impact;
- recommendation;
- status.

Example: a repeated upgrade request creates a second payment operation. This is a HIGH or CRITICAL finding depending on actual exposure, linked to FR-12/BR-15 and idempotency ACs. The reviewer must include evidence, not merely state a suspicion.

## 10. Quality metrics

| Metric | What it indicates |
|---|---|
| Escaped Defect Rate | Defects that reached production |
| Change Failure Rate | Changes causing rollback, hotfix, incident or defined degradation |
| Reopen Rate | Defects recurring after closure |
| Flaky Test Rate | Instability of test suite |
| Verification Lead Time | Time from implementation completion to verification |
| First-pass Verification Rate | Changes accepted by independent verification on first pass |
| Cost per Accepted Change | Full cost of changes that pass acceptance |

Do not maximize test coverage without examining test quality. Do not optimize verification speed by weakening gates.

## 11. Practical exercise — WP-05

Suppose the implementation agent reports green tests, but independent review finds:
1. retry after timeout creates another payment operation;
2. Admin without Billing Owner approval can trigger an immediate charge;
3. payment succeeds but entitlement update may fail without reconciliation.

For each finding, assign severity, requirement, evidence needed, gate decision and remediation owner. The package must not become VERIFIED while critical invariants are broken.

**Next:** [Lesson 10 — Release & Operations](10-release-operations.md).

## Knowledge check — 10 questions

1. What is the difference between verification and validation?  
   A. Verification checks conformance; validation checks whether the product solves the real problem. B. They are synonyms. C. Validation is unit testing only. D. Verification measures revenue.

2. Why should verification be independent?  
   A. To use a different vendor every time. B. To reduce the chance that the author's mistaken assumptions become the only proof. C. To avoid reading code. D. To increase agent count.

3. Which test best checks producer/consumer schema compatibility?  
   A. UI snapshot. B. Contract test. C. Unit test of a helper. D. Load test only.

4. What does mutation testing assess?  
   A. Whether tests detect deliberately introduced defects. B. Whether production data can be deleted. C. Whether a model is creative. D. Whether the API is documented.

5. A duplicate webhook creates a second business effect. What type of issue is this?  
   A. Cosmetic UI issue. B. Idempotency/reliability invariant failure. C. Documentation typo. D. Model routing issue.

6. Which is a hard gate?  
   A. Critical authorization bypass. B. Minor naming preference. C. Optional documentation improvement. D. Non-blocking formatting warning.

7. Why use risk-based verification?  
   A. To skip testing for complex code. B. To match depth of controls to impact and reversibility. C. To give every change the same slow suite. D. To let agents self-approve.

8. Payment succeeds but entitlement update fails. What should verification expect?  
   A. Mark complete. B. Hide the error. C. Reconciliation record, visible incomplete state and blocked completion. D. Refund automatically without approval.

9. What is First-pass Verification Rate?  
   A. Share of changes passing independent verification on first attempt. B. Share of agents launched. C. Percentage of code generated. D. Deployment frequency.

10. What is the correct status if mandatory ACs fail?  
    A. VERIFIED_WITH_NON_BLOCKING_FINDINGS. B. NEEDS_FIX or BLOCKED. C. APPROVED. D. COMPLETE.

### Answer key and explanations

1. **A** — Verification is conformance; validation is value/fitness for purpose.  
2. **B** — Independent evidence challenges author assumptions.  
3. **B** — Contract tests validate interface agreement.  
4. **A** — Mutants reveal whether tests detect specific classes of error.  
5. **B** — Duplicate delivery must not duplicate the business effect.  
6. **A** — Authorization bypass is a critical security failure.  
7. **B** — Control intensity should reflect risk and reversibility.  
8. **C** — Payment success alone is not complete delivery.  
9. **A** — It measures verification effectiveness on first pass.  
10. **B** — Failed mandatory criteria block verification.
