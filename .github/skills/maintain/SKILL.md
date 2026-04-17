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

- Use `cmr repo template validate` to check upstream sync (read-only).
- Use `cmr repo template reset` to safely copy documentation without deletes.
- Use `cmr repo template update` for full sync (add/modify/delete).
- Inheritance: child → parent → `repository.template`.
- Propagate changes from highest appropriate level.

**Before running `update`**: Always use `--dry-run` to preview changes. Configure delete policies in `settings.json` under `template_update` section.

See [CMR_REPO_TEMPLATE_OPERATIONS.md](../../../docs/CMR_REPO_TEMPLATE_OPERATIONS.md) for operational decision tree and safety policies.

### :world_map: Output

- Repository health status and recommendations.
- Documentation validation results.
- Template synchronization status.

## :books: References

- [:page_facing_up: ../../../docs/knowledge/cmr.knowledge.md](../../../docs/knowledge/cmr.knowledge.md)
- [:page_facing_up: ../../../docs/knowledge/repository.knowledge.md](../../../docs/knowledge/repository.knowledge.md)
