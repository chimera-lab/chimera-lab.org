---
name: template
description: Structure and manage documentation templates and header hierarchies
---

# :file_folder: Template

## :book: Table of Contents

<!-- toc -->

## :telescope: Overview

Design and maintain documentation structure skeletons using semantic headers. Manage template inheritance hierarchies. Create only table of contents and headers — do not write content under headers.

## :world_map: Guides

### :world_map: Structure Design

- Create table of contents listings with semantic emoji headers.
- Use `cmr docs headers list-typed` to understand available header types.
- Plan documentation hierarchy and organization.
- Maintain consistency across the organization.

### :world_map: Template Inheritance

- Templates inherit from parent: child → parent → `repository.template`.

### :world_map: Template Synchronization Operations

**Decision Tree for Operation Selection**:

1. **Need to CHECK sync status?** → Use `cmr repo template validate`
	- Read-only, shows what differs from template
	- Safe to run anytime, no side effects
	- Output: missing files, modified files, synchronized files

2. **Need to COPY docs SAFELY (no deletes)?** → Use `cmr repo template reset`
	- Safe, non-destructive write
	- Adds/overwrites files only, never deletes
	- Good for initial documentation structure

3. **Need FULL SYNC (add/modify/delete)?** → Use `cmr repo template update`
	- High-risk write operation
	- Can delete files per `settings.json` configuration
	- **Always run `--dry-run` first to preview**
	- Configure delete policy: `template_update.never_delete`, `template_update.always_delete`

**Example Workflow**:
```bash
# 1. Check what's different
cmr repo template validate

# 2. Preview changes before applying
cmr repo template update --dry-run

# 3. Apply if safe
cmr repo template update
```

See [CMR_REPO_TEMPLATE_OPERATIONS.md](../../../docs/CMR_REPO_TEMPLATE_OPERATIONS.md) for comprehensive guide.

### :world_map: Validation

- Check that all files follow naming conventions.

### :world_map: Output

- Header skeleton with table of contents.
- Updated template files.
- Validation results.

## :books: References

- [:page_facing_up: ../../../docs/knowledge/validating.knowledge.md](../../../docs/knowledge/validating.knowledge.md)
