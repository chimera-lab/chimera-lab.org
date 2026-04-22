---
name: cmr
description: CMR CLI tool knowledge and usage patterns
---

# :file_folder: CMR CLI Knowledge

## :book: Table of Contents

- [:file_folder: CMR CLI Knowledge](./#file_folder-cmr-cli-knowledge)
  - [:telescope: Overview](./#telescope-overview)
  - [:triangular_ruler: Technologies](./#triangular_ruler-technologies)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Command Groups](./#building_construction-command-groups)
    - [:building_construction: Commands & Subcommands](./#building_construction-commands-subcommands)
  - [:world_map: Guides](./#world_map-guides)
  - [:hammer_and_wrench: Common Problems](./#hammer_and_wrench-common-problems)
  - [:books: References](./#books-references)

## :telescope: Overview

The CMR CLI (`cmr`) automates {{org.name}} repositories managing documentation validation, milestones, issues, labels, and git operations for submodules and templates. It unifies discovery, GitHub resources, and template workflows.

## :triangular_ruler: Technologies

- Requires Python 3.8+ and an editable install from the CLI source (`pip install -e .`).
- After installation run `cmr --help` to verify entry points.
- Optional GitHub auth: prefer `gh auth login`; fallback token via `CHIMERA_LAB_CLI_GITHUB_API`.

## :building_construction: Structure

### :building_construction: Command Groups

- `config` repository and organization configuration.
- `docs` unified documentation: list, validate, fix, agents, knowledge, prompts.
- `ls` list files by documentation status.
- `org` organization-wide discovery (table, json, tree, graphml).
- `repo` repository operations (init, status, issues, milestones, labels, templates).
- `submodules` git submodule management.
- `utils` cache and graph utilities.
- `wd` working directory navigation.

### :building_construction: Commands & Subcommands

| Command | Description |
|---|---|
| `cmr config org` | Manage organization configuration |
| `cmr config repo` | Manage repository configuration |
| `cmr config github status` | Show GitHub auth status |
| `cmr docs list` | List docs by category with filtering |
| `cmr docs check` | Validate documentation |
| `cmr docs fix` | Auto-fix documentation issues |
| `cmr docs agents` | Manage AI agents: list, show, install, update, validate |
| `cmr docs knowledge` | Manage knowledge base: list, show, install, update |
| `cmr docs prompts` | Manage prompt templates: list, show, install, update |
| `cmr ls` | List files by documentation status |
| `cmr org list` | List org repos (table, JSON, tree, graphml) |
| `cmr org topic` | Show topic repos with hierarchy |
| `cmr org tree` | Display repo hierarchy tree |
| `cmr repo init` | Initialize org structure in existing repo |
| `cmr repo deinit` | Remove org structure |
| `cmr repo status` | Show repo status and org config |
| `cmr repo issues` | Manage GitHub issues |
| `cmr repo milestones` | List or create milestones |
| `cmr repo labels` | List or manage labels |
| `cmr repo template list` | Show template files (local and remote) |
| `cmr repo template diff` | Check template synchronization |
| `cmr repo template update` | Apply template updates |
| `cmr repo template reset` | Reset docs from template |
| `cmr submodules` | Manage git submodules |
| `cmr utils cache` | Cache maintenance: stats, invalidate, clear |
| `cmr utils graph template` | Template usage statistics |
| `cmr wd org` | Show organization path |
| `cmr wd repo` | Show repo path for current directory |

## :world_map: Guides

```bash
# Discover repositories
cmr org list          # Table view
cmr org tree          # Tree hierarchy

# Manage documentation
cmr docs list -c agents     # List agents
cmr docs check              # Validate all
cmr docs check README.md    # Validate file
cmr docs fix --dry-run      # Preview fixes

# GitHub resources
cmr repo issues list
cmr repo milestones list
cmr repo labels list
```

## :hammer_and_wrench: Common Problems

- If GitHub operations fail, run `cmr config github status` and authenticate with `gh auth login`.
- Ensure you are inside a repository with `.chimera-lab/` metadata for repo-scoped commands.
- Use `--help` on any command to inspect arguments and flags.

## :books: References

- [:page_facing_up: ../../README.md](../../README.md)
- [:page_facing_up: ../STRUCTURE.md](../STRUCTURE.md)
- [:page_facing_up: ../ORGANIZATION.md](../ORGANIZATION.md)
