# Lesson 03 — Product & System Discovery

**Outcome:** Build an evidence-backed model of an existing product before specifying or changing it.

## 1. Why brownfield discovery is a safety control

The Business Intent says what the business wants. It does not tell us how the current product works.

A request such as “implement self-service subscription management” may appear to require a new endpoint. But the existing product may have:
- subscription state in one service and billing state in another;
- an external payment provider as authority for payment outcome;
- asynchronous webhooks that can arrive more than once or out of order;
- legacy plans with special pricing;
- entitlements updated by a separate service;
- a scheduled billing job that races with user actions;
- a failed-payment workflow not visible from the main API path.

A plausible-looking implementation can still violate the real system. Discovery therefore aims to reconstruct the product from evidence, not to invent a target architecture.

## 2. Six discovery streams

| Stream | Inspect | Output |
|---|---|---|
| Repository | Repositories, modules, languages, entry points, build/test commands | Repository map |
| Architecture | Services, databases, APIs, events, dependencies | System context and integration map |
| Domain | Entities, ownership, lifecycle, rules, invariants | Domain model |
| Behavior | Real execution paths, side effects, retries, edge cases | Behavior traces |
| Operations | CI/CD, feature flags, logs, traces, alerts, incidents | Operational model |
| Impact | Components, data, teams and consumers affected by the request | Impact analysis |

These streams may be investigated incrementally. For a financial domain, Domain Discovery is mandatory: a list of database tables is not a business model.

## 3. Evidence discipline

Every important statement must be classified:

- **Observed:** directly supported by code, tests, schema, contract or reliable operational evidence.
- **Inferred:** a reasoned interpretation based on several observations.
- **Assumed:** accepted temporarily for the fictional training model.
- **Unknown:** not yet established.
- **Decision:** an authorized choice made by a named owner.

An evidence record should include:
- claim and unique finding ID;
- source location (file and symbol, API contract, schema, test, log or interview);
- evidence type;
- confidence;
- impact if wrong;
- next validation action;
- reviewer or owner.

Example wording:

> The payment provider appears to be authoritative for external payment outcome. Evidence: the webhook handler updates the local payment record and the integration test consumes provider event identifiers. Confidence: high for payment outcome, not necessarily for subscription lifecycle.

Do not write “the provider is the source of truth for everything”. Ownership is per domain concept.

## 4. Domain model versus system context

| Artifact | Core question | Focus |
|---|---|---|
| System Context | How is the product technically composed? | Services, APIs, data stores, integrations, deployment and operations |
| Domain Model | What business concepts exist and what rules govern them? | Entities, relationships, lifecycle, events, invariants |
| Impact Analysis | What may be affected by this initiative? | Components, contracts, data, teams, risks and tests |

The Domain Model is created during Product & System Discovery. It is not generated from Business Intent alone. Inputs include product documentation, existing code, database and event schemas, API contracts, tests and domain experts. Conflicts between sources must be recorded, not silently resolved by the agent.

## 5. Discovery workflow in Claude Code

Start with one read-only Discovery Agent or a carefully bounded main session. Add specialized subagents only when repository size or context isolation justifies them.

1. Read the approved [Business Intent](../case-study/01-intent/business-intent.md).
2. Read repository instructions and identify repository boundaries.
3. Map entry points, modules and service ownership.
4. Trace the current subscription read and change paths.
5. Inspect schemas, migrations, API contracts, events and webhooks.
6. Trace payment, invoice, promotion and entitlement side effects.
7. Inspect tests, CI, feature flags and operational recovery.
8. Build System Context, Domain Model and Impact Analysis.
9. Record evidence, confidence, contradictions and open questions.
10. Ask domain owners to confirm business meaning.
11. Obtain independent review before Discovery is marked approved.

### Read-only does not mean risk-free

The agent should not edit source, create migrations, deploy or mutate production. But running build scripts or tests may execute arbitrary code. Use an isolated workspace, limited credentials, network restrictions and approved commands. Do not rely on a prompt alone to make a command safe.

## 6. The synthetic system landscape

For this academy, the fictional product contains these logical components:

| Component | Responsibility | Candidate ownership |
|---|---|---|
| Web Frontend | Display, preview, confirmation | Presentation only |
| Identity & Access | Authentication, account membership and roles | Identity service |
| Subscription API | Authenticated use-case boundary | Delegates domain state |
| Subscription Service | Lifecycle and scheduled changes | Subscription store |
| Billing Service | Quotes, invoices and billing schedule | Billing ledger / contract |
| Payment Adapter | Provider requests and normalized events | Provider for external payment outcome |
| Promotion Service | Discount eligibility | Promotion rules |
| Entitlement Service | Effective access and quotas | Entitlement store |
| Notification Service | Confirmation and reminders | Delivery provider |
| Analytics / Support Analytics | Funnel and outcome measures | Analytics systems |

This is an **illustrative training baseline**, not a claim about a real company's architecture. See [system-context.md](../case-study/02-discovery/system-context.md).

## 7. Domain discovery example

The central entities include Account, User, Subscription, Plan, Billing Cycle, Payment, Invoice, Discount, Scheduled Change, Entitlement and Audit Event.

