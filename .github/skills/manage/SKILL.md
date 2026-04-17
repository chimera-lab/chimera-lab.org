---
name: manage
description: Repository, template, and CMR CLI operations management
---

# :file_folder: Manage

## :book: Table of Contents

<!-- toc -->

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
- Use `cmr repo template validate` to check synchronization.
- Use `cmr repo template update` to apply upstream changes.
- Modify at the highest appropriate level to avoid duplication.

**Template Synchronization Operations**:

- **`cmr repo template validate`**: Read-only status check (safe, no side effects)
- **`cmr repo template reset`**: Safe documentation copy (adds/overwrites, never deletes)
- **`cmr repo template update`**: Full sync (add/modify/delete) - always `--dry-run` first

**Before updating templates**: Always run `--dry-run` to preview changes. Configure delete safety via `settings.json.template_update`.

See [CMR_REPO_TEMPLATE_OPERATIONS.md](../../../docs/CMR_REPO_TEMPLATE_OPERATIONS.md) for full operational guide with decision tree and examples.

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
