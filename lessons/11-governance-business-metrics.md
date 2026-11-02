# Lesson 11 — Governance & Business Metrics

**Outcome:** Operate AI-native engineering as an accountable organization, with versioned policies, least-privilege permissions, model/cost governance, auditability and outcome-based measurement.

## 1. Governance is an operating model

A CLAUDE.md file is not governance. Governance defines who owns decisions and how policies apply across people, agents, tools, data, services and environments.

Five domains:
1. **Business governance:** goals, priorities, rules and risk appetite.
2. **Engineering governance:** architecture, ADRs, quality gates and Definition of Done.
3. **AI governance:** allowed models, agents, skills, MCP servers and workflows.
4. **Security/compliance:** data classification, identity, secrets, access and audit.
5. **Operational governance:** cost, incidents, autonomy, metrics and policy change.

For the case study, Product Owner owns business intent/rules; Engineering Owner owns architecture and delivery risk; Security Owner owns security policy; Orchestrator enforces workflow; agents execute bounded work; named human approvers own high-risk gates.

## 2. Least privilege and policy-as-code

An agent should receive only the access required for its task. Read-only can still expose sensitive logs or customer data, so use classification, redaction, isolated environments, scoped credentials, network restrictions and audit.

| Capability | Discovery | Implementation | Verification | Release |
|---|---|---|---|---|
| Source | Read | Assigned workspace write | Read | Read |
| Production logs | Redacted read only if approved | None | None by default | Read per policy |
| Production DB | None | None | None | None by default |
| Secrets | No direct access | No direct access | No direct access | Controlled broker only |
| PR | None | Create | Read | Read |
| Merge | No | No | No | Policy/human gate |
| Deployment | No | No | No | Approved workflow only |

The example [agent-permissions.yaml](../governance/agent-permissions.yaml) illustrates role profiles. It is not a complete IAM configuration. Real enforcement belongs in runtime permissions, cloud IAM, sandbox, CI/CD and policy engine—not in prompts alone.

## 3. Where governance artifacts live in a microservices architecture

Governance is centralized in policy ownership but distributed in application.

### Organization/platform level
A dedicated Governance repository is the source of truth for global policies, security standards, model routing, risk classification, permission profiles, templates, approval matrix and audit retention.

### Product/domain level
The Subscription Domain repository owns business rules, domain invariants, product-level ADRs, cross-service contracts and product-specific risk decisions.

### Service level
Each microservice repository owns local CLAUDE.md, service rules/skills, local ADRs, API/event contracts, tests, runbooks and service evidence.

### Runtime systems
- workflow database: current state, dependencies and retries;
- object/evidence storage: test reports and large execution artifacts;
- immutable audit store: actions, decisions and approvals;
- observability platform: technical and business signals.

Do not put all execution logs in Git. Do not copy global policy into each microservice and manually maintain divergent versions.

For a detailed microservices layout, see [Lesson 12](12-end-to-end-implementation.md) and [target architecture](../reference/target-architecture.md).

## 4. Control plane and enforcement plane

**Control plane:** policy source, ownership, review, versioning and distribution.

**Enforcement plane:** runtime permissions, IAM, sandbox, tool gateway, CI/CD and local policy checks.

A policy change should:
1. be proposed in the Governance repository;
2. pass schema and policy tests;
3. receive required security/engineering review;
4. be versioned and published;
5. be distributed to orchestrators and enforcement points;
6. be referenced by each execution record;
7. produce audit evidence when evaluated.

A markdown instruction can explain a rule but cannot enforce it. A service-level rule may be stricter than global policy, but must not weaken mandatory global controls.

## 5. Model governance and routing

Not every task needs the strongest or most expensive model. Route by task complexity, risk and measured performance:

| Task | Model profile |
|---|---|
| Classification and code search | Fast/low-cost |
| Documentation and simple tests | Balanced |
| Complex implementation | High capability |
| Architecture review | High reasoning |
| Security review | High reasoning plus deterministic tools |
| Formatting | Fast/deterministic tools |

Use abstract profiles rather than hard-coding one model name into every workflow. A fallback must not silently lower verification requirements. Model choice should be evaluated against task-specific quality, latency and cost.

Independence does not require a different vendor: separate context, role, evidence and tools matter. Another model may reduce correlated error but does not guarantee correctness.

## 6. Cost governance

Measure full cost per accepted change, not only tokens:

`Cost per Accepted Change = (AI + Engineering + CI + Infrastructure + Review/Rework) / Accepted Changes`

Illustrative comparison from the training material:

| Cost category | Traditional | AI-native |
|---|---:|---:|
| Engineering time | $20,000 | $9,000 |
| AI model usage | $0 | $2,500 |
| CI/test infrastructure | $2,000 | $3,000 |
| Review and rework | $3,000 | $2,000 |
| Total | $25,000 | $16,500 |
| Accepted changes | 100 | 100 |
| Cost per accepted change | $250 | $165 |

This hypothetical example suggests 34% lower cost. It is not a measured benchmark and does not adjust for task complexity. Real comparisons must include platform maintenance, retries, human oversight and quality outcomes.

Also track cost per work package, cost of rework, cost per successful verification, retry rate and human intervention rate.

## 7. Engineering and business metrics

Five measurement groups:

