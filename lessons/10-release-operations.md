# Lesson 10 — Release & Operations

**Outcome:** Deliver a verified change progressively, monitor technical and business invariants, and recover safely when production behavior diverges from expectations.

## 1. Deployment success is not delivery success

Imagine the Upgrade feature passed CI, was approved and deployed without service downtime. Hours later:
- some successful payments have no matching entitlement;
- users report unexpected prices;
- Support contacts increase.

The deployment succeeded. The delivery outcome did not.

Assess four layers:

| Layer | Question |
|---|---|
| Deployment | Did the new version deploy? |
| Technical health | Are services, infrastructure, latency and errors healthy? |
| Functional health | Do the new flows work correctly? |
| Business health | Are customer and business outcomes improving without guardrail harm? |

Release completion means the release process is stable and evidence has been captured. It does not mean a three-month business KPI has already been achieved.

## 2. Progressive delivery

Do not expose a high-risk billing feature to everyone at once.

A possible rollout:
1. internal/test accounts;
2. small canary cohort;
3. limited rollout;
4. gradual expansion;
5. general availability.

Percentages must be selected from traffic volume, statistical sufficiency, risk and operational capacity. A small percentage may still represent many financial operations.

Deployment strategies and feature flags are different:
- rolling, blue-green and canary control how versions receive traffic;
- feature flags control who can access a behavior.

They can be combined. Feature flags do not replace backend authorization or billing validation.

## 3. Feature flags for Subscription Management

Use flags to:
- enable Upgrade for a controlled cohort;
- release Downgrade separately;
- disable Pause if a defect is found;
- stop further exposure without redeploying.

Keep flags safe and observable:
- server-side enforcement remains mandatory;
- define owner, expiry and cleanup plan;
- record which cohort experienced which behavior;
- ensure flag-off behavior is safe;
- do not use a flag as a substitute for state migration or compensation.

## 4. Database changes and expand–migrate–contract

A new application version may expect a database field not yet present in production. With independently deployed services and rolling releases, old and new application versions can coexist.

Use:
1. **Expand:** add backward-compatible nullable field/table/index; old code still works.
2. **Migrate:** deploy code that can read/write compatible formats; backfill safely and resumably; validate consistency.
3. **Contract:** remove old fields only after no deployed version or consumer needs them.

Do not assume application rollback reverses a data migration. Do not run destructive production migrations from an implementation agent. Define lock impact, backfill progress, idempotency, resume behavior and recovery.

## 5. Post-deployment verification

Monitor four signal groups:

| Group | Example signals |
|---|---|
| Technical | Availability, latency, error rate, saturation |
| Functional | Upgrade success, payment decline, operation failure |
| Consistency | Payment ↔ subscription ↔ entitlement divergence |
| Business | Completion rate, Support contacts, complaints, refunds, churn |

A critical invariant might be:

`Paid Upgrade ⇒ Subscription Updated ∧ Entitlements Consistent`

If processing is asynchronous, define an allowed convergence window and reconciliation mechanism. Do not interpret eventual consistency as permission to lose the event or report success prematurely.

SLI is what is measured; SLO is the target; error budget is the tolerated deviation over a period. Numeric thresholds must be derived from baseline, product risk and service commitments. “Zero duplicate charges” is a business invariant, not a latency SLO to average away.

## 6. Halt, rollback, roll-forward and reconciliation

These actions are different:

- **Halt rollout:** stop exposing more users.
- **Disable flag:** turn off a safe feature path.
- **Rollback:** deploy a prior application version where compatible.
- **Roll-forward:** deploy a corrective version.
- **Reconciliation:** compare authoritative records and repair divergence.
- **Compensation:** reverse an external business effect under approved policy.

A rollback does not refund a payment or repair subscription/entitlement state automatically.

Safe automatic actions may include halting canary on a pre-approved critical threshold and creating an incident. Refunds, mass state changes, destructive data repair and production database mutation require explicit authorization and a controlled procedure.

## 7. AI agents in production operations

| Agent | Responsibility | Boundary |
|---|---|---|
| Release Agent | Readiness, deployment status, rollout report | Approved workflow only |
| Observability Agent | Analyze metrics, traces, redacted logs | Read-only; correlation is not causation |
| Incident Agent | Timeline, affected services, hypotheses | Does not declare root cause without evidence |
| Recovery Agent | Propose rollback/roll-forward/reconciliation | Financial/destructive actions require approval |

Human-on-the-loop is often more appropriate than approving every safe step: people define policy, monitor and intervene; the system performs explicitly authorized operations.

