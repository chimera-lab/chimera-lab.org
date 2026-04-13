---
name: cmr
description: CMR CLI tool knowledge, command reference, and usage guides
---

# :file_folder: CMR CLI Knowledge

## :book: Table of Contents

- [:file\_folder: CMR CLI Knowledge](#file_folder-cmr-cli-knowledge)
  - [:book: Table of Contents](#book-table-of-contents)
  - [:telescope: Overview](#telescope-overview)
  - [:triangular\_ruler: Technologies](#triangular_ruler-technologies)
  - [:building\_construction: Command Reference](#building_construction-command-reference)
    - [cmr org](#cmr-org)
    - [cmr repo](#cmr-repo)
      - [cmr repo template](#cmr-repo-template)
      - [cmr repo issues](#cmr-repo-issues)
      - [cmr repo labels](#cmr-repo-labels)
      - [cmr repo milestones](#cmr-repo-milestones)
    - [cmr submodule](#cmr-submodule)
    - [cmr docs](#cmr-docs)
    - [cmr config](#cmr-config)
    - [cmr utils](#cmr-utils)
    - [cmr wd](#cmr-wd)
    - [cmr ls / cmr cd](#cmr-ls--cmr-cd)
  - [:world\_map: Guides](#world_map-guides)
    - [Guide: Install or change a template](#guide-install-or-change-a-template)
    - [Guide: Repair template origin](#guide-repair-template-origin)
    - [Guide: Apply template files](#guide-apply-template-files)
    - [Guide: Validate and fix docs](#guide-validate-and-fix-docs)
    - [Guide: Manage submodules](#guide-manage-submodules)
    - [Guide: GitHub issues workflow](#guide-github-issues-workflow)
    - [Guide: Discover repositories](#guide-discover-repositories)
  - [:hammer\_and\_wrench: Common Problems](#hammer_and_wrench-common-problems)
  - [:books: References](#books-references)

---

## :telescope: Overview

The CMR CLI (`cmr`) automates chimera-lab repository management: documentation validation, GitHub resources (issues, labels, milestones), git submodule operations, and template workflows. It unifies organization discovery and enforces structure across all chimera-lab repositories.

**Source of truth for template:** `meta.json → repo.template` (aligned with Python baseline). `settings.json` holds only patterns and validation config — never template name.

## :triangular_ruler: Technologies

- Node.js CLI (TypeScript), installed globally via `npm install -g .`
- Optional GitHub auth: `gh auth login` or env `CHIMERA_LAB_GITHUB_TOKEN`

```bash
npm install -g .
cmr --help
cmr config github
cmr --version
```

---

## :building_construction: Command Reference

### cmr org

Organization-wide discovery and listing.

```bash
cmr org list [options]
  -s, --suffix <suffix>    Filter by suffix (.topic, .app, .scaffold …)
  -p, --pattern <pattern>  Filter by name pattern
  -o, --output <format>    table | json | tree | graphml  (default: table)
  --json                   Alias for -o json
  -t, --templates          Include template repositories

cmr org tree                     # Repository hierarchy as tree
cmr org topic [--json]           # Topic repositories with hierarchy
cmr org stats [--json]           # Totals by suffix, level, templates
```

---

### cmr repo

Repository information and management.

```bash
cmr repo info [--json]           # Path, branch, remote, template, documents
```

#### cmr repo template

Manage template reference and apply template files.

```bash
cmr repo template detect
  Detect template for current repo.
  Reads: .chimera-lab/.template → meta.json → repo.template → suffix fallback.
  Output: template name, path, manifest status, source.

cmr repo template install <name> [options]
  -r, --remote <url>       Remote URL (default: https://github.com/chimera-lab/<name>)
  --ssh                    Use SSH URL  (git@github.com:chimera-lab/<name>.git)
  --submodule              Add as git submodule at .chimera-lab/.template  (default)
  --no-submodule           Skip submodule, reference only
  --copy-docs              Copy template files after install
  -f, --force              Replace existing template without confirmation
  Writes: meta.json → repo.template + remote_template.

cmr repo template uninstall [--submodule | --no-submodule]
  Removes template reference from meta.json. Optionally removes submodule.

cmr repo template list
  Show files available in the current repository template.

cmr repo template available
  List available templates in the organization (template.topic/).

cmr repo template validate
  Compare repo files against template manifest. Shows missing/modified/extra.

cmr repo template reset [--dry-run]
  Copy ALL template files to repo (destructive — overwrites existing).

cmr repo template update [--dry-run] [--overwrite]
  Apply template manifest non-destructively (only new or changed files).
  --overwrite also replaces existing files that differ.

cmr repo template repair-origin [options]
  --dry-run                Show plan without making changes
  --template <name>        Override auto-detected template (required for repos without suffix)
  --backup-dir <path>      Local backup directory (default: ~/.chimera-lab/backups/<date>)
  --skip-backup            Skip local backup (requires --force)
  --force                  Skip safety guards
  -y, --yes                Skip interactive prompts
  Repair GitHub template_repository link for repos created without a template.
  Steps: backup → archive old repo → create from template → push history.
```

#### cmr repo issues

```bash
cmr repo issues list [-s open|closed|all] [-l <labels...>] [--local] [--json]
cmr repo issues info <number> [--json]
cmr repo issues plan -t <title> [-b <body>] [-l <labels>] [-m <milestone>]
cmr repo issues create -t <title> [-b <body>] [-l <labels...>] [-m <milestone>]
cmr repo issues push [-a | -i <id>]     # Push local planned issues to GitHub
cmr repo issues pull [-s <state>]       # Pull from GitHub to local cache
cmr repo issues update <number> [-t] [-b] [-s] [-l]
cmr repo issues close <number>
cmr repo issues delete <id>             # Delete local planned issue
cmr repo issues sync                    # Sync to .chimera-lab/issues.json
```

#### cmr repo labels

```bash
cmr repo labels list [--json]
cmr repo labels create -n <name> [-c <color>] [-d <description>]
cmr repo labels update <name> [--new-name] [-c] [-d]
cmr repo labels delete <name>
cmr repo labels sync
```

#### cmr repo milestones

```bash
cmr repo milestones list [-s open|closed|all] [--json]
cmr repo milestones create -t <title> [-d <description>] [--due <YYYY-MM-DD>]
cmr repo milestones update <number> [-t] [-d] [--due]
cmr repo milestones close <number>
cmr repo milestones delete <number>
cmr repo milestones sync
```

---

### cmr submodule

Git submodule management.

```bash
cmr submodule list [--json]
cmr submodule status
cmr submodule update [--init] [--recursive]
cmr submodule sync [--recursive]

cmr submodule commit [-m <message>] [--dry-run]
  Stage and commit all submodule pointer changes.
  Default message: "chore: update submodules"

cmr submodule foreach <shell-command> [options]
  -j, --jobs <n>           Parallel groups (default: 1)
  --recursive              Include nested submodules
  --continue-on-error [code]
  --include-templates      Include .chimera-lab/.template submodules
  --ignore-pattern <regex> Skip submodules matching path regex
  -q, --quiet              Suppress headers
  Run a shell command in each submodule.
```

---

### cmr docs

Documentation validation and asset management.

```bash
cmr docs list [-p <glob>] [--json]       # List markdown files

cmr docs check [files...] [options]      # Validate markdown
  -r, --rule <rules...>    Run only specific rules
  -x, --exclude <rules...> Exclude specific rules
  --json
  -v, --verbose            Include info-level issues

cmr docs agents list [--json]
cmr docs agents show <name>
cmr docs agents install <name>

cmr docs knowledge list [--json]
cmr docs knowledge show <name>
cmr docs knowledge validate [name]
cmr docs knowledge install <name> [--force]
cmr docs knowledge update <name>

cmr docs prompts list [--json]
cmr docs prompts show <name>
cmr docs prompts install <name>
cmr docs prompts update <name>
cmr docs prompts validate [name]

cmr docs skills list [--json]
cmr docs skills show <name>
cmr docs skills create <name> [-d <description>]
```

---

### cmr config

```bash
cmr config show [--json] [--effective] [--trace] [--template <name>]
  --effective   Show merged config (settings + template defaults)
  --trace       Show which field comes from which source

cmr config github          # GitHub auth status and backend selection
cmr config rules [--json]  # List available validation rules
```

---

### cmr utils

```bash
cmr utils cache clear
cmr utils cache status
cmr utils cache invalidate [pattern]
cmr utils cache stats

cmr utils metric docs [--json]
cmr utils metric repo [--json]
cmr utils metric template count [--json]
cmr utils metric template distribution [--json]
cmr utils metric agents overview [--json]
cmr utils metric agents list [--json]

cmr utils graph repo [-f tree|dot]
cmr utils graph agents [-f tree|dot]
cmr utils graph template relation [-f tree|dot]
cmr utils graph docs structure [-f tree|dot]

cmr utils schema generate [-o <dir>] [--clean] [--stdout]
cmr utils schema validate <file> [-s settings|metadata|org|template]
cmr utils schema list [--json]
```

---

### cmr wd

Working directory navigation.

```bash
cmr wd                     # Show current repo info
cmr wd list [-s <suffix>]  # List repos (for navigation)
cmr wd path <name>         # Get path to a repo
cmr wd org                 # Get org root path
cmr wd repo                # Get current repo root path
cmr wd goto <name>         # Output cd command
  Usage: eval "$(cmr wd goto <name>)"
```

---

### cmr ls / cmr cd

```bash
cmr ls [path] [-a] [--json]
  List directory contents grouped by: Docs, Files, Folders, Submodules.
  -a shows all including ignored files.

cmr cd <query> [--list]
  Navigate to a repo by fuzzy name match.
  Usage: cd $(cmr cd <query>)
  --list shows matches without navigating.
```

---

## :world_map: Guides

### Guide: Install or change a template

Use when a repo has the wrong template or none at all.

```bash
# 1. Check current template
cmr repo template detect

# 2. Install new template (adds submodule + writes meta.json)
cmr repo template install org.template --ssh

# 3. Verify
cmr repo template detect
# → org.template

# 4. Optionally apply template files
cmr repo template update          # non-destructive (new/changed only)
cmr repo template reset           # destructive (all files)
```

**What `install` writes:**
- `meta.json → repo.template` = template name (source of truth)
- `meta.json → remote_template` = remote URL
- `.chimera-lab/.template` = git submodule (or text file reference)

---

### Guide: Repair template origin

Use when a repo was created on GitHub **without** selecting a template. The GitHub `template_repository` link is missing.

```bash
# 1. Dry-run: verify preflight and see the plan
cmr repo template repair-origin --dry-run

# For repos without a recognisable suffix, specify template explicitly:
cmr repo template repair-origin --dry-run --template org.template

# 2. Execute repair (creates backup, archives old, creates from template, pushes history)
cmr repo template repair-origin --template org.template --ssh --yes

# 3. Verify on GitHub
gh api repos/chimera-lab/<repo> --jq '.template_repository.full_name'
```

**Safety guarantees:** local mirror backup + git bundle created before any destructive step. Old repo renamed to `<name>.archive.YYYYMMDD`, not deleted.

---

### Guide: Apply template files

Use after installing a template or when template has been updated upstream.

```bash
# Preview what would change
cmr repo template update --dry-run

# Apply only new/missing files (safe)
cmr repo template update

# Apply and overwrite changed files
cmr repo template update --overwrite

# Full reset (overwrites everything, use carefully)
cmr repo template reset

# Validate current state vs template
cmr repo template validate
```

---

### Guide: Validate and fix docs

```bash
# Check all markdown files
cmr docs check

# Check specific file
cmr docs check README.md

# Check with specific rules only
cmr docs check -r typed-headers -r toc

# List all available rules
cmr config rules

# Preview validation results with verbose info
cmr docs check -v
```

---

### Guide: Manage submodules

```bash
# Status overview
cmr submodule status
cmr submodule list

# Update all submodule pointers
cmr submodule update --init --recursive

# Commit all pointer changes at once
cmr submodule commit -m "chore: update submodules"

# Run a command in every submodule (e.g. git pull)
cmr submodule foreach "git pull origin main"

# Run in parallel (4 groups)
cmr submodule foreach "git fetch" -j 4

# Skip template submodules, continue on error
cmr submodule foreach "git status" --continue-on-error --ignore-pattern ".template"
```

---

### Guide: GitHub issues workflow

```bash
# Plan issues locally (no GitHub call)
cmr repo issues plan -t "Fix auth bug" -l bug -m "3 - Building"

# Review local issues
cmr repo issues list --local

# Push all planned issues to GitHub
cmr repo issues push --all

# Pull open issues from GitHub
cmr repo issues pull

# Full list from GitHub
cmr repo issues list -s open
```

---

### Guide: Discover repositories

```bash
# Table of all repos in org
cmr org list

# Filter by type
cmr org list -s .topic
cmr org list -s .scaffold

# Tree view
cmr org tree

# Topic hierarchy
cmr org topic

# Stats
cmr org stats
```

---

## :hammer_and_wrench: Common Problems

- **Template not detected:** check `meta.json → repo.template` exists with a non-null value. Run `cmr repo template install <name>` to set it.
- **GitHub operations fail:** run `cmr config github` and authenticate with `gh auth login`.
- **Submodule drift:** run `cmr submodule status` to find detached HEADs or pointer mismatches, then `cmr submodule update`.
- **repair-origin fails at push step:** use SSH remote and ensure history is pushed with `refs/heads/*:refs/heads/*` (not `--mirror`).
- **Not in a repo context:** repo-scoped commands require `.chimera-lab/` directory. Run `cmr repo info` to verify context.
- **Unknown template after install:** `.chimera-lab/.template` may be a directory (submodule) — `detect` reads it as submodule reference, not text file.

## :books: References

- [:page_facing_up: ../../README.md](../../README.md)
- [:page_facing_up: ../STRUCTURE.md](../STRUCTURE.md)
- [:page_facing_up: ../ORGANIZATION.md](../ORGANIZATION.md)
