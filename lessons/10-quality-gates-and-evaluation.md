# Lesson 10 — Code Review, Quality Gates, and Evaluation

[Course home](../README.md) · [Previous: Lesson 09](09-ai-code-review.md) · Lesson 10 of 12

## Purpose
A working demo does not prove an agent workflow is reliable. Teams need review practices, automated checks, and repeatable evaluations to understand whether changes are correct, safe, and useful.

## Learning outcomes
- Apply structured AI-assisted code review.
- Distinguish automated checks from model-based evaluation.
- Build a representative evaluation dataset.
- Define conditions that cannot be averaged away.

## 1. AI-assisted code review
An AI reviewer can inspect a diff for correctness risks, security issues, missing tests, reliability concerns, and maintainability. Findings should include severity, location, evidence, impact, and suggested verification. A human validates findings and owns the merge decision.

## 2. Three quality layers
1. **Deterministic checks:** tests, lint, type checks, static analysis, and policy checks.
2. **Model-based evaluation:** rubric scoring for completeness, correctness, instruction adherence, and reviewability.
3. **Human judgment:** domain correctness, risk acceptance, and approval.

Use deterministic checks whenever a requirement can be objectively tested. Do not rely on a model score to waive a failed mandatory check.

## 3. Evaluation dataset
Include representative tasks, edge cases, ambiguous requests, disallowed requests, and regression cases. Store input, expected behavior, and evaluation criteria. Version the dataset and track model, tool, and prompt changes.

## 4. Quality gate design
A gate should fail clearly, return actionable evidence, and be repeatable. Configure only commands that exist and have been verified in the project.

## Practical exercise
Review the sample evaluation cases. Add a case for an unclear business rule and one for an action outside the agent's allowed scope. Score an agent result with the rubric, but fail the run if a critical safety condition is violated regardless of average score.

## Artifacts
- [AI review checklist](../examples/quality-gates/ai-review-checklist.md)
- [Quality gate script](../examples/quality-gates/quality-gate.sh)
- [Evaluation methodology](../examples/evaluation/README.md)
- [Evaluation rubric](../examples/evaluation/agent-evaluation-rubric.md)
- [Sample evaluation cases](../examples/evaluation/cases.json)

## Knowledge check — 10 questions
1. What is the role of AI code review?
   - A. Automatically approve a pull request
   - B. Provide additional findings for human validation
   - C. Replace automated tests
   - D. Change product requirements
2. Which is a deterministic check?
   - A. Model confidence
   - B. Test suite or static type check
   - C. Prompt asking “is this safe?”
   - D. Thumbs-up reaction
3. Model-based evaluation is useful for:
   - A. Assessing completeness and instruction adherence against a rubric
   - B. Replacing access control
   - C. Approving production risk
   - D. Proving every output correct
4. What should a review finding contain?
   - A. “Bad code”
   - B. Severity, location, evidence, impact, suggested verification
   - C. Hidden reasoning
   - D. Product strategy
5. Why create an evaluation dataset?
   - A. Compare workflow behavior across representative cases
   - B. Increase prompt count
   - C. Hide failures
   - D. Eliminate reviewers
6. Which cases belong in an evaluation dataset?
   - A. Happy paths only
   - B. Typical, edge, ambiguous, disallowed, and regression cases
   - C. Model-generated cases only
   - D. Real customer secrets
7. Can a high average score compensate for a critical safety failure?
   - A. Yes
   - B. No; critical conditions should be hard failures
   - C. Sometimes if the model is expensive
   - D. Only in development
8. Why version prompts and evaluation data?
   - A. Make changes and regressions traceable
   - B. Prevent all changes
   - C. Slow tests
   - D. Remove evidence
9. What should a check do when a required test fails?
   - A. Report success
   - B. Fail clearly and provide actionable evidence
   - C. Silently continue
   - D. Delete the check
10. Who decides whether a change can merge?
   - A. AI reviewer alone
   - B. Authorized human reviewer under team policy
   - C. Formatter
   - D. Evaluation file

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — AI review is another signal, not an approval authority.
2. **B** — Tests and type checks have deterministic outcomes.
3. **A** — Rubrics assess qualitative dimensions systematically.
4. **B** — Evidence makes findings actionable.
5. **A** — A stable dataset supports comparison and regression detection.
6. **B** — Diverse cases reveal failure modes.
7. **B** — Critical safety failures cannot be averaged away.
8. **A** — Versioning supports reproducibility.
9. **B** — A check must make failure visible.
10. **B** — Merge authority remains with authorized humans.
</details>

**Next:** [Lesson 11 — Governance, Human Oversight, and Adoption](11-human-in-the-loop-and-safety.md)
