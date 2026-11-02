# 06 — Skills, Commands, and Hooks

## Learning objectives

- Distinguish reusable skills, task prompts, and lifecycle hooks.
- Package repeatable engineering practices.
- Use hooks for deterministic checks, not as a substitute for security architecture.

## Concepts

- **Instructions:** persistent project or organization guidance.
- **Skills:** reusable task knowledge and procedures that an agent can load when relevant.
- **Commands:** explicit, repeatable entry points for common tasks.
- **Hooks:** scripts or integrations triggered by defined tool or lifecycle events, depending on the agent platform.

Exact formats and capabilities vary by tool and version. Always validate against the current vendor documentation.

## Practical examples

- [Test design skill](../examples/agent-skills/skills/test-design/SKILL.md)
- [Pull request preparation command](../examples/agent-skills/commands/prepare-pr.md)
- [Example hook](../examples/agent-skills/hooks/validate-change.sh)

## Practical exercise

Create one skill for test design and one command for preparing a pull request. Add a deterministic local validation hook that blocks a clearly unsafe or malformed action. Test both success and failure paths.

## Expected outcome

A small, version-controlled set of reusable agent capabilities with documented triggers and limitations.

## Safety notes

Hooks execute code in your environment. Review scripts before enabling them, use least privilege, avoid leaking environment variables, and never rely on an LLM-only check for mandatory controls.