- **Delivery:** lead time, deployment frequency, task-taken-to-production, work package cycle time.
- **Quality/reliability:** change failure rate, escaped defects, rework, recovery time, SLO attainment.
- **AI efficiency:** cost per accepted change, first-pass verification, retries, human intervention.
- **Engineering capacity:** independent packages, time on product decisions, manual coordination.
- **Business outcomes:** Support cost, self-service completion, retention, conversion and time-to-value.

DORA metrics remain useful; do not relabel every AI-specific measure as a DORA metric. In particular, task-taken-to-production is not idea-to-production. Pair speed with quality and stability.

For our fictional product, measure subscription-management Support contacts normalized by active subscriptions, self-service completion, successful operations without Support, billing complaints, refunds and churn.

## 8. Autonomy maturity is action-specific

The course L0–L5 scale is a working model. A team may have L4 for documentation and low-risk tests, but L2–L3 for billing, production database or financial compensation.

Assess L4 using:
- end-to-end ownership;
- reliable execution within retry/time/cost budgets;
- independent verification;
- technically enforced permissions;
- recovery and escalation;
- traceability;
- positive economics and business outcome.

A “90% autonomous execution” rate is not evidence of L4 if 30% of changes create production defects.

## 9. Auditability

A useful Agent Execution Record includes:
- execution/work-package ID;
- role and model profile/version;
- versions of intent/specification/ADR/policies;
- permission profile;
- start/end timestamps;
- tools and relevant actions;
- outputs and changed files;
- verification results;
- approvals and decision owners;
- residual risks.

Protect audit records from tampering, redact secrets and define retention. Platform activity logs do not necessarily replace business decision, CI, deployment and approval evidence.

## 10. Operating model and adoption

Do not create an “agent team” detached from engineering accountability. Humans own goals, architecture, risk and outcomes; agents execute bounded tasks.

A gradual adoption sequence:
1. **Standardize:** approved tools, Skills, permissions and task contracts.
2. **Measure:** execution records, cost, quality and delivery metrics.
3. **Govern:** policy engine, risk classification and approval gates.
4. **Optimize:** model routing, workflow evaluation and continuous improvement.

Only scale autonomy after gates, observability, recovery and economics are demonstrated.

See [AI Governance Policy](../governance/ai-governance-policy.md), [Approval Matrix](../governance/approval-matrix.md), [Metrics Definition](../governance/metrics-definition.md) and [Autonomy Model](../reference/autonomy-model.md).

## 11. Practical exercise

Five microservice teams use different AI tools. Agents can create PRs but not merge. There is no central audit and no cost-per-accepted-change metric.

Propose a 90-day governance rollout:
- what belongs in the Governance repository;
- what stays in each domain/service repository;
- how policy versions are distributed/enforced;
- what audit record is mandatory;
- which baseline metrics are collected;
- what must be true before increasing autonomy.

**Next:** [Lesson 12 — End-to-End Implementation](12-end-to-end-implementation.md).

## Knowledge check — 10 questions

1. Why is governance more than CLAUDE.md?  
   A. CLAUDE.md is obsolete. B. Governance assigns accountability and enforces policies across tools, data, services and environments. C. It only concerns model cost. D. It is a prompt template.

2. Where should organization-wide AI/security policy live?  
   A. Random service repository. B. Dedicated Governance source of truth with versioned distribution. C. Agent conversation. D. Production database.

3. Where should Subscription downgrade business rules live?  
   A. Global model routing policy. B. Subscription Domain artifacts. C. Frontend CSS. D. Agent runtime logs.

4. What enforces “no production DB access” reliably?  
   A. A prompt instruction. B. Markdown only. C. IAM, scoped credentials, network/sandbox and runtime tool permissions. D. Agent confidence.

5. What is the correct model routing principle?  
   A. Always use the most expensive model. B. Select profile based on task complexity, risk and measured performance. C. Use one model for every stage. D. Let agent choose without budget.

6. What is Cost per Accepted Change?  
   A. Tokens per prompt. B. Full relevant AI, engineering, CI, infrastructure and rework cost divided by accepted changes. C. Number of agents per PR. D. Cloud spend only.

7. Why is 90% autonomous execution not enough to claim L4?  
   A. L4 forbids automation. B. Reliability, verification, permissions, recovery and economics also matter. C. It needs more tokens. D. It requires a different vendor.

8. Which statement about a different model for verification is correct?  
   A. It guarantees independence. B. It may reduce correlated error but does not replace separate context and evidence. C. It makes tests unnecessary. D. It grants approval.

9. What should be stored in a service repository?  
   A. Every organization audit log. B. Local rules, service ADRs, contracts, runbooks and service evidence. C. Global secrets. D. Every team's model bill.

10. Which sequence is a sensible governance adoption path?  
    A. Optimize before measuring. B. Standardize → Measure → Govern → Optimize. C. Give agents production access first. D. Create 50 agents.

### Answer key and explanations

1. **B** — Governance is organizational and technical, not a single instruction file.  
2. **B** — Global policy needs ownership, review, versioning and controlled distribution.  
3. **B** — Domain policy belongs with the product/domain owner.  
4. **C** — Enforcement must be outside natural-language prompts.  
5. **B** — Model selection balances capability, risk, cost and observed quality.  
6. **B** — The metric includes the full cost of an accepted outcome.  
7. **B** — Autonomy without quality and recovery is unsafe automation.  
8. **B** — Model diversity helps but does not prove independent verification.  
9. **B** — Service-specific context and evidence belong near the service.  
10. **B** — Standardize and measure before scaling governance and optimization.
