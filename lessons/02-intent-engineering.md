# Lesson 02 — Intent Engineering

[Course home](../README.md) · [← Previous lesson](../lessons/01-ai-sdlc-fundamentals.md) · Lesson 02 of 12

## Why this lesson matters

A request such as “add self-service subscription management” is not a safe implementation instruction. It lacks actors, scope, business rules, measurable outcomes and constraints.

## Learning outcomes

- Explain the role of this stage in the end-to-end AI-native SDLC.
- Identify inputs, outputs, decision owners and exit criteria.
- Apply the principles to the Subscription Management case study.
- Recognize when an agent must stop, request clarification or provide evidence.

## Core concepts

Business Intent captures context, problem/evidence, users, desired outcomes, success metrics and baseline, scope/exclusions, constraints, assumptions, risks, open questions, alternatives, decision and approval owner. Separate facts, assumptions and hypotheses. Logical roles: Business Analyst, Product Strategist, Risk Analyst and Intent Reviewer. Decision outcomes: GO, CLARIFY or STOP.

## How to apply it

Training Product Owner decisions: all major subscription operations in scope; Admin manages settings; Billing Owner approves immediate financial consequences; upgrade is immediate after successful payment; downgrade and billing-cycle change take effect next cycle; cancel stops renewal but preserves paid access; pause is 1–3 months where eligible; compatible discounts are preserved; incompatible discounts are disclosed; no automatic data deletion.

## Practical exercise

Review the completed Business Intent and decision log. Identify which assumptions require real product validation. Explain why GO authorizes Discovery only, not implementation.

## Completed case-study artifacts

- [business-intent.md](../case-study/01-intent/business-intent.md)
- [decision-log.md](../case-study/01-intent/decision-log.md)
- [SKILL.md](../skills/intent-analysis/SKILL.md)

## Knowledge check — 10 questions

1. What best describes the purpose of this stage?
   - A. Create a traceable and controlled part of the delivery lifecycle
   - B. Generate code without context
   - C. Remove all human ownership
   - D. Optimize prompt length

2. Which input should be treated as authoritative?
   - A. An undocumented chat assumption
   - B. The approved, versioned upstream artifacts
   - C. The implementation agent summary
   - D. A model confidence score

3. What should happen when a critical decision is missing?
   - A. Guess and continue
   - B. Hide the uncertainty
   - C. Stop the dependent action and request clarification
   - D. Delete the requirement

4. What is the strongest completion evidence?
   - A. Agent says done
   - B. A large code diff
   - C. A high model score
   - D. Independent evidence tied to acceptance criteria

5. What enables bounded autonomy?
   - A. Explicit scope, permissions, gates and recovery
   - B. Unrestricted administrator access
   - C. A long system prompt only
   - D. Skipping audit

6. What should a reliable handoff include?
   - A. Only a status emoji
   - B. Inputs, decisions, state, outputs and evidence
   - C. Only the model name
   - D. Only a verbal summary

7. Which condition should block progression?
   - A. A short file name
   - B. A nonessential heading style
   - C. A failed mandatory invariant or approval gate
   - D. A completed task

8. How should metrics be interpreted?
   - A. Without a baseline
   - B. As proof of causation
   - C. As a substitute for ownership
   - D. With definitions, baseline, sample and context

9. Who owns consequential business decisions?
   - A. The accountable human decision owner
   - B. The coding agent
   - C. The test runner
   - D. The cheapest model

10. What should the practical output demonstrate?
   - A. Only tool usage
   - B. A completed artifact with reviewable evidence
   - C. A production change without approval
   - D. Unrestricted autonomy

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **A** — This stage exists to produce a controlled, traceable delivery outcome.
2. **B** — Approved artifacts are the source of truth.
3. **C** — Critical uncertainty must be escalated, not concealed.
4. **D** — Evidence must demonstrate the expected behavior.
5. **A** — Autonomy is safe only within enforced boundaries.
6. **B** — Handoffs need enough context to continue safely.
7. **C** — Mandatory controls cannot be bypassed.
8. **D** — Metrics require sound definitions and interpretation.
9. **A** — Agents may advise, but accountable owners decide.
10. **B** — The course emphasizes verifiable artifacts, not tool demonstrations.

</details>

## Completion criteria

- [ ] I can explain the stage and its boundaries.
- [ ] I inspected the linked source artifacts.
- [ ] I completed the practical exercise.
- [ ] I answered the knowledge check and reviewed explanations.
- [ ] I know which decisions require a human owner.

[Next lesson →](../lessons/03-product-system-discovery.md)