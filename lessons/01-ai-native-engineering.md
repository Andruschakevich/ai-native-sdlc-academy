# Lesson 01 — From AI-Assisted to AI-Native Engineering

[Course home](../README.md) · Lesson 01 of 12

## Why this lesson comes first

AI coding tools can accelerate individual tasks, but installing an assistant does not automatically improve the software delivery system. AI-native engineering means intentionally redesigning how people, agents, tools, and controls collaborate across the SDLC.

This academy documents the approach I have learned and currently apply in my engineering work. It is a practical training project, not a universal standard or a claim that every task should be autonomous.

## Learning outcomes
- Distinguish AI-assisted tasks from AI-native workflows.
- Explain the end-to-end delivery loop.
- Identify where agents can help and where human accountability remains essential.

## 1. AI-assisted versus AI-native

**AI-assisted:** a developer uses AI for an isolated task—explain code, draft a function, or generate tests—while the existing workflow remains mostly unchanged.

**AI-native:** the workflow is designed around people and bounded agents working through connected stages. Requirements are explicit, context is reusable, tasks have defined boundaries, output is verified, and humans own consequential decisions.

The distinction is not how much code AI writes. It is how intentionally the work is designed.

## 2. The delivery loop

1. Intent — understand the user or business problem.
2. Specification — define requirements and acceptance criteria.
3. Context — provide relevant product, architecture, repository, and quality information.
4. Plan — define steps, boundaries, and expected artifacts.
5. Execute — let an agent perform a bounded task.
6. Verify — run tests and deterministic checks; inspect evidence.
7. Decide — resolve uncertainty and authorize high-impact actions.
8. Learn — measure outcomes and improve the workflow.

The loop is iterative. A failed test may expose a missing requirement; a review finding may require a specification update.

## 3. Agent strengths and limitations

Agents can explore code, summarize information, draft specifications, generate code and tests, analyze diffs, and prepare documentation. They can also misunderstand business intent, miss implicit constraints, and confidently produce incorrect output.

Treat agent output as a proposal plus evidence, not as proof.

## 4. Human accountability

People remain accountable for product priorities, business rules, architecture trade-offs, security risk acceptance, production release decisions, and incident command. The approval model depends on organizational risk.

## Practical exercise

Choose one recurring engineering task. Write down its trigger, required context, possible agent actions, evidence of completion, and human decision points.

## Artifacts
- [Subscription Platform scenario](../examples/subscription-platform/README.md)
- [Agent contract template](../examples/agent-architecture/agent-contract.md)
- [Human approval policy](../examples/quality-gates/human-approval-policy.md)

## Knowledge check — 10 questions

1. What best distinguishes an AI-native workflow?
   - A. It uses the newest model
   - B. It redesigns connected work around bounded agents, context, and verification
   - C. It removes engineers
   - D. It generates more code
2. How should agent output be treated?
   - A. Automatically correct
   - B. A proposal requiring validation
   - C. A replacement for requirements
   - D. Production approval
3. Why provide context?
   - A. It guarantees correctness
   - B. It reduces ambiguity with relevant project information
   - C. It removes tests
   - D. It replaces domain experts
4. Which decision should remain human-accountable?
   - A. Drafting a test
   - B. Summarizing a diff
   - C. Accepting business risk and authorizing release
   - D. Searching files
5. What should an agent do when a business rule is unresolved?
   - A. Guess
   - B. Stop and ask the responsible person
   - C. Implement both options
   - D. Ignore it
6. Which sequence best represents the delivery loop?
   - A. Code, deploy, invent requirements
   - B. Intent, spec, context, plan, execute, verify, decide, learn
   - C. Prompt, merge, release
   - D. Generate tests after release
7. Does AI-native mean fully autonomous?
   - A. Yes
   - B. Only for small teams
   - C. No, autonomy is bounded by task risk and permissions
   - D. Yes, with a large model
8. Why can AI-generated tests mislead?
   - A. They cannot run
   - B. They may encode the same misunderstanding as implementation
   - C. They only test performance
   - D. They lack assertions
9. What is the purpose of the learning step?
   - A. Increase prompt count
   - B. Measure outcomes and improve the workflow
   - C. Remove review
   - D. Replace roadmap
10. What is the best starting point for adoption?
   - A. Buy every tool
   - B. Select a real recurring problem and design a bounded pilot
   - C. Automate production release first
   - D. Mandate identical AI usage

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — The workflow, not only an individual task, is redesigned.
2. **B** — Output needs verification against requirements and evidence.
3. **B** — Relevant context helps, but does not guarantee correctness.
4. **C** — Risk acceptance and release authorization require accountability.
5. **B** — Unknown business rules must be clarified, not invented.
6. **B** — This connects intent to verified outcomes.
7. **C** — Autonomy is bounded and risk-dependent.
8. **B** — Tests can repeat an incorrect assumption.
9. **B** — Measurement closes the improvement loop.
10. **B** — A narrow problem makes outcomes and risks observable.
</details>

**Next:** [Lesson 02 — Understanding the AI-Native SDLC](02-ai-assisted-vs-ai-native.md)
