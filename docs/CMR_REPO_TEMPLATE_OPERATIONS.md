# :building_construction: CMR Repo Template Operations

## :book: Table of Contents

- [:building_construction: CMR Repo Template Operations](./#building_construction-cmr-repo-template-operations)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Operation Matrix](./#building_construction-operation-matrix)
  - [:building_construction: Operation Details](./#building_construction-operation-details)
    - [:building_construction: validate (Read-Only Status Check)](./#building_construction-validate-read-only-status-check)
    - [:building_construction: reset (Safe Template Copy)](./#building_construction-reset-safe-template-copy)
    - [:building_construction: update (Full Synchronization)](./#building_construction-update-full-synchronization)
    - [:building_construction: install (Assign Template)](./#building_construction-install-assign-template)
    - [:building_construction: list (Browse Template Files)](./#building_construction-list-browse-template-files)
  - [:triangular_ruler: Delete Safety Policy](./#triangular_ruler-delete-safety-policy)
  - [:memo: Configuration Guide](./#memo-configuration-guide)
  - [:world_map: Decision Tree](./#world_map-decision-tree)
  - [:books: Examples](./#books-examples)

---

## :telescope: Overview

CMR repo template operations manage synchronization between repositories and their assigned templates. Understanding the semantic differences between operations is critical for safe repository maintenance.

**Key Principle**: Template operations are categorized by **impact level** (read-only vs write) and **scope** (metadata, documentation, or full repository).

---

## :building_construction: Operation Matrix

| Operation | Type | Scope | Risk | Write Impact | Destructive | When to Use |
|-----------|------|-------|------|--------------|-------------|------------|
| **validate** | Read-only | All files | None | None | No | Check synchronization status |
| **reset** | Write | Docs only | Low | Non-destructive | No | Copy template docs without delete |
| **update** | Write | All files | High | Configurable | Yes | Full sync with template |
| **install** | Write | Metadata | Low | Metadata only | No | Assign template to repo |
| **list** | Read-only | Template files | None | None | No | Browse template inventory |

---

## :building_construction: Operation Details

### :building_construction: validate (Read-Only Status Check)

**Purpose**: Check synchronization status between repository and template without making changes.

**Usage**:
```bash
cmr repo template validate                    # Check full synchronization
cmr repo template validate --list-new-files   # Show repo-only files (not in template)
```

**Output**: Status report showing:
- Missing files (in template, not in repo)
- Modified files (exist in both, differ in content)
- Synchronized files (identical)
- New files (in repo, not in template)

**Exit Code**: 
- `0` = synchronized
- `1` = out of sync

**Risk Level**: ⚫ None (read-only operation)

**When to use**:
- Before running `update` to see what will change
- In CI/CD to detect template drift
- To audit repository compliance with template

---

### :building_construction: reset (Safe Template Copy)

**Purpose**: Copy documentation from template into repository (safe, non-destructive).

**Usage**:
```bash
cmr repo template reset                       # Copy missing template files
cmr repo template reset --overwrite           # Overwrite existing files
cmr repo template reset --pattern "*.md"      # Copy only files matching pattern
cmr repo template reset --dry-run             # Preview changes without applying
```

**Behavior**:
- Copies files from template to repository
- **Never deletes** any repository files
- Skips existing files unless `--overwrite`
- Respects `--pattern` for selective copying

**Risk Level**: 🟢 Low (non-destructive write)

**When to use**:
- When you want template updates but need to preserve all existing repo files
- To safely initialize documentation structure
- As an alternative to `update` when delete safety is critical

---

### :building_construction: update (Full Synchronization)

**Purpose**: Full template synchronization - apply all changes including add, modify, and delete operations.

**Usage**:
```bash
cmr repo template update                              # Full sync with default delete policy
cmr repo template update --dry-run                    # Preview changes
cmr repo template update --force                      # Skip uncommitted changes check
cmr repo template update --push                       # Auto-push after update
cmr repo template update --delete-path "file.md"      # Force delete specific file
cmr repo template update --no-delete-path "config/"   # Never delete path
cmr repo template update --interactive-delete         # Ask for each deletion
```

**Multi-Step Process**:
1. Check for uncommitted changes (abort unless `--force`)
2. Update template submodule from remote
3. Commit + push submodule update
4. Apply file changes (add/update/delete)
5. Run post-update validation

**Delete Behavior** (sophisticated safety):

- **Built-in never-delete** (always safe):
  - `.gitmodules`
  - `.git/*`
  - `.gitconfig`

- **Configuration-based** (from `settings.json`):
  - `template_update.never_delete`: patterns to preserve
  - `template_update.always_delete`: patterns to always delete
  - `template_update.interactive_delete`: ask for each deletion

- **CLI overrides** (highest priority):
  - `--delete-path`: force delete even if protected
  - `--no-delete-path`: never delete specific files

**Risk Level**: 🔴 High (modifies repository, can delete files)

**When to use**:
- Full synchronization with template (production use)
- After template updates need to be applied across org
- When you have clear delete policies configured

**⚠️ Important**: Always run with `--dry-run` first to preview changes.

---

### :building_construction: install (Assign Template)

**Purpose**: Assign/install a template to repository.

**Usage**:
```bash
cmr repo template install <template_name>           # Install template by name
cmr repo template install <template_name> --ssh     # Use SSH for remote URLs
```

**Inputs**:
- `template_name`: Name of template to assign
- `--ssh`: Enable SSH authentication for git operations

**Impact**: 
- Updates `meta.json` with template reference
- Creates git submodule if needed

**Risk Level**: 🟢 Low (metadata only)

**When to use**:
- Initial setup of repository with template
- Switching to different template

---

### :building_construction: list (Browse Template Files)

**Purpose**: Display available template files for current repository.

**Usage**:
```bash
cmr repo template list              # Show all template files
```

**Output**: Table with:
- Template file paths
- File types
- Status (missing, modified, synchronized)

**Risk Level**: ⚫ None (read-only operation)

**When to use**:
- Explore template structure
- Understand what template provides
- Verify template installation

---

## :triangular_ruler: Delete Safety Policy

The `update` operation has sophisticated delete safety mechanisms:

### Protection Hierarchy (Highest to Lowest Priority)

1. **Absolute Protections** (can never be deleted):
   - `.gitmodules` (git metadata)
   - `.git/` (version control)
   - `.gitconfig` (git configuration)

2. **Configuration Protection** (`settings.json`):
   - `template_update.never_delete`: glob patterns (default: protect custom files)
   - `template_update.always_delete`: glob patterns (explicit deletion list)
   - `template_update.interactive_delete`: boolean (ask before each delete)

3. **CLI Override** (`--delete-path`, `--no-delete-path`):
   - Highest priority (can override configuration)
   - `--delete-path "pattern"`: force delete
   - `--no-delete-path "pattern"`: never delete

### Default Behavior

- **Delete is enabled** by default but **requires explicit opt-in** for dangerous patterns
- If delete would remove files outside protection lists, operation **pauses for confirmation**
- `--interactive-delete` flag forces per-file confirmation before deletion

---

## :memo: Configuration Guide

### settings.json Template Update Section

Configure delete behavior and template variables in `.chimera-lab/settings.json`:

```json
{
  "template_update": {
    "never_delete": [
      "pyproject.toml",
      ".env*",
      "custom_*.md",
      "config/**"
    ],
    "always_delete": [
      "deprecated_old_file.md",
      "legacy/**/*.txt"
    ],
    "interactive_delete": false
  },
  "custom_variables": {
    "project_name": "my-project",
    "version": "1.0.0"
  }
}
```

### Configuration Options

| Key | Type | Default | Purpose |
|-----|------|---------|---------|
| `never_delete` | string[] | [] | Glob patterns to preserve during update |
| `always_delete` | string[] | [] | Glob patterns to always delete during update |
| `interactive_delete` | boolean | false | Ask before each file deletion |
| `custom_variables` | object | {} | Template variables for substitution |

### Examples

**Example 1: Conservative Mode (Safe)**
```json
{
  "template_update": {
    "never_delete": ["**"],
    "always_delete": [],
    "interactive_delete": false
  }
}
```
*Effect*: `cmr repo template update` will only add/modify, never delete.

**Example 2: Balanced Mode (Recommended)**
```json
{
  "template_update": {
    "never_delete": [
      "*.local.md",
      ".env*",
      "config/custom/**"
    ],
    "always_delete": [],
    "interactive_delete": true
  }
}
```
*Effect*: Ask before deletes; protect custom files; allow template cleanup.

**Example 3: Full Sync Mode (Aggressive)**
```json
{
  "template_update": {
    "never_delete": [],
    "always_delete": [
      "old_deprecated_*.md"
    ],
    "interactive_delete": false
  }
}
```
*Effect*: Delete orphans; explicitly remove deprecated files.

---

## :world_map: Decision Tree

```
START: Need template operation?
│
├─ Want to CHECK status?
│  └─ YES → Use `cmr repo template validate`
│           ✓ Safe (read-only)
│           ✓ Shows what would change
│           ✓ Use before `update`
│
├─ Want to COPY docs from template SAFELY?
│  └─ YES → Use `cmr repo template reset`
│           ✓ Low risk (non-destructive)
│           ✓ Only adds/overwrites files
│           ✓ Never deletes repo files
│
├─ Want to FULLY SYNC with template?
│  └─ YES → Proceed to Delete Policy Check
│           │
│           ├─ Do you need FULL cleanup (delete orphans)?
│           │  └─ YES → Use `cmr repo template update`
│           │           ⚠️ HIGH RISK (can delete files)
│           │           ✓ Configure delete policy first
│           │           ✓ Run `--dry-run` first
│           │
│           └─ Do you need SAFE sync (no deletes)?
│              └─ YES → Use `cmr repo template reset` instead
│                       (or configure never_delete fully)
│
└─ Want to ASSIGN new template?
   └─ YES → Use `cmr repo template install <template>`
            ✓ Low risk (metadata only)
```

---

## :books: Examples

### Scenario 1: Check Synchronization Before Update

```bash
# Step 1: See what would change
$ cmr repo template validate
Missing files: 3
Modified files: 1
Synchronized files: 42
New files (repo-only): 5

# Step 2: Review changes
$ cmr repo template validate --list-new-files
Repo-only files:
  - custom_config.json
  - my_docs.md
  - local_setup.sh

# Step 3: Verify safe via dry-run
$ cmr repo template update --dry-run
Would add: 2 files
Would modify: 1 file
Would delete: 0 files

# Step 4: Proceed with update
$ cmr repo template update
Update completed successfully
```

### Scenario 2: Copy Documentation Only (Safe)

```bash
# Setup: Want new docs from template but keep all custom files
$ cmr repo template reset --pattern "docs/*.md"
Copying template docs...
  docs/ARCHITECTURE.md ✓
  docs/ROADMAP.md ✓
  docs/STRUCTURE.md ✓
Total copied: 3 files
```

### Scenario 3: Full Sync with Custom Delete Policy

**Setup**: `settings.json`
```json
{
  "template_update": {
    "never_delete": [
      ".env*",
      "config/custom/**",
      "local_*.md"
    ],
    "interactive_delete": true
  }
}
```

```bash
# Run update with policy enforcement
$ cmr repo template update
Checking for uncommitted changes... OK
Updating template submodule... OK
Applying changes:
  Added: 5 files
  Modified: 3 files
  Ready to delete: 2 files
    - old_config.json
    - deprecated_feature.md
  Delete these? [y/N]: y
Update completed successfully
```

### Scenario 4: Selective Interactive Mode

```bash
# Ask about each deletion one-by-one
$ cmr repo template update --interactive-delete
Would delete: old_file.md (protected by never_delete)
  Skip? [Y/n]: y (skipped)

Would delete: deprecated.md
  Delete? [y/N]: y (deleted)

Update completed: 2 added, 1 deleted
```

---

## :page_facing_up: Related Documentation

- [CMR Knowledge Base](./knowledge/cmr.knowledge.md#building_construction-cmr-repo-template) - Short reference
- [Validating Knowledge](./knowledge/validating.knowledge.md) - Template validation rules
- [Repository Knowledge](./knowledge/repository.knowledge.md) - Repository management patterns
- [TEMPLATE_HIERARCHY_VALIDATION.md](./TEMPLATE_HIERARCHY_VALIDATION.md) - Template audit results
