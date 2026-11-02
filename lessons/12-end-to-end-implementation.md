# Lesson 12 — End-to-End Implementation

**Outcome:** Assemble the complete AI-native SDLC into one operational blueprint and walk the Subscription Management case from intake to measured outcome.

## 1. The system we are building

The final product is not a chatbot that writes code. It is a controlled workflow platform that can:
- receive business requests;
- validate intent;
- discover brownfield systems;
- create specifications and architecture;
- decompose and schedule work;
- execute bounded agent tasks;
- independently verify changes;
- control release and production operations;
- measure business outcomes.

## 2. Four logical layers

### A. Business and Product
Business Intent, product requirements, domain model, business rules, specifications and ADRs. Human owners remain accountable for product and architecture decisions.

### B. AI Orchestration Platform
- Orchestrator: workflow progression and dependency handling.
- Policy Engine: risk, permissions and approval rules.
- State Store: durable project and task state.
- Model Gateway: model profile, budget and fallback.
- Audit & Evidence Store: execution records, decisions, approvals and evidence.

### C. Agent Execution
Intent Analyst, Discovery Agent, Domain Analyst, Specification Agent/Reviewer, Architect, Planner, Implementation Agents, QE/Verification Agent, Security Reviewer, Integration Agent, Release Agent and Operations Agent.

### D. Engineering and Production Systems
Microservices, Git repositories, CI/CD, test environments, cloud infrastructure, monitoring, issue tracker and product analytics. Agents reach them only through controlled tools and scoped permissions.

## 3. How governance becomes an execution permission profile

For a work package such as WP-05 Immediate Upgrade, the orchestrator should not merely send “implement upgrade” to an agent.

It constructs an execution contract:

```yaml
execution:
  workflow_id: subscription-training-001
  task_id: WP-05
  agent_role: implementation
  autonomy_level: L4

context:
  business_intent_version: 1.0
  requirements_version: 1.0
  business_rules_version: 1.0
  adr_versions:
    - ADR-001: accepted-training-version

scope:
  repositories:
    - subscription-service
  allowed_paths:
    - src/subscriptions/upgrade/**
    - tests/subscriptions/upgrade/**

permissions:
  source:
    read: true
    write: assigned_paths_only
  git:
    branch: true
    commit: true
    create_pr: true
    merge: false
  database:
    test: allowed
    production: denied
  deployment:
    production: denied

verification:
  required:
    - unit_tests
    - integration_tests
    - security_review
    - independent_acceptance_verification

approval:
  merge: human
  production_release: human
```

This is a training contract, not a ready-to-run SDK configuration. The policy engine evaluates the work package, assigns a profile, and the runtime enforces it. An attempt to access production DB must be blocked by tools/IAM/sandbox even if the agent asks for it.

Execution lifecycle:
1. Orchestrator validates work package status and dependencies.
2. Policy Engine classifies action risk.
3. Permission profile is created from approved policy.
4. Agent Runtime starts with bounded context and tools.
5. Critical actions pass enforcement checks.
6. Independent verification inspects requirements and evidence.
7. Human approval is collected where required.
8. Orchestrator updates durable state and audit.

## 4. Full workflow state machine

`REQUESTED → INTENT_REVIEW → DISCOVERY → SPECIFICATION → SPEC_REVIEW → PRODUCT_APPROVAL → ARCHITECTURE → PLAN_APPROVAL → EXECUTION → INTEGRATION → INDEPENDENT_VERIFICATION → VERIFIED → RELEASE_APPROVAL → CANARY → OBSERVATION → OUTCOME_MEASUREMENT → COMPLETE`

Additional states: CLARIFY, BLOCKED, REJECTED, NEEDS_FIX, APPROVAL_PENDING, INCIDENT, ROLLBACK_REQUIRED and CANCELLED.

Important distinctions:
- GO for Discovery is not GO for implementation.
- IMPLEMENTED is not VERIFIED.
- VERIFIED is not APPROVED.
- DEPLOYED is not COMPLETE.
- RELEASE_COMPLETE does not mean long-term business targets are achieved.

## 5. Roles and accountability

| Role | Responsibility |
|---|---|
| Product Owner | Business intent, scope, rules and outcome |
| Engineering Owner | Architecture, technical risks and delivery |
| Security Owner | Security policy, access and exceptions |
| Orchestrator | State, dependencies, permissions and workflow |
| Implementation Agent | Bounded code change |
| Verification Agent | Independent evidence and findings |
| Release Approver | Production release decision |
| Operations/Incident Owner | Production response and recovery |

One person may hold several human roles in a small organization, but accountability must remain explicit.

## 6. Where artifacts live in a microservices architecture

Use centralized policy ownership and distributed service responsibility:

```text
organization/
  engineering-governance/
    policies/
    standards/
    templates/
    ownership/

  subscription-domain/
    business-intent.md
    domain-model.md
    business-rules.md
    specifications/
    architecture/adr/

  subscription-service/
    CLAUDE.md
    .claude/
    src/
    tests/
    contracts/
    docs/

  billing-service/
    CLAUDE.md
    .claude/
    src/
    tests/
    contracts/

  ai-sdlc-platform/
    orchestrator/
    policy-engine/
    model-gateway/
    workflow-state/
    audit/
```

