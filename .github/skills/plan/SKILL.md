---
name: plan
description: Create structured execution plans from issues and milestones
---

# :file_folder: Plan

## :book: Table of Contents

<!-- <toc> --><!-- </toc> -->

## :telescope: Overview

Convert issues and milestones into ordered, actionable task lists. Use `manage_todo_list` for tracking. Break work by dependency order and assign to appropriate agents.

## :world_map: Guides

### :world_map: Task Decomposition

- Fetch issues: `gh issue view <number>` or `gh issue list --milestone "v0.x.0"`.
- Validate each issue has clear acceptance criteria and dependencies.
- Break into single-focus tasks with `manage_todo_list`.
- Format: `#<issue>: <action> - @<agent>`.

### :world_map: Milestone Planning

- Define scope with must-have and out-of-scope items.
- Use `cmr repo milestones list` for milestone context.
- Set MVP requirements and measurable success criteria.
- Plan CHANGELOG entries: Added, Changed, Fixed.

### :world_map: Execution Order

- Foundation first: models, utilities, configuration.
- Implementation: features, commands, modules.
- Validation: tests, error handling.
- Documentation: knowledge, docs, changelog.
- Integration: workflows, releases.

### :world_map: Output

- Complete task list with dependencies and execution order.
- Agent assignments.
- Success criteria per task.

## :books: References

- [:page_facing_up: ../../../docs/knowledge/planning.knowledge.md](../../../docs/knowledge/planning.knowledge.md)
