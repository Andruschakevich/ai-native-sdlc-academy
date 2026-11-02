# Lesson 08 — AI-Assisted Implementation

[Course home](../README.md) · [Previous: Lesson 07](07-agentic-workflows.md) · Lesson 08 of 12

## Purpose

Implementation is where an agent changes the codebase. The objective is not to maximize the amount of generated code; it is to produce a small, understandable change that satisfies an approved specification and can be verified.

## Learning outcomes

- Prepare a bounded implementation task.
- Ask an agent to plan before editing.
- Keep changes focused and reviewable.
- Validate assumptions and inspect the resulting diff.

## 1. Before implementation

Provide the agent with the approved specification, relevant repository instructions, architecture context, permitted scope, expected files or components where known, and required checks.

Ask it to:
1. Restate the task and constraints.
2. Identify ambiguity and dependencies.
3. Inspect existing patterns.
4. Propose an implementation plan.
5. List tests and risks.
6. Wait for approval if the task or policy requires it.

## 2. During implementation

Prefer small vertical slices. Avoid unrelated refactoring and dependency changes. Ask the agent to explain significant design choices and identify deviations from the spec. Keep the diff small enough for a human to understand.

## 3. After implementation

Inspect the complete diff, not only the agent's summary. Check whether the approved acceptance criteria are covered, whether tests are meaningful, whether generated files or dependencies are expected, and whether security and operational concerns were introduced.

The agent must report checks it actually ran. Never accept “all tests passed” without evidence.

## Practical walkthrough

Use the plan-upgrade sample spec. Ask an agent to prepare a file-level plan and test plan first. Review the plan, then allow a bounded implementation in a disposable branch or local sandbox. Do not connect the exercise to real payment services or production data.

## Artifacts

- [Sample plan-change specification](../examples/spec-templates/sample-plan-change-spec.md)
- [Example repository instructions](../examples/agent-skills/CLAUDE.md)
- [Feature delivery workflow](../examples/workflows/feature-delivery-workflow.md)
- [Prepare PR command](../examples/agent-skills/commands/prepare-pr.md)

## Knowledge check — 10 questions

1. What should be supplied before implementation?
   - A. Only a vague one-line request
   - B. Approved specification, context, scope, and constraints
   - C. Production credentials
   - D. An instruction to do anything necessary

2. Why ask for a plan before editing?
   - A. To expose assumptions, dependencies, and risks early
   - B. To guarantee the code is correct
   - C. To avoid reviewing the diff
   - D. To increase file count

3. What is a vertical slice?
   - A. A broad rewrite of every service
   - B. A small end-to-end piece of functionality
   - C. A code formatting change
   - D. A deployment-only task

4. Why keep the diff focused?
   - A. Smaller changes are easier to understand and verify
   - B. Large diffs are always more secure
   - C. It avoids all tests
   - D. It hides generated code

5. What should the agent do when it finds a missing business decision?
   - A. Make the decision
   - B. Flag it and stop where it affects implementation
   - C. Guess and document later
   - D. Ignore the specification

6. What should a reviewer inspect?
   - A. Only the agent's final message
   - B. The complete diff and verification evidence
   - C. Only the number of changed lines
   - D. Only commit titles

7. How should an agent report test results?
   - A. Claim success by default
   - B. List commands actually run and their outcomes
   - C. Omit failures
   - D. Report only tests it expects to pass

8. Why avoid unrelated refactoring in an AI-generated change?
   - A. It increases scope and makes review harder
   - B. It always improves quality
   - C. It is required for every feature
   - D. It replaces acceptance criteria

9. Which environment is appropriate for a learning exercise?
   - A. Production with real customer data
   - B. A local sandbox or disposable branch with synthetic data
   - C. A shared payment account
   - D. An unrestricted admin environment

10. What is the desired implementation outcome?
   - A. Maximum generated code
   - B. A focused, spec-aligned, verifiable change
   - C. A change that skips review
   - D. A large number of new dependencies

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — Clear inputs and boundaries make implementation safer.
2. **A** — Planning exposes issues before code changes accumulate.
3. **B** — A vertical slice delivers a small user-visible path end to end.
4. **A** — Focus improves reviewability and verification.
5. **B** — The agent must not invent domain policy.
6. **B** — Review requires both code and evidence.
7. **B** — Reports must be truthful and reproducible.
8. **A** — Unrelated changes expand risk and review cost.
9. **B** — Isolated environments limit unintended impact.
10. **B** — The goal is a verified outcome, not code volume.
</details>

**Next:** [Lesson 09 — Testing and Verification](09-ai-code-review.md)
