---
name: manage
description: Repository, template, and CMR CLI operations management
---

# :file_folder: Manage

## :book: Table of Contents

<!-- <toc> --><!-- </toc> -->

## :telescope: Overview

Manage handles repository operations, template inheritance, and CMR CLI workflows. Coordinates git operations, template synchronization, and organization-wide repository management.

## :world_map: Guides

### :world_map: Repository Operations

- Use `cmr repo status` to check repository state.
- Use `cmr repo init` to initialize repository configuration.
- Manage issues with `cmr repo issues list` and milestones with `cmr repo milestones list`.
- Follow branch naming conventions: `feat/*`, `fix/*`, `docs/*`, `chore/*`.

### :world_map: Template Management

- Template inheritance: child → parent → `repository.template`.
- Use `cmr repo template diff` to check synchronization.
- Use `cmr repo template update` to apply upstream changes.
- Modify at the highest appropriate level to avoid duplication.

### :world_map: CMR CLI Usage

- `cmr docs list` to enumerate documentation by category.
- `cmr docs validate` to check structure and links.
- `cmr docs fix` to auto-repair formatting.
- `cmr utils graph agents relation` to regenerate relationship diagrams.
- `cmr org list` for organization-wide discovery.

### :world_map: Output

- Repository status and configuration.
- Template synchronization results.
- CMR command outputs and validation results.

## :books: References

- [:page_facing_up: ../../../docs/knowledge/cmr.knowledge.md](../../../docs/knowledge/cmr.knowledge.md)
- [:page_facing_up: ../../../docs/knowledge/repository.knowledge.md](../../../docs/knowledge/repository.knowledge.md)
