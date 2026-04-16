---
name: automation
description: Patterns for automated workflows, CI/CD, and repository automation
---

# :file_folder: Automation Knowledge

## :book: Table of Contents

- [:file_folder: Automation Knowledge](./#file_folder-automation-knowledge)
  - [:telescope: Overview](./#telescope-overview)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: GitHub Actions](./#world_map-github-actions)
    - [:world_map: Issue Automation](./#world_map-issue-automation)
    - [:world_map: Template Synchronization](./#world_map-template-synchronization)
    - [:world_map: Documentation Automation](./#world_map-documentation-automation)
  - [:books: References](./#books-references)

## :telescope: Overview

Automation knowledge covers CI/CD pipelines, GitHub Actions workflows, automated issue and milestone management, template synchronization, and documentation validation. Use `cmr` CLI to automate repository operations and maintain consistency across the organization.

## :world_map: Guides

### :world_map: GitHub Actions

- Workflows located in `.github/workflows/` directory.
- Common workflows: testing, linting, building, deployment, documentation validation.
- Trigger on: push, pull_request, schedule, workflow_dispatch.
- Use repository secrets for sensitive credentials.
- Cache dependencies to speed up workflow execution.

### :world_map: Issue Automation

- Use `cmr repo issues create` to batch create issues from templates.
- Use `cmr repo issues list` to filter and view issues by milestone, label, or state.
- Label automation: apply labels based on file paths, keywords, or issue templates.
- Milestone automation: assign issues to milestones based on planned release cycles.
- Use GitHub Actions to auto-label, auto-assign, and update issue status.

### :world_map: Template Synchronization

- Use `cmr repo template validate` to detect template drift.
- Use `cmr repo template update` to pull changes from parent templates.
- Automated checks ensure child repositories stay synchronized with upstream templates.
- Template inheritance flows from `repository.template` to specialized templates to project repositories.

### :world_map: Documentation Automation

- Use `cmr docs validate` in CI to enforce documentation standards.
- Use `cmr docs fix` to auto-repair fixable issues.
- Generate relationship diagrams with `cmr utils graph agents relation`.
- Automate Table of Contents updates based on header structure.
- Validate links, emoji usage, and header hierarchy on every commit.

## :books: References

- [:page_facing_up: ../ARCHITECTURE.md](../ARCHITECTURE.md)
- [:page_facing_up: operating.knowledge.md](operating.knowledge.md)
- [:page_facing_up: cmr.knowledge.md](cmr.knowledge.md)
