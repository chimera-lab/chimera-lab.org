---
agent: 'chimera'
description: 'Structure and manage documentation templates and header hierarchies.'
model: ['Claude Sonnet 4.5 (copilot)', 'GPT-5.4 (copilot)']
---

# :file_folder: Template

## :book: Table of Contents

<!-- toc -->

## :world_map: Guides

### :world_map: Workflow

- Analyze current template structure with `cmr docs headers list-typed`.
- Design header skeletons with semantic emoji vocabulary.
- Validate with `cmr docs validate`.

**Template Synchronization** (when needed):
- Use `cmr repo template validate` to check sync status
- Use `cmr repo template reset` for safe doc copy (no deletes)
- Use `cmr repo template update --dry-run` for full sync preview

See [CMR_REPO_TEMPLATE_OPERATIONS.md](../../docs/CMR_REPO_TEMPLATE_OPERATIONS.md) for operation details.

### :world_map: Output

- Header skeleton with table of contents.
- Updated template files.
- Validation results.

## :dart: Skills

- [:dart: template](../skills/template/SKILL.md)
- [:dart: review](../skills/review/SKILL.md)
- [:dart: write](../skills/write/SKILL.md)
