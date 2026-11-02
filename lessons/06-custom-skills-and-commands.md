# Lesson 06 — Configuring Agent Capabilities

[Course home](../README.md) · [Previous: Lesson 05](05-claude-code-setup.md) · Lesson 06 of 12

## Purpose

Once project context and specifications exist, reusable agent capabilities help teams apply the same practices consistently. This lesson distinguishes instructions, skills, commands, and hooks.

## Learning outcomes

- Understand the purpose of each configuration mechanism.
- Create reusable task guidance.
- Use deterministic scripts for repeatable checks.
- Review tool-specific behavior and permissions before enabling automation.

## 1. Four building blocks

- **Instructions:** persistent guidance about the project and its rules.
- **Skills:** reusable procedures and domain knowledge loaded for relevant tasks.
- **Commands:** explicit entry points for recurring activities.
- **Hooks:** scripts or integrations triggered by supported lifecycle/tool events.

Exact names, formats, and capabilities vary by product and version. Check the current documentation for the tool you use.

## 2. Design a useful skill

A good skill states when it should be used, what steps to follow, what output format is expected, and what assumptions are prohibited. Keep it focused. For example, a test-design skill can extract requirements, identify boundaries and negative cases, map cases to test layers, and flag unresolved domain questions.

## 3. Commands as repeatable entry points

A command such as “prepare PR” should consistently produce a summary, specification coverage, tests executed, risks, open questions, and rollback considerations. It should not merge or deploy unless the platform and policy explicitly allow it.

## 4. Hooks and deterministic checks

Hooks can enforce or automate repeatable local steps, but they execute code in an environment. Review their contents, permissions, side effects, and failure behavior. Do not use an LLM instruction as a substitute for access control.

## Practical exercise

Inspect the sample CLAUDE.md, test-design skill, prepare-PR command, and validation hook. Adapt them for a small project. Run the hook manually first and verify both pass and failure behavior.

## Artifacts

- [Example CLAUDE.md](../examples/agent-skills/CLAUDE.md)
- [Test design skill](../examples/agent-skills/skills/test-design/SKILL.md)
- [Prepare PR command](../examples/agent-skills/commands/prepare-pr.md)
- [Validation hook](../examples/agent-skills/hooks/validate-change.sh)

## Knowledge check — 10 questions

1. What is the main role of persistent instructions?
   - A. Define stable project guidance
   - B. Store credentials
   - C. Replace tests
   - D. Approve releases

2. What makes a skill reusable?
   - A. It contains a focused procedure and expected output for a recurring task
   - B. It is a very long generic prompt
   - C. It has unrestricted access
   - D. It runs only once

3. What is a command useful for?
   - A. Providing a repeatable entry point for a known workflow
   - B. Changing company strategy
   - C. Replacing human approval
   - D. Hiding test failures

4. What is a hook?
   - A. A model personality
   - B. A script or integration triggered by a supported event
   - C. A product requirement
   - D. A database schema

5. Why must hooks be reviewed carefully?
   - A. They may execute code with access to the local environment
   - B. They are always harmless
   - C. They cannot fail
   - D. They only change Markdown

6. Which skill output is most useful for test design?
   - A. “Tests look good”
   - B. A traceable table of requirements, scenarios, expected results, and test layers
   - C. A list of random test names
   - D. A code style opinion

7. Should tool-specific syntax be assumed to be universal?
   - A. Yes
   - B. No; verify against the current tool documentation and version
   - C. Only for hooks
   - D. Only for commands

8. What should a prepare-PR command report?
   - A. Only a title
   - B. Summary, spec coverage, checks run, risks, and open questions
   - C. A claim that all tests passed whether run or not
   - D. An automatic merge

9. What is the safest way to introduce a hook?
   - A. Enable it with administrator permissions immediately
   - B. Review it, test manually in a safe environment, and limit permissions
   - C. Copy it without reading
   - D. Disable all error handling

10. Can a skill instruction enforce security permissions?
   - A. Yes, by itself
   - B. No; actual enforcement must use platform and environment controls
   - C. Only if it is named SECURITY.md
   - D. Only in public repositories

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **A** — Instructions provide stable project guidance.
2. **A** — Focused procedures can be reused and improved.
3. **A** — Commands make recurring work easy to invoke consistently.
4. **B** — Hooks are event-triggered automation, where supported.
5. **A** — A hook may have real execution privileges.
6. **B** — Traceability makes coverage reviewable.
7. **B** — Tool formats evolve and differ.
8. **B** — The output should support a human review decision.
9. **B** — Inspect and test before enabling.
10. **B** — Instructions are not a substitute for enforced permissions.
</details>

**Next:** [Lesson 07 — Designing the Agentic Workflow](07-agentic-workflows.md)
