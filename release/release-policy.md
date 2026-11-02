# Release & Operations Policy

## Release prerequisites
- Verification status is VERIFIED.
- Mandatory quality and security gates pass.
- Migration compatibility plan is approved.
- Feature flag and cohort configuration are reviewed.
- Monitoring, alerts, SLOs and on-call ownership are defined.
- Rollback, roll-forward and reconciliation paths are documented.
- Human approval is recorded according to the approval matrix.

## Progressive rollout
1. Internal cohort.
2. 5% eligible traffic.
3. 25%.
4. 50%.
5. 100% / general availability.

At each stage, observe technical health and business invariants for an agreed window. Derive numeric thresholds from current SLOs, baseline and risk appetite; do not invent them.

## Automatic stop conditions
- Critical invariant breach.
- Payment failure or duplicate-charge rate exceeds approved threshold.
- Entitlement divergence exceeds approved threshold.
- Error rate or latency breaches SLO.
- Security or data-integrity alert.

Stopping rollout or disabling a pre-approved safe flag may be automated. Financial compensation, destructive data operations and mass state changes require a separately approved recovery process.

## Recovery distinctions
- Rollback: revert application version where safe.
- Roll-forward: deploy a corrective version.
- Reconciliation: repair state divergence using authoritative records.
- Compensation: reverse an external business effect under explicit human-approved policy.

Application rollback does not undo a payment or repair a business state transition automatically.

## Production agents
Release Agent checks readiness and controls permitted rollout. Observability Agent analyzes signals. Incident Agent builds timelines and hypotheses. Recovery Agent proposes safe recovery. Agents execute only explicitly permitted actions; human incident command and financial accountability remain explicit.