# cmr repo template operations

Quick reference for CMR template synchronization operations.

## operations at a glance

| Operation | Type | Risk | Purpose |
|-----------|------|------|---------|
| `validate` | read-only | ⚫ none | Check sync status |
| `reset` | write | 🟢 low | Copy docs safely (no delete) |
| `update` | write | 🔴 high | Full sync (add/modify/delete) |
| `install` | write | 🟢 low | Assign template to repo |
| `list` | read-only | ⚫ none | Browse template files |

## decision tree

**Check status?** → `cmr repo template validate` (safe, read-only)

**Copy docs only?** → `cmr repo template reset` (safe, non-destructive)

**Full sync?** → `cmr repo template update` (high risk, requires delete policy)

**See delete policy** → [CMR_REPO_TEMPLATE_OPERATIONS.md](./CMR_REPO_TEMPLATE_OPERATIONS.md#triangular_ruler-delete-safety-policy)

## delete safety

`update` operation protects:
- `.gitmodules`, `.git/`, `.gitconfig` (always safe)
- Patterns in `settings.json.template_update.never_delete`
- Patterns in `settings.json.template_update.always_delete`

Always run `--dry-run` before destructive operations.

## examples

```bash
# Check what changed
cmr repo template validate

# Safe copy of docs
cmr repo template reset --overwrite

# Preview full sync
cmr repo template update --dry-run

# Full sync with interactive deletes
cmr repo template update --interactive-delete
```

## configuration

Set delete policy in `.chimera-lab/settings.json`:

```json
{
  "template_update": {
    "never_delete": ["*.local.md", ".env*"],
    "always_delete": ["deprecated/**"],
    "interactive_delete": true
  }
}
```

## see also

- [Detailed Operations Guide](./CMR_REPO_TEMPLATE_OPERATIONS.md)
- [CMR Knowledge Base](./cmr.knowledge.md#building_construction-cmr-repo-template)
- [Validating Guide](./validating.knowledge.md)
