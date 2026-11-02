# Lesson 02 — Intent Engineering

**Outcome:** Convert an ambiguous business request into a reviewed, versioned Business Intent that can safely authorize Discovery.

## 1. Why prompt engineering is not enough

Start with the exact request from our case:

> Add self-service subscription management.

A coding agent could immediately search for a SubscriptionService and propose endpoints. But the request leaves unanswered questions with financial and contractual consequences:

- Does “subscription management” mean upgrade only, or also downgrade, billing-cycle change, cancel, pause, resume and reactivate?
- Who is allowed to initiate each operation?
- When does the change take effect?
- Can it trigger an immediate charge?
- What happens to discounts?
- What happens when usage exceeds the target plan's limits?
- Which subscriptions are excluded?
- How will we know whether Support workload improved?

Intent Engineering makes these decisions visible before code is changed. It is not merely filling a template: it is a structured process of analysis, clarification, option assessment, decision ownership and approval.

## 2. Business Intent is a decision artifact

The academy's Business Intent has 13 sections:

1. Business Context
2. Problem Statement
3. Target Users
4. Desired Outcomes
5. Success Metrics
6. Scope
7. Constraints
8. Assumptions
9. Risks
10. Open Questions
11. Alternatives Considered
12. Decision
13. Approval

Each section answers a different question. Do not collapse facts, hypotheses and decisions into one paragraph.

### Facts, assumptions, hypotheses and decisions

| Type | Meaning | Example |
|---|---|---|
| Fact | Supported by evidence | Support analytics show a defined number of subscription-change contacts |
| Assumption | Accepted temporarily, awaiting validation | The current billing platform can produce an authoritative preview |
| Hypothesis | A prediction to test | Self-service will reduce avoidable Support contacts |
| Decision | An authorized choice | Downgrades take effect next billing cycle |

An AI agent may identify assumptions and propose options. It must not silently promote an assumption into an approved business rule.

## 3. Review the initial request

The initial request is directionally useful but not implementation-ready. A good Intent Reviewer identifies ambiguity, impact and questions rather than writing code.

| Phrase | Ambiguity | Why it matters |
|---|---|---|
| “Users” | End users, account admins, owners, B2B or B2C? | Authorization and account ownership |
| “Manage” | Which operations? | Scope and state transitions |
| “Change plan” | Which plans and eligibility rules? | Pricing and contract behavior |
| “Reduce Support” | Which contact categories, baseline and period? | Measurement and attribution |
| “Improve experience” | Which observable user outcome? | Avoid vanity success |
| “Preserve billing” | What must remain invariant? | Payment and data integrity |

A reduction in Support contacts alone can be misleading. Customers may stop asking for help because the option is hidden or confusing. Pair Support volume with successful self-service completion, billing complaints, refunds and churn.

## 4. Clarification rounds from the original case

The initial Intent Reviewer returned **CLARIFY** and asked about scope, timing, actors, discounts, metrics and exclusions.

The learner then made these first-round choices:

- Scope: all subscription changes.
- Timing: depends on operation.
- Actor: Admin.
- Discounts: preserve where possible.
- Baseline: approximate.

These answers narrowed the problem but still left material ambiguity. “All changes” needed an explicit list; “Admin” did not settle who could authorize an immediate charge; “preserve where possible” needed a policy owner and visible behavior when a discount could not transfer.

For this fictional training case, the Product Owner then made explicit decisions so the course could progress. These are **synthetic product decisions**, not universal subscription rules.

## 5. Approved training decisions

### 5.1 Scope and effective timing

| Operation | Training decision | Effective behavior |
|---|---|---|
| Upgrade | Allowed for eligible self-service subscriptions | Immediately after required approval and successful payment |
| Downgrade | Allowed if target limits are satisfied | Next billing cycle |
| Monthly ↔ annual | Allowed | Next billing cycle |
| Cancel | Cancel renewal, not immediate access | Access remains through paid-through date |
| Pause | 1–3 months on eligible plans | At an explicitly disclosed effective time |
| Resume | Allowed on eligible paused subscriptions | Show next charge and date before confirmation |
| Reactivate | Allowed when the plan remains eligible | Show price and require confirmation |

The phrase “all changes” is therefore replaced with this explicit list. An implementation agent must not add other operations because they seem related.

### 5.2 Roles and financial authority

- **Admin** can initiate permitted subscription-management actions.
- **Billing Owner** controls payment methods and approves operations with immediate financial consequences.
- If Admin is not Billing Owner, an immediate-charge upgrade requires Billing Owner approval before capture.
- Authorization is account-scoped and enforced server-side. Hiding a button in the frontend is not authorization.

### 5.3 Downgrade limits

If current usage exceeds the target plan's limits:
1. show which limits are exceeded;
2. explain what the customer must change;
3. block confirmation until usage is eligible;
4. never delete customer data automatically.

### 5.4 Discount policy

- Retain discounts only when the Promotion policy confirms they remain compatible and valid.
- Do not transfer plan-specific or negotiated discounts automatically.
- If a discount will be lost, disclose the resulting price before confirmation.
- Enterprise negotiated pricing and bespoke legacy terms are excluded from self-service.

### 5.5 Eligibility exclusions

Self-service is unavailable for enterprise negotiated contracts, bespoke legacy plans, active billing disputes, overdue balances until resolved, and cases requiring manual commercial negotiation.

### 5.6 Success and guardrail metrics

