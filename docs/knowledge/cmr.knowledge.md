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
    - [:jigsaw: Render Pipeline](./#jigsaw-render-pipeline)
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
- `docs` — documentation: list, show, check, render, render clear, fix, headers, i18n, llm, agents, knowledge, prompts, skills, rules.
- `ls` — list files by documentation status.
- `meta` — repository metadata: show, validate, infer, init, get, set, missing, reset, expand, minimize.
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
| `cmr config show` | Show current configuration (`--json`, `--effective`, `--trace`) |
| `cmr config github` | Show GitHub backend status |
| `cmr config rules list` | List available validation rules |
| `cmr config headers list` | List all typed headers (`--json`) |
| `cmr config headers prompts` | Show LLM header prompt mappings |
| `cmr config org init` | Initialize organization settings |
| `cmr config org show` | Show organization settings |
| `cmr config org get <key>` | Get config field (dotted path) |
| `cmr config org set <key> <value>` | Set config field |
| `cmr config org edit` | Open settings in `$EDITOR` |
| `cmr config org validate` | Validate org settings against schema |
| `cmr config org reset` | Reset org settings to defaults |
| `cmr config org set-contact` | Set organization contact metadata |
| `cmr docs list` | List all markdown files (`-p/--pattern`, `--json`) |
| `cmr docs show <file>` | Render file in terminal (`--raw`, `--section`, `--no-directives`) |
| `cmr docs check [files...]` | Validate documentation (`-r/--rule`, `-x/--exclude`, `--json`, `--strict`) |
| `cmr docs render [files...]` | Resolve directives (`--apply`, `--overwrite`, `--skip`, `--output`, `--force`, `--concurrency`) |
| `cmr docs render clear [files...]` | Reset applied directives to pending state (`--apply`, `--types`, `--output`) |
| `cmr docs fix [files...]` | Auto-fix documentation issues (`--dry-run`, `-r/--rule`, `--emoji`) |
| `cmr docs headers validate [file]` | Validate typed headers (`--show-valid`) |
| `cmr docs headers list-typed` | List all typed header definitions (`--json`) |
| `cmr docs i18n list [files...]` | List i18n directives (`--json`) |
| `cmr docs i18n check [files...]` | Check i18n directive resolution (`--json`) |
| `cmr docs i18n locales` | List available locale files (`--json`) |
| `cmr docs llm list [files...]` | List LLM directives (`--json`) |
| `cmr docs llm context <file>` | Show LLM context for a directive (`-l/--line`, `--json`) |
| `cmr docs llm export <file>` | Export LLM context to file (`-o/--output`, `-l/--line`) |
| `cmr docs llm status` | Show LLM provider status (`--json`) |
| `cmr docs llm run <file>` | Run LLM on directive and optionally apply (`--apply`, `-l/--line`) |
| `cmr docs agents list` | List agent documents (`--json`) |
| `cmr docs agents show <name>` | Show agent document |
| `cmr docs agents install <name>` | Copy agent from org to repo `.github/agents/` |
| `cmr docs agents update <name>` | Overwrite existing agent from org source |
| `cmr docs knowledge list` | List knowledge documents (`--json`) |
| `cmr docs knowledge show <name>` | Show knowledge document |
| `cmr docs knowledge validate [name]` | Validate naming and frontmatter |
| `cmr docs prompts list` | List prompt documents (`--json`) |
| `cmr docs prompts show <name>` | Show prompt document |
| `cmr docs prompts install <name>` | Copy prompt from org to repo `.github/prompts/` |
| `cmr docs prompts update <name>` | Overwrite existing prompt from org source |
| `cmr docs skills list` | List skill documents (`--json`) |
| `cmr docs skills show <name>` | Show skill document |
| `cmr docs skills create <name>` | Scaffold new skill (`-d/--description`) |
| `cmr docs skills install <name>` | Copy skill from org to repo `.github/skills/` |
| `cmr docs rules list` | List all registered validation rules |
| `cmr ls [path]` | List directory contents by documentation status |
| `cmr meta show` | Show repository metadata (`--json`) |
| `cmr meta validate` | Validate metadata schema (`--json`) |
| `cmr meta infer` | Infer metadata from repository context (`--apply`, `--json`) |
| `cmr meta init` | Interactively populate missing metadata (`--important-only`, `--non-interactive`) |
| `cmr meta get <key>` | Get field value (dotted path, `--json`) |
| `cmr meta set <key> <value>` | Set a single metadata field |
| `cmr meta missing` | List missing or empty metadata fields (`--important-only`, `--json`) |
| `cmr meta reset` | Reset metadata to defaults (`--force`, `--infer`) |
| `cmr meta expand` | Expand metadata with all default values |
| `cmr meta minimize` | Remove empty/default values from metadata |
| `cmr org list` | List org repos (`-s/--suffix`, `-p/--pattern`, `-o/--output`: table/json/tree/graphml/md) |
| `cmr org tree` | Display repo hierarchy as tree |
| `cmr org topic` | List topic repos with hierarchy (`--depth`, `--path`) |
| `cmr org stats` | Show organization statistics (`-o/--output`) |
| `cmr org export` | Export full snapshot as JSON (`-s/--section`, `-o/--output`) |
| `cmr project list` | List all project repositories |
| `cmr project show <name>` | Show details for a specific project |
| `cmr project tree` | Show project hierarchy with member repos |
| `cmr repo info` | Show current repository information (`--json`) |
| `cmr repo init` | Bootstrap a chimera-lab repository |
| `cmr repo template install [tpl]` | Install template reference (`--submodule`, `--copy-docs`, `-f/--force`) |
| `cmr repo template uninstall` | Remove template reference |
| `cmr repo template detect` | Detect template and save to meta.json |
| `cmr repo template status` | Full template sync status |
| `cmr repo template show` | Show files in current template |
| `cmr repo template list` | List available templates in org |
| `cmr repo template diff` | Diff between template and repository (`--summary`, `--list-new-files`) |
| `cmr repo template clear` | Remove files not in template (`--dry-run`, `-p/--pattern`, `-y/--yes`) |
| `cmr repo template reset` | Reset files from template (`--dry-run`, `--overwrite`, `-y/--yes`) |
| `cmr repo template update` | Check for pending template updates |
| `cmr repo template upgrade` | Apply template updates to repository |
| `cmr repo template repair-origin` | Repair GitHub template origin |
| `cmr repo issues` | Manage GitHub issues |
| `cmr repo labels` | Manage repository labels |
| `cmr repo milestones` | Manage repository milestones |
| `cmr submodule list` | List submodules (`--json`, `--include-template`, `--fragment <spec>`) |
| `cmr submodule update` | Update all submodules (`--init`, `--recursive`) |
| `cmr submodule status` | Show submodule status |
| `cmr submodule sync` | Sync URLs from `.gitmodules` (`--recursive`) |
| `cmr submodule commit` | Stage and commit submodule pointer changes (`-m/--message`, `--dry-run`) |
| `cmr submodule foreach <cmd>` | Execute shell command in each submodule (`-j/--jobs`, `--recursive`, `--ignore-pattern`) |
| `cmr template sync-directives` | Inject missing CMR directive sections into README (`--path`, `--dry-run`) |
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

| Directive | Purpose | Key attributes |
|---|---|---|
| `var` | Inline value substitution from settings | `key` — dotted path in `.chimera-lab/settings.json` (e.g. `org.name`, `repo.name`) |
| `cmr` | Embed CLI command output as markdown | `cmd` — `group.subcommand[param=value,...]` (e.g. `org.stats`, `org.list[output=json]`) |
| `i18n` | Localized string from JSON locale file | `ref` — `locale.file.key`; resolves to `docs/lang/{locale}/{file}.json → key` |
| `fragment` | Include external file or section | `src` — `submodule@name/path`; `mode` — `content`, `section`, or `header` |
| `llm` | AI-generated content | `prompt` — LLM instruction string; rendered in a global batch session per `cmr docs render` run |
| `toc` | Auto-generated table of contents | No attributes; regenerated from current heading tree |
| `badges` | Render shields.io badges from config | `name` — comma-separated badge names defined in `.chimera-lab/settings.json`; optional `provider`, `style` overrides; org→repo merge |
| `link` | Expand a var key into a markdown link | `key` — var key for URL; `text` — display text or var key (`.` in value = var key lookup); `type` — URL scheme prefix; `icon` — emoji prefix |
| `code` | Inject variable declarations into fenced code blocks | `<var key="...">` children inside the directive declare variables to inject at top of the adjacent code block |

### :jigsaw: Layout Directives

Layout directives are block-level and support nesting. They render dynamic content from JSON data produced by nested `<cmr>` children that must use `output=json`.

**`<list>`** — renders a markdown list. Attributes: `order` (`ordered`|`unordered`), `text` (binding expression for label), `link` (optional URL binding).

**`<table>`** — renders a GFM pipe table. Each attribute (except `applied`) defines a column whose value is a binding expression.

**`<card>`** — renders a set of section headers with optional links, descriptions, and badges per item.

| Attribute | Required | Description |
|---|---|---|
| `header` | yes | Heading text per item (rendered as `### Header` or linked heading) |
| `link` | no | URL per item; if on same row as `header` via layout, wraps heading in link |
| `context` | no | Description text per item |
| `repo` | no | `owner/repo` GitHub slug for badge generation |
| `badges` | no | Comma-separated badge types: `license`, `last-commit`, `issues`, `stars` (requires `repo`) |
| `layout` | no | Row layout: comma separates rows; pipe joins fields on the same row. Default: `"header,context,link"` |
| `level` | no | Heading level 1–6 (default: `"3"`) |

All layout directives wrap `<data name="X">` children. **Binding syntax**: `variable.*.field` iterates all items; `variable.0.field` accesses by index; `items.* | count()` returns array length.

```markdown
<!-- <card header="items.*.name" link="items.*.url" repo="items.*.github_slug" badges="license,last-commit" layout="header|link,badges,context" applied> -->
<!-- <data name="items"> -->
<!-- <cmr cmd="submodule.list[output=json]" applied> -->…<!-- </cmr> -->
<!-- </data> -->
…rendered cards…
<!-- </card> -->
```

### :jigsaw: Render Pipeline

`cmr docs render` executes phases in order. Use `--skip <type>` to omit phases; `.template`-type repos auto-skip `llm` via policy (override with `--force`).

| Phase | Directive types resolved | `--skip` key |
|---|---|---|
| 0 — Layout | `list`, `table`, `card` | `layout` |
| 0b — Badges | `badges` | `badges` |
| 0.9 — Link | `link` | `link` |
| 1 — Var | `var` | `vars` |
| 1.5 — Code | `code` | `code` |
| 2 — i18n | `i18n` | `i18n` |
| 3 — Fragment | `fragment` | `fragment` |
| 4 — CMR (flat) | `flat-cmr` (standalone `<cmr>`) | `cmr` |
| 5 — LLM | `llm` | `llm` |
| 6 — TOC | `toc` (re-parses from updated content) | `toc` |

**Key flags**: `--apply` writes files (default is dry-run); `--overwrite` re-renders already-applied directives; `--output` prints to stdout; `--concurrency <n>` sets parallel file workers (default: 4); `--force` bypasses policy-level phase skips.

**`cmr docs render clear [files...]`** — resets applied directives back to pending state. Strips `applied` from opening tags and replaces rendered body with a `` `directive: <tag>` `` placeholder. `table`, `list`, and `card` preserve their inner `<data>` structure. `var` is cleared inline (no placeholder). `--types <types...>` selects which directive types to clear (default: all — `badges`, `llm`, `flat-cmr`, `fragment`, `toc`, `table`, `list`, `card`, `var`).

### :jigsaw: Directive Lifecycle

1. **Pending** — no `applied` attribute, body is empty.
2. `cmr docs render` resolves each pending directive. **Dry-run is the default** — use `--apply` to write files.
3. Re-render with `--overwrite` to refresh already-applied directives (except `llm` by default).
4. `cmr docs check` reports pending directives as errors or warnings depending on rule config.
5. `cmr docs render clear --apply` resets applied directives back to pending (use before template sync or bulk re-render).

**`submodule list` JSON fields** (accessible via `submodule.list[output=json]` in `<cmr>` directives):

| Field | Description |
|---|---|
| `name` | Submodule name from `.gitmodules` |
| `path` | Relative path |
| `url` | Remote URL (raw) |
| `hash` | Pinned commit hash |
| `http_link` | `https://host/owner/repo/tree/<hash>` (null if unresolvable) |
| `github_slug` | `"owner/repo"` extracted from HTTPS URL (null if not GitHub) |
| `description` | First paragraph of `--fragment` section (null if not found) |

## :world_map: Guides

```bash
# Discover
cmr org list                         # Table view
cmr org tree                         # Hierarchy
cmr org export                       # Full JSON snapshot

# Documentation workflow
cmr docs check                       # Validate all
cmr docs render                      # Dry-run: preview
cmr docs render --apply              # Write resolved directives
cmr docs render --overwrite --apply  # Re-render already-applied
cmr docs render --skip llm --apply   # Skip LLM phase
cmr docs render clear --apply        # Reset all directives to pending
cmr docs fix --apply                 # Apply auto-fixes

# Docs subgroups
cmr docs headers validate            # Validate typed headers
cmr docs headers list-typed          # List all typed header definitions
cmr docs llm run README.md --apply   # Run LLM on pending directives
cmr docs agents install developer    # Install agent from org
cmr docs skills create my-skill -d "Description"

# Metadata
cmr meta show
cmr meta init
cmr meta set description "…"
cmr meta get repo.name

# Template operations
cmr repo template diff               # Check sync status
cmr repo template upgrade            # Apply updates
cmr repo template clear --dry-run    # Preview files to remove
cmr template sync-directives         # Inject missing directive sections

# Submodules
cmr submodule list --json            # JSON with name/hash/http_link/github_slug
cmr submodule foreach -j 8 -- "cmr docs render --apply"
```

## :hammer_and_wrench: Common Problems

- If GitHub operations fail, run `cmr config github` and authenticate with `gh auth login`.
- Ensure you are inside a repository with `.chimera-lab/` metadata for repo-scoped commands.
- Use `--help` on any command to inspect arguments and flags.
- After building from source, run `pnpm --filter @chimera-lab/cli build` before using `cmr`.
- `badges` directive stays pending if no badge definitions exist in `.chimera-lab/settings.json`.
- `.template`-type repos auto-skip `llm` phase — use `--force` to override.

## :books: References

- [:page_facing_up: ../../README.md](../../README.md)
- [:page_facing_up: ../STRUCTURE.md](../STRUCTURE.md)
- [:page_facing_up: ../ORGANIZATION.md](../ORGANIZATION.md)
