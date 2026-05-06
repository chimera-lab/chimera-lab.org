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
  - [:jigsaw: Components](./#jigsaw-components)
    - [:jigsaw: Flat Directives](./#jigsaw-flat-directives)
    - [:jigsaw: Layout Directives](./#jigsaw-layout-directives)
    - [:jigsaw: Directive Lifecycle](./#jigsaw-directive-lifecycle)
  - [:world_map: Guides](./#world_map-guides)
  - [:hammer_and_wrench: Common Problems](./#hammer_and_wrench-common-problems)
  - [:books: References](./#books-references)

## :telescope: Overview

The CMR CLI (`cmr`) automates chimera-lab.org repositories managing documentation validation, rendering directives, metadata, milestones, issues, labels, and git operations for submodules and templates. It unifies discovery, GitHub resources, template workflows, and metadata management.

## :triangular_ruler: Technologies

- TypeScript/Node.js monorepo (`packages/core`, `packages/services`, `packages/rules`, `packages/cli`).
- Run `cmr --help` to verify the entry point after building (`pnpm build`).
- Optional GitHub auth: prefer `gh auth login`; fallback token via `CHIMERA_LAB_CLI_GITHUB_API`.

## :building_construction: Structure

### :building_construction: Command Groups

- `config` — repository and organization configuration, rules listing, typed headers.
- `docs` — documentation: list, show, check, render, fix, headers, i18n, llm, agents, knowledge, prompts, skills, rules.
- `ls` — list files by documentation status.
- `meta` — repository metadata: show, validate, infer, init, set, missing, reset, expand, minimize.
- `org` — organization-wide discovery (list, tree, topic, stats, export).
- `project` — project repository discovery (list, show, tree).
- `repo` — repository operations (info, init, template, issues, labels, milestones).
- `submodule` — git submodule management (list, update, status, sync, commit, foreach).
- `template` — template operations (sync-directives).
- `utils` — cache, metric, graph, schema utilities.
- `wd` — working directory navigation.
- `cd` — fuzzy-navigate to a repository.

### :building_construction: Commands & Subcommands

| Command | Description |
|---|---|
| `cmr config show` | Show current configuration |
| `cmr config github` | Show GitHub backend status |
| `cmr config rules list` | List available validation rules |
| `cmr config headers` | Typed headers configuration |
| `cmr config org` | Organization configuration |
| `cmr config repo` | Repository configuration |
| `cmr config init` | Interactively fill missing settings |
| `cmr config set <key> <value>` | Set a single settings field |
| `cmr config missing` | List missing or empty settings fields |
| `cmr config fields` | List all known settings fields |
| `cmr docs list` | List all markdown files in repository |
| `cmr docs show <file>` | Render a markdown file in the terminal |
| `cmr docs check [files...]` | Validate documentation (--tags, --rule, --exclude, --json, --strict) |
| `cmr docs render [files...]` | Resolve directives in markdown (--overwrite, --skip, --apply, --output) |
| `cmr docs fix [files...]` | Auto-fix documentation issues |
| `cmr docs headers` | Header validation commands |
| `cmr docs i18n` | i18n operations |
| `cmr docs llm` | LLM context building operations |
| `cmr docs agents` | Manage AI agent documents |
| `cmr docs knowledge` | Manage knowledge base documents |
| `cmr docs prompts` | Manage prompt template documents |
| `cmr docs skills` | Manage skill documents |
| `cmr docs rules list` | List all registered validation rules |
| `cmr ls [path]` | List directory contents by documentation status |
| `cmr meta show` | Show repository metadata |
| `cmr meta validate` | Validate metadata schema |
| `cmr meta infer` | Infer metadata from repository context |
| `cmr meta init` | Interactively populate missing metadata |
| `cmr meta set <key> <value>` | Set a single metadata field |
| `cmr meta missing` | List missing or empty metadata fields |
| `cmr meta reset` | Reset metadata to defaults |
| `cmr meta expand` | Expand metadata with all default values |
| `cmr meta minimize` | Remove empty/default values from metadata |
| `cmr org list` | List org repos (table, JSON, tree, graphml) |
| `cmr org tree` | Display repo hierarchy as tree |
| `cmr org topic` | List topic repos with hierarchy |
| `cmr org stats` | Show organization statistics |
| `cmr org export` | Export full organization snapshot as JSON |
| `cmr project list` | List all project repositories |
| `cmr project show <name>` | Show details for a specific project |
| `cmr project tree` | Show project hierarchy with member repos |
| `cmr repo info` | Show current repository information |
| `cmr repo init` | Bootstrap a chimera-lab repository |
| `cmr repo template install <tpl>` | Install template reference |
| `cmr repo template uninstall` | Remove template reference |
| `cmr repo template detect` | Detect and save template to meta.json |
| `cmr repo template status` | Full template status |
| `cmr repo template show` | Show files available in template |
| `cmr repo template list` | List available templates in organization |
| `cmr repo template diff` | Diff between template and repository |
| `cmr repo template reset` | Reset documentation from template |
| `cmr repo template update` | Check for pending template updates |
| `cmr repo template upgrade` | Apply template updates to repository |
| `cmr repo template repair-origin` | Repair GitHub template origin |
| `cmr repo issues` | Manage GitHub issues |
| `cmr repo labels` | Manage repository labels |
| `cmr repo milestones` | Manage repository milestones |
| `cmr submodule list` | List repository submodules |
| `cmr submodule update` | Update all submodules |
| `cmr submodule status` | Show submodule status |
| `cmr submodule sync` | Sync submodule URLs from .gitmodules |
| `cmr submodule commit` | Stage and commit submodule pointer changes |
| `cmr submodule foreach <cmd>` | Execute a shell command in each submodule |
| `cmr template sync-directives` | Inject missing required CMR directives into README |
| `cmr utils cache` | Cache management |
| `cmr utils metric` | Statistical metrics |
| `cmr utils graph` | Visual graph generation |
| `cmr utils schema` | JSON schema generation and validation |
| `cmr wd org` | Show organization path |
| `cmr wd repo` | Show repo path for current directory |
| `cmr cd <query>` | Fuzzy-navigate to a repository |

## :jigsaw: Components

Directives are HTML-comment markers embedded in markdown files. `cmr docs render` resolves them; `cmr docs check` validates pending ones. All directives are paired: an opening tag and a closing tag. A directive is **pending** when the body between the tags is empty; **applied** when the `applied` attribute is present in the opening tag.

```text
Pending:  <!-- <type attr="value"> --><!-- </type> -->
Applied:  <!-- <type attr="value" applied> -->body<!-- </type> -->
```

### :jigsaw: Flat Directives

Flat directives are single-level (non-nesting). They are resolved in order during `cmr docs render`.

| Directive | Purpose | Syntax example |
|---|---|---|
| `var` | Inline value substitution from settings | `<!-- <var key="org.name"> --><!-- </var> -->` |
| `cmr` | Embed CLI command output | `<!-- <cmr cmd="org.stats"> -->

`directive: <cmr cmd="org.stats">`

<!-- </cmr> -->` |
| `i18n` | Localized string from JSON locale file | `<!-- <i18n ref="pt.global.intro"> --><!-- </i18n> -->` |
| `fragment` | Include external file content | `<!-- <fragment src="submodule@name/path" mode="content"> -->

`directive: <fragment src="submodule@name/path" mode="content">`

<!-- </fragment> -->` |
| `llm` | AI-generated content | `<!-- <llm prompt="Overview"> -->

`directive: <llm prompt="Overview">`

<!-- </llm> -->` |
| `toc` | Auto-generated table of contents | `<!-- <toc> -->

`directive: <toc>`

<!-- </toc> -->` |

**`var` key** resolves against `.chimera-lab/settings.json`. Example keys: `org.name`, `org.url`, `repo.name`.

**`cmr` cmd** format is `group.subcommand[param=value,...]`. Example: `org.list[output=json]`, `project.list[output=json]`.

**`fragment` modes**: `content` (body only), `section` (from heading to next heading), `header` (heading line only).

**`i18n` ref** format is `locale.file.key`. Resolves to `docs/lang/{locale}/{file}.json → key`.

### :jigsaw: Layout Directives

Layout directives are block-level and support nesting. They render dynamic lists or tables from JSON data produced by nested `<cmr>` subcommands that must use `output=json`.

**`<list>`** — renders a markdown list. Attributes: `order` (`ordered`|`unordered`), `text` (binding expression for label), `link` (optional URL binding).

**`<table>`** — renders a GFM pipe table. Each attribute (except `applied`) defines a column whose value is a binding expression.

Both wrap `<data name="X">` children that declare named variables in scope for bindings.

```markdown
<!-- <list order="unordered" text="topics.*.name" link="topics.*.url"> -->
  <!-- <data name="topics"> -->
    <!-- <cmr cmd="org.topic[output=json]"> -->

`directive: <cmr cmd="org.topic[output=json]">`

<!-- </cmr> -->
  <!-- </data> -->
<!-- </list> -->
```

**Binding syntax**: `variable.*.field` iterates all items; `variable.0.field` accesses by index. Helper: `items.* | count()` returns the array length.

### :jigsaw: Directive Lifecycle

1. **Pending** — no `applied` attribute, body is empty.
2. `cmr docs render` resolves each pending directive and writes the output. **Dry-run is the default** — use `--apply` to write files.
3. Re-render with `--overwrite` to refresh already-applied directives (except `llm` by default).
4. `cmr docs check` reports pending directives as errors or warnings depending on rule config.
5. `cmr docs render --skip <type>` skips specific types: `vars`, `i18n`, `fragment`, `cmr`, `llm`, `toc`, `layout`.
6. `cmr docs render --output` (no value) prints rendered content to **stdout** instead of writing to disk.

## :world_map: Guides

```bash
cmr org list                    # Table view
cmr org tree                    # Tree hierarchy
cmr org export                  # Full JSON snapshot

# Manage documentation
cmr docs list                   # All markdown files
cmr docs check                  # Validate all
cmr docs check README.md        # Validate file
cmr docs check --tags           # Check tag directives
cmr docs render                 # Dry-run: preview rendered output (default)
cmr docs render --apply         # Write resolved directives to files
cmr docs render --output        # Print rendered output to stdout
cmr docs render --overwrite --apply  # Re-render already-applied + write
cmr docs render --skip layout --apply  # Skip specific types + write
cmr docs fix                    # Preview auto-fixes (dry-run default)
cmr docs fix --apply            # Apply auto-fixes to files

# Metadata
cmr meta show                   # Show current metadata
cmr meta init                   # Fill missing fields interactively
cmr meta set description "…"    # Set single field

# Template operations
cmr repo template diff          # Check sync status
cmr repo template upgrade       # Apply updates
cmr template sync-directives    # Inject missing directives

# GitHub resources
cmr repo issues list
cmr repo milestones list
cmr repo labels list

# Submodules
cmr submodule foreach -j 8 -- "cmr docs render"
```

## :hammer_and_wrench: Common Problems

- If GitHub operations fail, run `cmr config github` and authenticate with `gh auth login`.
- Ensure you are inside a repository with `.chimera-lab/` metadata for repo-scoped commands.
- Use `--help` on any command to inspect arguments and flags.
- After building the CLI from source, run `pnpm --filter @chimera-lab/cli build` before using `cmr`.

## :books: References

- [:page_facing_up: ../../README.md](../../README.md)
- [:page_facing_up: ../STRUCTURE.md](../STRUCTURE.md)
- [:page_facing_up: ../ORGANIZATION.md](../ORGANIZATION.md)
