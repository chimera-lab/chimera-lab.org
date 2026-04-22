# cmr repo template operations

## :book: Table of Contents

- [cmr repo template operations](./#cmr-repo-template-operations)
  - [:telescope: Overview](./#telescope-overview)
  - [:world_map: Guides](./#world_map-guides)
  - [:warning: Warnings](./#warning-warnings)
  - [:keyboard: Usage](./#keyboard-usage)
  - [:wrench: configuration](./#wrench-configuration)
  - [:link: see also](./#link-see-also)

## :telescope: Overview

| Operation | Type | Risk | Purpose |
|-----------|------|------|---------|
| `validate` | read-only | ⚫ none | Check sync status |
| `reset` | write | 🟢 low | Copy docs safely (no delete) |
| `update` | write | 🔴 high | Full sync (add/modify/delete) |
| `install` | write | 🟢 low | Assign template to repo |
| `list` | read-only | ⚫ none | Browse template files |

## :world_map: Guides

**Check status?** → `cmr repo template validate` (safe, read-only)

**Copy docs only?** → `cmr repo template reset` (safe, non-destructive)

**Full sync?** → `cmr repo template update` (high risk, requires delete policy)

**Delete policy priority** (highest → lowest):
1. **Absolute**: `.gitmodules`, `.git/`, `.gitconfig` — never deleted
2. **Config** (`settings.json`): `never_delete`, `always_delete`, `interactive_delete` patterns
3. **CLI flags**: `--delete-path` (force delete) / `--no-delete-path` (protect)

## :warning: Warnings

`update` operation protects:
- `.gitmodules`, `.git/`, `.gitconfig` (always safe)
- Patterns in `settings.json.template_update.never_delete`
- Patterns in `settings.json.template_update.always_delete`

Always run `--dry-run` before destructive operations.

## :keyboard: Usage

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

## :wrench: configuration

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

## :link: see also

- [CMR Knowledge Base](./cmr.knowledge.md#building_construction-cmr-repo-template)
- [Validating Guide](./validating.knowledge.md)
