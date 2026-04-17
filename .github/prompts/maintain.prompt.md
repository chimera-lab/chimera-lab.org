---
agent: 'maintainer'
description: 'Repository maintenance, health checks, and template synchronization.'
---

# :file_folder: Maintain

## :book: Table of Contents

<!-- toc -->

## :world_map: Guides

### :world_map: Workflow

- Run `cmr repo status` to check repository health.
- Validate documentation with `cmr docs validate`.
- Check template synchronization with `cmr repo template validate`.
- Apply fixes with `cmr docs fix` where applicable.

**Template Operations Decision Tree**:
- **Check sync status**: `cmr repo template validate` (safe, read-only)
- **Copy docs safely**: `cmr repo template reset` (non-destructive)
- **Full sync with deletes**: `cmr repo template update --dry-run` (always preview first)

Configure delete safety in `.chimera-lab/settings.json` under `template_update` section.

### :world_map: Output

- Repository health status and recommendations.
- Documentation validation results.
- Template synchronization status.
- List of issues found and fixes applied.

## :dart: Skills

- [:dart: maintain](../skills/maintain/SKILL.md)
- [:dart: review](../skills/review/SKILL.md)
