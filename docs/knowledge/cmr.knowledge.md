---
name: cmr
description: CMR CLI tool knowledge and usage patterns
---

# :file_folder: CMR CLI Knowledge

## :book: Table of Contents

- [:file_folder: CMR CLI Knowledge](./#file_folder-cmr-cli-knowledge)
  - [:book: Table of Contents](./#book-table-of-contents)
  - [:telescope: Overview](./#telescope-overview)
  - [:triangular_ruler: Technologies](./#triangular_ruler-technologies)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Command Groups](./#building_construction-command-groups)
    - [:building_construction: Commands & Subcommands](./#building_construction-commands-subcommands)
      - [:building_construction: cmr config](./#building_construction-cmr-config)
        - [:building_construction: cmr config org](./#building_construction-cmr-config-org)
        - [:building_construction: cmr config repo](./#building_construction-cmr-config-repo)
        - [:building_construction: cmr config github status](./#building_construction-cmr-config-github-status)
      - [:building_construction: cmr docs](./#building_construction-cmr-docs)
        - [:building_construction: cmr docs list](./#building_construction-cmr-docs-list)
        - [:building_construction: cmr docs validate](./#building_construction-cmr-docs-validate)
        - [:building_construction: cmr docs fix](./#building_construction-cmr-docs-fix)
        - [:building_construction: cmr docs agents](./#building_construction-cmr-docs-agents)
        - [:building_construction: cmr docs knowledge](./#building_construction-cmr-docs-knowledge)
        - [:building_construction: cmr docs prompts](./#building_construction-cmr-docs-prompts)
      - [:building_construction: cmr ls](./#building_construction-cmr-ls)
      - [:building_construction: cmr org](./#building_construction-cmr-org)
        - [:building_construction: cmr org list](./#building_construction-cmr-org-list)
        - [:building_construction: cmr org topic](./#building_construction-cmr-org-topic)
        - [:building_construction: cmr org tree](./#building_construction-cmr-org-tree)
      - [:building_construction: cmr repo](./#building_construction-cmr-repo)
        - [:building_construction: cmr repo init](./#building_construction-cmr-repo-init)
        - [:building_construction: cmr repo deinit](./#building_construction-cmr-repo-deinit)
        - [:building_construction: cmr repo status](./#building_construction-cmr-repo-status)
        - [:building_construction: cmr repo issues](./#building_construction-cmr-repo-issues)
        - [:building_construction: cmr repo milestones](./#building_construction-cmr-repo-milestones)
        - [:building_construction: cmr repo labels](./#building_construction-cmr-repo-labels)
        - [:building_construction: cmr repo template](./#building_construction-cmr-repo-template)
        - [:building_construction: cmr repo template list](./#building_construction-cmr-repo-template-list)
        - [:building_construction: cmr repo template validate](./#building_construction-cmr-repo-template-validate)
        - [:building_construction: cmr repo template update](./#building_construction-cmr-repo-template-update)
        - [:building_construction: cmr repo template reset](./#building_construction-cmr-repo-template-reset)
      - [:building_construction: cmr submodules](./#building_construction-cmr-submodules)
      - [:building_construction: cmr utils](./#building_construction-cmr-utils)
        - [:building_construction: cmr utils cache](./#building_construction-cmr-utils-cache)
        - [:building_construction: cmr utils graph template](./#building_construction-cmr-utils-graph-template)
      - [:building_construction: cmr wd](./#building_construction-cmr-wd)
        - [:building_construction: cmr wd org](./#building_construction-cmr-wd-org)
        - [:building_construction: cmr wd repo](./#building_construction-cmr-wd-repo)
  - [:world_map: Guides](./#world_map-guides)
    - [:compass: Step: Discover repositories](./#compass-step-discover-repositories)
    - [:compass: Step: Manage documentation](./#compass-step-manage-documentation)
    - [:compass: Step: GitHub resources](./#compass-step-github-resources)
  - [:hammer_and_wrench: Common Problems](./#hammer_and_wrench-common-problems)
  - [:books: References](./#books-references)

## :telescope: Overview

The CMR CLI (`cmr`) automates chimera-lab repositories managing documentation validation, milestones, issues, labels, and git operations for submodules and templates. It unifies discovery, GitHub resources, and template workflows.

## :triangular_ruler: Technologies

- Requires Python 3.8+ and an editable install from the CLI source.
- After installation run `cmr --help` to verify entry points.
- Optional GitHub auth: prefer `gh auth login`; fallback token via `CHIMERA_LAB_CLI_GITHUB_API`.

```bash
source chimera-lab-cli.app/.venv/bin/activate
pip install -e .
cmr --help
cmr config github status
```

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

#### :building_construction: cmr config

##### :building_construction: cmr config org

- Manage organization configuration files and settings.

##### :building_construction: cmr config repo

- Manage repository-level configuration and metadata.

##### :building_construction: cmr config github status

- Show GitHub backend selection and authentication status.

#### :building_construction: cmr docs

##### :building_construction: cmr docs list

List documentation files by category with filtering options.

##### :building_construction: cmr docs validate

Validate documentation with flexible category selection and single-file support.

##### :building_construction: cmr docs fix

Auto-fix documentation issues.

##### :building_construction: cmr docs agents

Manage AI agents: `list`, `show`, `install`, `update`, `validate`.

##### :building_construction: cmr docs knowledge

Manage knowledge base: `list`, `show`, `install`, `update`.

##### :building_construction: cmr docs prompts

Manage prompt templates: `list`, `show`, `install`, `update`.

#### :building_construction: cmr ls

- List files grouped by documentation status.

#### :building_construction: cmr org

##### :building_construction: cmr org list

- List organization repositories (table, JSON, tree, graphml).

##### :building_construction: cmr org topic

- Show topic repositories with hierarchy.

##### :building_construction: cmr org tree

- Display repository hierarchy tree.

#### :building_construction: cmr repo

##### :building_construction: cmr repo init

- Initialize chimera-lab structure in an existing repository.

##### :building_construction: cmr repo deinit

- Remove chimera-lab structure (use `--keep-metadata` to retain settings).

##### :building_construction: cmr repo status

- Show repository status and chimera-lab configuration.

##### :building_construction: cmr repo issues

- Manage GitHub issues via the selected backend (list/create/etc.).

##### :building_construction: cmr repo milestones

- List or create milestones for planning.

##### :building_construction: cmr repo labels

- List or manage labels defined for the repository.

##### :building_construction: cmr repo template

- Access template operations for the current repository.

##### :building_construction: cmr repo template list

- Show template files for the current repository (local and remote info).

##### :building_construction: cmr repo template validate

- Check synchronization between repository files and template sources.

##### :building_construction: cmr repo template update

- Apply template updates, including variables and submodule handling.

##### :building_construction: cmr repo template reset

- Reset documentation from the template (use `--overwrite` to replace files).

#### :building_construction: cmr submodules

- Manage git submodules tracked by chimera-lab.

#### :building_construction: cmr utils

##### :building_construction: cmr utils cache

- Cache maintenance: `stats`, `invalidate`, `clear`.

##### :building_construction: cmr utils graph template

- Show template usage statistics across repositories.

#### :building_construction: cmr wd

- Print working directory context.

##### :building_construction: cmr wd org

- Show organization path configured for the workspace.

##### :building_construction: cmr wd repo

- Show repository path for the current working directory.

## :world_map: Guides

### :compass: Step: Discover repositories

```bash
cmr org list # Table view
cmr org tree # Tree hierarchy
```

### :compass: Step: Manage documentation

```bash
cmr docs list -c agents     # List agents
cmr docs validate           # Validate all
cmr docs validate README.md # Validate file
cmr docs fix --dry-run      # Preview fixes
```

### :compass: Step: GitHub resources

```bash
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