Do not confuse storage types:
- Git: versioned policies, requirements, ADRs and configuration.
- Workflow DB: current task state, dependencies, retries and locks.
- Object/evidence storage: large reports, test outputs and artifacts.
- Immutable audit storage: actions, policy decisions and approvals.
- Observability: technical and business metrics.

A central Governance repository is not a reason to move every service-specific rule into it. See [Governance Policy](../governance/ai-governance-policy.md) and [Target Architecture](../reference/target-architecture.md).

## 7. Capstone: build the first vertical slice

Do not start by building a platform with 15 agents. Start with a thin, end-to-end slice.

### Stage 1 — Foundation
Prepare versioned governance, permission profiles, CLAUDE.md, a few Skills, CI gates and audit schema.

### Stage 2 — Domain foundation
Validate service ownership, sources of truth, Domain Model, invariants and contracts.

### Stage 3 — First slice: Upgrade
Implement one controlled path: frontend → API → authorization → quote → approval → payment → subscription transition → entitlement → audit.

Use test environments and provider sandbox only. No real customer data or payments.

### Stage 4 — Independent verification
Test authorization, idempotency, declined payment, timeout, duplicate webhook, concurrency, entitlement outage, discounts and audit.

### Stage 5 — Controlled release
Feature flag, internal cohort, canary, automatic halt for approved invariants and human approval for production.

### Stage 6 — Measure outcome
Establish baseline and measure self-service completion, Support contacts, complaints, refunds and churn.

### Stage 7 — Scale
Only after the first slice is reliable, add downgrade, billing-cycle change, cancellation, pause/resume and reactivation.

## 8. Definition of Done for the blueprint

- [ ] Intent and outcome are approved.
- [ ] Discovery findings have evidence.
- [ ] Domain Model and invariants are reviewed.
- [ ] Requirements trace to ACs and tests.
- [ ] Critical ADRs are accepted.
- [ ] Work packages have boundaries and dependencies.
- [ ] Orchestrator has durable state and recovery.
- [ ] Permissions are technically enforced.
- [ ] Independent verification is implemented.
- [ ] Quality/security gates are mandatory.
- [ ] Release approvals and recovery are explicit.
- [ ] Audit reconstructs actions and decisions.
- [ ] Metrics have baseline and definitions.

## 9. Final practical assignment

Create a one-page architecture decision for how you would pilot this workflow in a real brownfield product:
1. Which repository/service would be the pilot?
2. Which work class is low enough risk for bounded autonomy?
3. Which actions remain human-approved?
4. What minimum artifacts and permissions are required?
5. How will you prove the system is reliable and economically useful?
6. What is the rollback/stop plan for the pilot itself?

The goal is not to claim L4 everywhere. The goal is to choose a narrow workflow, demonstrate safe accepted outcomes and expand based on evidence.

## Knowledge check — 10 questions

1. What is the main difference between an AI coding assistant and an AI-native SDLC platform?  
   A. It uses more tokens. B. It coordinates a governed, verifiable end-to-end delivery workflow. C. It has a chat UI. D. It writes more code.

2. Who creates the permission profile for a work package?  
   A. Implementation Agent. B. Orchestrator/policy layer based on approved governance. C. Frontend. D. Customer Support.

3. What blocks an agent from accessing production DB?  
   A. Prompt only. B. Permission profile enforced by runtime/IAM/sandbox. C. Agent promise. D. Code comment.

4. What does VERIFIED mean?  
   A. Author says code is done. B. Independent required checks/evidence passed. C. Product Owner approved business scope. D. Deployed.

5. What does COMPLETE mean in the full workflow?  
   A. PR created. B. Production deployment done. C. Release and outcome evaluation completed according to the workflow. D. Agent stopped.

6. Where should global AI/security policies live?  
   A. Each service copies its own version. B. Versioned Governance source of truth with controlled distribution. C. Chat transcript. D. Customer database.

7. Why begin with one Upgrade vertical slice?  
   A. It avoids testing. B. It validates key cross-service controls and integration before scaling. C. It proves every future operation works. D. It eliminates human approvals.

8. Why is successful payment insufficient to declare Upgrade complete?  
   A. Payment is irrelevant. B. Subscription and entitlements must also reach consistent authoritative state. C. UI may look different. D. Support must approve each payment.

9. What is the best scale-up strategy?  
   A. Add agents to every service immediately. B. Prove one bounded workflow, measure quality/economics, then expand. C. Remove human approval. D. Store all logs in Git.

10. If technical metrics are healthy but Support contacts do not decrease, what is the correct assessment?  
    A. Business outcome is achieved. B. Deployment failed. C. Technical release may be healthy, but the intended business outcome is not yet demonstrated. D. Increase tokens.

### Answer key and explanations

1. **B** — The system manages intent, execution, verification, release and outcomes.  
2. **B** — Permissions are policy-derived, not self-granted by the agent.  
3. **B** — Runtime controls must enforce the restriction.  
4. **B** — Verification is based on independent evidence.  
5. **C** — The workflow includes post-release and outcome assessment.  
6. **B** — Global policy needs central ownership and versioning.  
7. **B** — A vertical slice tests the real integration chain.  
8. **B** — Payment, subscription and entitlement state are distinct.  
9. **B** — Scale follows evidence, not agent count.  
10. **C** — Healthy deployment and achieved business outcome are different claims.