Important distinctions:
- requested plan is not necessarily the effective plan;
- payment authorized is not necessarily payment settled;
- cancel renewal is not immediate access revocation;
- a scheduled downgrade does not change current entitlements;
- a successful payment does not prove that entitlements were updated;
- a code path that currently permits an action does not prove the action is a valid business rule.

See [domain-model.md](../case-study/02-discovery/domain-model.md). Its lifecycle and invariants should be read together with [business-rules.md](../case-study/03-specification/business-rules.md).

## 8. Impact analysis

A discovery output should map likely change impact, not merely list services.

| Area | Potential impact | Risk | Evidence to collect |
|---|---|---|---|
| Identity & Access | Admin and Billing Owner checks | Critical | Role model, tenant boundary tests |
| Subscription | State transitions, scheduled changes | Critical | Lifecycle code, persistence, scheduler |
| Billing | Quote, invoice, charge timing | Critical | Billing contracts, rounding and tax rules |
| Payment Adapter | Idempotency, webhook processing | Critical | Provider API, event signatures and retry |
| Entitlements | Access changes and reconciliation | Critical | Event consumers, consistency jobs |
| Promotion | Discount compatibility | High | Promotion policy and test cases |
| Frontend | Preview and confirmation | Medium | UI flow, accessibility and stale preview |
| Analytics / Support | Outcome attribution | Medium | Event taxonomy and baseline data |

The completed training matrix is [impact-analysis.md](../case-study/02-discovery/impact-analysis.md).

## 9. Discovery Skill and output

The [Discovery Skill](../skills/discovery/SKILL.md) enforces read-only exploration, evidence references and explicit unknowns. The outputs are:

- [System Context](../case-study/02-discovery/system-context.md)
- [Domain Model](../case-study/02-discovery/domain-model.md)
- [Impact Analysis](../case-study/02-discovery/impact-analysis.md)

Discovery is ready for Specification only when critical ownership, contracts, state transitions, failure paths and operational constraints are understood or explicitly escalated.

## 10. Practical exercise

Choose one operation (upgrade, downgrade or cancel). Write a discovery trace with:
1. entry point;
2. authorization check;
3. domain service;
4. data owner;
5. external call or event;
6. side effects;
7. failure/retry path;
8. evidence for every claim;
9. unknowns and owner questions.

Do not propose implementation changes until the evidence map is reviewed.

**Next:** [Lesson 04 — Specification Engineering](04-specification-engineering.md).

## Knowledge check — 10 questions

1. What is the primary purpose of Discovery?  
   A. Find files to edit. B. Build an evidence-backed model of the existing product and constraints. C. Replace the architecture. D. Generate an implementation plan immediately.

2. Which source is strongest evidence for a service's actual behavior?  
   A. Class name alone. B. Agent intuition. C. Traced execution path supported by code and tests. D. A guessed diagram.

3. What should the agent do when code and product documentation disagree?  
   A. Trust code automatically. B. Trust documentation automatically. C. Record the contradiction, evidence and owner decision needed. D. Pick the simpler behavior.

4. When is Domain Model created?  
   A. Only after production release. B. During Domain Discovery, using business, code, schema, contract and expert inputs. C. By copying database tables. D. From the prompt alone.

5. Which statement belongs in System Context?  
   A. “Cancel stops renewal but preserves paid access.” B. “The Subscription API delegates lifecycle commands to Subscription Service.” C. “Discount is valid for annual plans.” D. “A customer wants lower pricing.”

6. Why is read-only discovery still sandboxed?  
   A. Reading files is impossible. B. Build/test scripts can execute code and data may be sensitive. C. Discovery always requires production writes. D. Sandboxing is only for deployment.

7. Which item is an invariant?  
   A. The repository has 12 folders. B. A duplicate webhook must not duplicate a business effect. C. The team prefers dark mode. D. The service uses a class named Plan.

8. What is the best evidence record?  
   A. “Claude thinks it is true.” B. Claim, source location, evidence type, confidence, impact and validation action. C. A screenshot without context. D. A generated architecture diagram only.

9. What is the difference between a source of truth and a data copy?  
   A. They are identical. B. Source of truth owns authoritative decisions for a specific concept; copies may be projections. C. A copy is always more current. D. A source of truth must be one database for all domains.

10. What must happen before Discovery is approved?  
    A. The agent has read every file. B. All assumptions are treated as facts. C. Critical findings and contradictions have evidence and independent/domain review. D. Implementation code has been merged.

### Answer key and explanations

1. **B** — Discovery reduces the risk of acting on a false model.  
2. **C** — Names suggest intent; traced behavior provides evidence.  
3. **C** — Neither source automatically resolves business correctness.  
4. **B** — Domain knowledge is synthesized and reviewed during discovery.  
5. **B** — It describes technical component interaction.  
6. **B** — Read-only permissions do not neutralize executable tooling or sensitive data exposure.  
7. **B** — It must remain true across retries and delivery paths.  
8. **B** — Findings must be independently reproducible and qualified.  
9. **B** — Ownership is concept-specific; projections can lag.  
10. **C** — Approval depends on evidence and resolved or explicitly escalated risk.
