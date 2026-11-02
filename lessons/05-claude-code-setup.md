# 05 — Claude Code Setup and Repository Context

## Learning objectives

- Understand the role of repository-level instructions.
- Provide agents with concise, discoverable project context.
- Keep durable guidance separate from task-specific instructions.

## Repository context

A repository-level instruction file should explain:

- Project purpose and architecture
- Directory layout and important entry points
- Build, test, lint, and formatting commands
- Coding conventions and dependency rules
- Security and data-handling expectations
- Definition of done
- Required human approvals

Avoid turning the instruction file into an encyclopedia. Link to focused documents and keep the highest-value constraints easy to discover.

## Example

See [the sample project instructions](../examples/agent-skills/CLAUDE.md). The example is intentionally tool-specific and should be adapted to the installed Claude Code version and team conventions.

## Practical exercise

Review the example instructions. Add the actual commands and architecture notes for a project you own. Ask an agent to summarize the rules it will follow before allowing it to modify files.

## Expected outcome

A concise, version-controlled repository context file with validated commands and clear constraints.

## Safety notes

- Do not put secrets, tokens, personal data, or customer data in repository instructions.
- Treat repository instructions as guidance, not as a security boundary.
- Enforce critical permissions and checks outside the model where possible.

## Related artifacts

- [Example CLAUDE.md](../examples/agent-skills/CLAUDE.md)
- [Skill example](../examples/agent-skills/skills/test-design/SKILL.md)
