---
name: planning
description: Patterns for structuring work, milestones, and execution order
---

# :file_folder: Planning Knowledge

## :book: Table of Contents

- [:file_folder: Planning Knowledge](./#file_folder-planning-knowledge)
  - [:telescope: Overview](./#telescope-overview)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Task Decomposition](./#world_map-task-decomposition)
    - [:world_map: Execution Order](./#world_map-execution-order)
    - [:world_map: Milestone Planning](./#world_map-milestone-planning)
  - [:books: References](./#books-references)

## :telescope: Overview

Planning converts research findings into ordered, actionable tasks. Use `manage_todo_list` to track progress. Break work into small focused steps ordered by dependency. Coordinate across agents when multiple domains are involved.

## :world_map: Guides

### :world_map: Task Decomposition

- Break objectives into single-focus tasks.
- Each task should have a clear deliverable and success criteria.
- Assign tasks to the agent best suited for the domain.
- Use `manage_todo_list` to write and track the plan.

### :world_map: Execution Order

- Foundation first: data models, utilities, configuration.
- Implementation: features, commands, modules.
- Validation: tests, reviews, error handling.
- Documentation: knowledge, docs, changelog.
- Integration: workflows, releases, deployment.

### :world_map: Milestone Planning

- Define scope with must-have and out-of-scope items.
- Use `cmr repo milestones list` and `gh issue list --milestone` for context.
- Follow semantic versioning: MAJOR (breaking), MINOR (features), PATCH (fixes).
- Update CHANGELOG.md for each release.

## :books: References

- [:page_facing_up: ../ROADMAP.md](../ROADMAP.md)
- [:page_facing_up: ../../CHANGELOG.md](../../CHANGELOG.md)
- [:page_facing_up: ../../CONTRIBUTING.md](../../CONTRIBUTING.md)