## 8. End-to-end release state machine

`VERIFIED → RELEASE_READY → APPROVAL_PENDING → APPROVED → DEPLOYING → CANARY → OBSERVING → PROMOTING → GENERAL_AVAILABILITY → POST_RELEASE_VERIFICATION → RELEASE_COMPLETE`

Alternative states: FAILED, HALTED, ROLLBACK_REQUIRED, ROLL_FORWARD_REQUIRED, INCIDENT.

Before deployment, require:
- VERIFIED evidence;
- mandatory quality/security gates;
- migration compatibility and recovery plan;
- feature flags and cohort configuration;
- monitoring, alerting and SLO thresholds;
- on-call ownership;
- rollback/roll-forward/reconciliation plans;
- accountable human approval where required.

See [Release Policy](../release/release-policy.md) and [Approval Matrix](../governance/approval-matrix.md).

## 9. Post-release learning

Return to the Business Intent target: reduce subscription-management Support contacts by 30% within three months.

Compare baseline and post-release:
- Support contacts per active subscription;
- self-service completion;
- operations completed without Support;
- billing complaints;
- refund rate;
- churn after changes;
- entitlement reconciliation incidents.

Consider seasonality, active-user growth, campaigns, changes to Support taxonomy and other product releases. Correlation is not proof of causal impact. Use cohorts or other defensible comparisons when possible.

## 10. Practical exercise

At 5% canary:
- technical service metrics are green;
- 2% of paid upgrades have no entitlement update;
- Support reports price confusion.

Write an incident decision:
1. what stops immediately;
2. which data and traces are required;
3. which state is authoritative for payment, subscription and entitlement;
4. what recovery is safe;
5. what requires human approval;
6. what evidence is needed before resuming rollout.

**Next:** [Lesson 11 — Governance & Business Metrics](11-governance-business-metrics.md).

## Knowledge check — 10 questions

1. What is the difference between deployment success and delivery success?  
   A. None. B. Deployment is technical release; delivery includes functional and business outcomes. C. Delivery is only code quality. D. Deployment measures Support tickets.

2. What is the purpose of canary rollout?  
   A. Expose everyone immediately. B. Limit blast radius and observe behavior before expansion. C. Replace automated tests. D. Avoid feature flags.

3. How do deployment strategy and feature flags differ?  
   A. They are identical. B. Deployment controls version rollout; flags control behavior exposure. C. Flags replace authorization. D. Deployment strategy changes pricing rules.

4. What is expand–migrate–contract?  
   A. A way to delete old schema first. B. A compatibility strategy for evolving data structures across versions. C. A testing pyramid. D. A model routing pattern.

5. Payment succeeds but entitlement update fails. What should happen?  
   A. Mark release complete. B. Ignore it if API latency is fine. C. Halt expansion and investigate/reconcile the invariant. D. Delete the subscription.

6. Why is application rollback not sufficient for every incident?  
   A. It always fails. B. It does not automatically reverse external payments or repair data state. C. It changes feature flags only. D. It deletes audit logs.

7. Which production action is appropriate for pre-authorized automation?  
   A. Refund all affected users. B. Halt canary when a defined critical invariant breaches. C. Delete production records. D. Mass cancel subscriptions.

8. What should Observability Agent distinguish?  
   A. Logs from metrics. B. Correlation from causation. C. Tests from source. D. PR from branch.

9. What does RELEASE_COMPLETE mean?  
   A. Every business KPI target has already been achieved. B. Release stages and immediate verification are complete; longer-term outcome measurement continues. C. No future incidents can happen. D. AI approved the product.

10. How should business impact be evaluated?  
    A. Compare raw ticket counts only. B. Use normalized baseline, guardrails and account for confounders. C. Assume improvement after deployment. D. Use token usage.

### Answer key and explanations

1. **B** — Deployment is one stage; delivery includes customer outcome and guardrails.  
2. **B** — Canary limits exposure and provides evidence before expansion.  
3. **B** — One governs infrastructure rollout, the other feature availability.  
4. **B** — Compatibility is preserved while data and code evolve.  
5. **C** — The paid-upgrade invariant is broken; stop and reconcile.  
6. **B** — External side effects and persisted state need separate recovery.  
7. **B** — Safe, reversible halt can be policy-authorized.  
8. **B** — A time correlation does not establish root cause.  
9. **B** — Operational release completion and long-term business success are distinct.  
10. **B** — Normalization and confounders are essential for credible attribution.
