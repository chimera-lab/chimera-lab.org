---
name: maintain
description: Repository maintenance, health checks, and CMR CLI operations
---

# :file_folder: Maintain

## :book: Table of Contents

<!-- toc -->

## :telescope: Overview

Maintain handles repository health, documentation upkeep, and template synchronization. Uses CMR CLI for automated checks, fixes, and organization-wide consistency.

## :world_map: Guides

### :world_map: Repository Health

- Use `cmr repo status` to check repository state and configuration.
- Check submodule status with `git submodule status`.
- Review issue and milestone hygiene with `cmr repo issues list`.

### :world_map: Documentation Maintenance

- Run `cmr docs validate` to check structure and links.
- Run `cmr docs fix` to auto-repair formatting issues.
- Verify all references between files are valid.
- Keep documentation up-to-date with code changes.

### :world_map: Template Synchronization

- Use `cmr repo template validate` to check upstream sync.
- Use `cmr repo template update` to apply upstream changes.
- Inheritance: child → parent → `repository.template`.
- Propagate changes from highest appropriate level.

### :world_map: Output

- Repository health status and recommendations.
- Documentation validation results.
- Template synchronization status.

## :books: References

- [:page_facing_up: ../../../docs/knowledge/cmr.knowledge.md](../../../docs/knowledge/cmr.knowledge.md)
- [:page_facing_up: ../../../docs/knowledge/repository.knowledge.md](../../../docs/knowledge/repository.knowledge.md)
