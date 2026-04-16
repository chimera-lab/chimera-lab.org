---
name: operating
description: Patterns for executing development, Git, and deployment operations
---

# :file_folder: Operating Knowledge

## :book: Table of Contents

- [:file_folder: Operating Knowledge](./#file_folder-operating-knowledge)
  - [:telescope: Overview](./#telescope-overview)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Git Operations](./#world_map-git-operations)
    - [:world_map: Deployment Workflow](./#world_map-deployment-workflow)
    - [:world_map: Automation Tools](./#world_map-automation-tools)
    - [:world_map: Repository Context](./#world_map-repository-context)
  - [:books: References](./#books-references)

## :telescope: Overview

Operating covers the execution of development tasks, Git workflows, deployments, and automation. Follow conventional commits, use semantic versioning, and leverage `cmr` for repository management. Require confirmation for destructive operations.

## :world_map: Guides

### :world_map: Git Operations

- Branch naming: `feat/*`, `fix/*`, `docs/*`, `chore/*` from `main`.
- Conventional commits: `{type}: {description}` with issue reference `Closes #{number}`.
- Commit types: feat, fix, docs, style, refactor, test, chore.
- Sync before push: `git fetch --prune && git pull`.
- Submodule operations: `git submodule foreach --recursive`.

### :world_map: Deployment Workflow

- Version tag: `git tag -a v{MAJOR}.{MINOR}.{PATCH} -m "Release v{version}"`.
- Pre-deploy: update CHANGELOG.md, bump version, run tests.
- Post-deploy: verify functionality, monitor errors.
- Targets: `main` (production), `develop` (staging), feature branches (preview).

### :world_map: Automation Tools

- `cmr` automates documentation validation, issues, milestones, labels, and templates.
- `cmr docs validate` checks structure; `cmr docs fix` auto-repairs.
- `cmr repo issues list`, `cmr repo milestones list` for project tracking.
- `cmr utils graph agents relation` generates relationship diagrams.

### :world_map: Repository Context

- Repository follows `{name}.{suffix}` naming with suffix defining type (app, scaffold, template, topic).
- Standard structure: `.github/` (agents, prompts, skills), `docs/` (knowledge, diagrams), root docs.
- Template inheritance: child → parent → `repository.template`. Modify at highest appropriate level.
- Consult architecture docs for system design decisions and technology stack.

## :books: References

- [:page_facing_up: ../../CONTRIBUTING.md](../../CONTRIBUTING.md)
- [:page_facing_up: ../../DEVELOPMENT.md](../../DEVELOPMENT.md)
- [:page_facing_up: ../../SECURITY.md](../../SECURITY.md)
