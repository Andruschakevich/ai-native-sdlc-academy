# Lesson 04 — Preparing the Repository and Agent Context

[Course home](../README.md) · [Previous: Lesson 03](03-spec-driven-development.md) · Lesson 04 of 12

## Purpose

An agent can only make useful decisions when it can discover the relevant project context. Context should be curated, version-controlled, and separated into stable project guidance and task-specific instructions.

## Learning outcomes

- Identify the context an agent needs before making changes.
- Create concise repository-level instructions.
- Define an agent contract with purpose, tools, boundaries, and outputs.
- Understand why instructions alone are not a security boundary.

## 1. Context layers

A practical context model includes:
- **Organization context:** security, privacy, engineering standards, approved tools.
- **Repository context:** purpose, architecture, directory layout, commands, conventions.
- **Domain context:** entities, business rules, workflows, terminology.
- **Task context:** request, approved specification, acceptance criteria, constraints.
- **Execution context:** current diff, test output, environment state, tool permissions.

Do not dump everything into one enormous prompt. Keep stable guidance concise and link to focused documents.

## 2. Repository instruction file

A repository instruction file such as `CLAUDE.md` can explain the project, where important code lives, how to build and test it, conventions, and the definition of done. The exact filename and behavior depend on the tool.

Good instructions are:
- Specific and actionable
- Short enough to remain discoverable
- Maintained with the code
- Clear about unknowns and prohibited actions
- Verified against the actual project

## 3. Agent contract

Before enabling an agent, define its purpose, inputs, permitted tools, outputs, constraints, stop conditions, verification, and handoff. A contract makes the role understandable and reviewable.

## 4. Instructions versus enforcement

A prompt saying “do not access production” is not equivalent to removing production credentials or permissions. Use actual access controls, isolated environments, least privilege, and external approval gates for critical actions.

## Practical exercise

Create a repository instruction file for a project you know. Ask the agent to summarize the rules it believes it must follow. Correct inaccuracies, then test the commands in the file yourself.

## Artifacts

- [Example CLAUDE.md](../examples/agent-skills/CLAUDE.md)
- [Agent contract template](../examples/agent-architecture/agent-contract.md)
- [Human approval policy](../examples/quality-gates/human-approval-policy.md)

## Knowledge check — 10 questions

1. What is the purpose of repository-level context?
   - A. Replace source code
   - B. Give agents discoverable project-specific guidance
   - C. Guarantee model correctness
   - D. Store credentials

2. Which item belongs in repository context?
   - A. Build and test commands
   - B. Personal passwords
   - C. Customer access tokens
   - D. Unapproved production credentials

3. What belongs in task context?
   - A. Every document in the company
   - B. The specific request, approved spec, acceptance criteria, and constraints
   - C. Only the programming language
   - D. A list of unrelated tickets

4. What does an agent contract define?
   - A. Only the agent's name
   - B. Purpose, inputs, tools, outputs, boundaries, and escalation
   - C. The team's salary bands
   - D. A guarantee of success

5. Why keep context modular?
   - A. To make it harder to find
   - B. To keep guidance relevant and maintainable
   - C. To hide project rules
   - D. To increase prompt size

6. Is a repository instruction file a security boundary?
   - A. Yes, always
   - B. No; permissions and enforcement must exist outside the prompt
   - C. Only for senior engineers
   - D. Only when stored in Git

7. What is least privilege?
   - A. Give every agent administrator access
   - B. Grant only the access needed for the defined task
   - C. Disable all tests
   - D. Use one shared account

8. What should happen if the instructions list a test command that no longer works?
   - A. Keep claiming it passed
   - B. Validate and update the documentation
   - C. Ask the agent to invent a replacement and trust it
   - D. Remove all verification

9. Which is a good stop condition?
   - A. The task requests access outside the agent's permitted scope
   - B. The agent has read the README
   - C. A file contains comments
   - D. A test name is long

10. Why ask an agent to summarize its instructions before execution?
   - A. It proves the agent is correct
   - B. It helps detect missing or misunderstood context before changes occur
   - C. It replaces code review
   - D. It grants additional permissions

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — Context helps the agent navigate project-specific conventions.
2. **A** — Commands are useful; secrets do not belong in prompts or repository docs.
3. **B** — Task context should be focused and actionable.
4. **B** — The contract defines the role and its boundaries.
5. **B** — Modular context is easier to maintain and retrieve.
6. **B** — Prompts cannot enforce access restrictions.
7. **B** — Minimize permissions and potential blast radius.
8. **B** — Instructions must reflect reality.
9. **A** — Scope violations require escalation.
10. **B** — A preflight summary can expose misunderstandings early.
</details>

**Next:** [Lesson 05 — Spec-Driven Development in Practice](05-claude-code-setup.md)