Training targets:

| Metric | Target | Interpretation |
|---|---:|---|
| Subscription-management Support contacts | −30% within 3 months | Primary outcome; validate baseline and normalize |
| Self-service completion | ≥85% | Completed eligible flows / eligible started flows |
| Successful operations without Support | ≥90% | Successful eligible operations not escalated |
| Median completion time | ≤3 minutes | From flow start to confirmed outcome |
| Billing complaints | No material increase | Guardrail |
| Refund rate and churn | No material increase | Guardrails |

These are hypotheses for a fictional product. Do not present them as measured results.

## 6. GO, CLARIFY and STOP

| Decision | Meaning | Example |
|---|---|---|
| GO | Sufficiently clear for the next named stage | GO for Discovery |
| CLARIFY | A material question remains | Billing Owner authority is undefined |
| STOP | The idea should not proceed in its current form | No evidence of value and high irreversible risk |

Approval is stage-specific. Business Intent v1.0 is approved **for Discovery only**. It does not authorize implementation, merge, payment activity or production release.

## 7. Build and review the artifact

Open [business-intent.md](../case-study/01-intent/business-intent.md) and [decision-log.md](../case-study/01-intent/decision-log.md).

The reusable [intent-analysis Skill](../skills/intent-analysis/SKILL.md) follows this process:

1. Parse the request and identify stakeholders.
2. Define the problem and evidence.
3. Identify target users and outcomes.
4. Define metrics, baseline source and measurement window.
5. Define scope and exclusions.
6. Record assumptions with confidence and validation.
7. Identify risks and mitigations.
8. List open questions and decision owners.
9. Consider alternatives, including no-build.
10. Produce a draft and perform completeness review.
11. Return GO, CLARIFY or STOP.

The agent drafts; the authorized Product Owner approves. Keep the decision and approval record in version control.

## 8. Definition of Ready for Discovery

- [ ] Problem and target users are explicit.
- [ ] Desired outcomes are measurable or have a measurement plan.
- [ ] Scope and exclusions are explicit.
- [ ] Critical constraints and risks are recorded.
- [ ] Facts are separated from assumptions and hypotheses.
- [ ] Critical open questions have owners or are explicitly accepted as discovery questions.
- [ ] Decision is GO for Discovery, not implementation.
- [ ] Approval is attributable and versioned.

## 9. Practical exercise

Imagine the Product Owner changes the request to “allow all account users to change plans instantly”. As Intent Reviewer:
1. Identify at least five risks.
2. Explain which questions block Discovery and which can be investigated during Discovery.
3. Offer safer alternatives.
4. Return a reasoned GO, CLARIFY or STOP.
5. Update the decision log only after an authorized decision.

**Next:** [Lesson 03 — Product & System Discovery](03-product-system-discovery.md).

## Knowledge check — 10 questions

1. What is the primary purpose of Intent Engineering?  
   A. Generate code faster. B. Turn business intent into a structured, decision-ready artifact. C. Choose a database. D. Create CI pipelines.

2. What should the agent do with an unverified assumption?  
   A. Treat it as a fact. B. Hide it in implementation notes. C. Record confidence, impact and validation needed. D. Delete it.

3. Why is “reduce Support tickets” insufficient as the only success metric?  
   A. Support metrics cannot be measured. B. Tickets may fall while customer failure, refunds or churn increase. C. It is a technical metric. D. It measures deployment frequency.

4. What does GO in Business Intent v1.0 authorize?  
   A. Production release. B. Code implementation. C. Product & System Discovery only. D. Financial operations.

5. Who approves business rules in this case?  
   A. Implementation Agent. B. Product Owner / authorized business decision owner. C. CI pipeline. D. Security Reviewer alone.

6. If Admin is not Billing Owner and an upgrade charges immediately, what is required?  
   A. No further approval. B. Billing Owner approval before capture. C. A frontend warning only. D. A retry.

7. What happens if downgrade usage exceeds target-plan limits?  
   A. Delete excess data automatically. B. Allow downgrade and silently suspend features. C. Explain the excess and block until eligible. D. Ignore limits.

8. How should an incompatible discount be handled?  
   A. Transfer it anyway. B. Silently remove it. C. Disclose resulting price before confirmation and follow policy. D. Ask the coding agent to decide.

9. Which is a hypothesis rather than a fact?  
   A. “The analytics export contains 400 tagged contacts.” B. “Self-service may reduce avoidable Support contacts.” C. “The Product Owner approved v1.0.” D. “The document lists seven operations.”

10. When should the Intent Reviewer return STOP?  
    A. Whenever the request is difficult. B. When the idea should not proceed in its current form because value, feasibility or risk is unacceptable. C. When more than one stakeholder exists. D. When the agent has no code access.

### Answer key and explanations

1. **B** — Intent creates a durable decision contract before execution.  
2. **C** — Unknowns should remain visible and have a validation path.  
3. **B** — Guardrails prevent a misleading “success” signal.  
4. **C** — Approval is explicitly limited to the next stage.  
5. **B** — Business accountability remains with an authorized human.  
6. **B** — Financial authority is distinct from general Admin access.  
7. **C** — The rule protects customer data and prevents silent destructive behavior.  
8. **C** — Price changes must be transparent and policy-driven.  
9. **B** — It is a prediction to validate, not an observed result.  
10. **B** — STOP is a legitimate business outcome, not a technical failure.
