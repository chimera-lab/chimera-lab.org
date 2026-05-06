---
agent: developer
description: 'Close documentation for a template repo to reach its first version (v0.0.1).'
---

# :file_folder: Plan Docs

## :book: Table of Contents

- [:file_folder: Plan Docs](./#file_folder-plan-docs)
  - [:telescope: Overview](./#telescope-overview)
    - [Strategy: skeleton-first](./#strategy-skeleton-first)
  - [:clipboard: Requirements](./#clipboard-requirements)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Pre-flight](./#world_map-pre-flight)
    - [:world_map: Gap checklist (universal — apply to every template except repository.template)](./#world_map-gap-checklist-universal-apply-to-every-template-except-repositorytemplate)
      - [Required files (must exist at v0)](./#required-files-must-exist-at-v0)
      - [`TEMPLATE.md` structure](./#templatemd-structure)
      - [Differences vs parent template](./#differences-vs-parent-template)
    - [:world_map: Phase 1 — Structure planning](./#world_map-phase-1-structure-planning)
    - [:world_map: Phase 2 — Directive planning](./#world_map-phase-2-directive-planning)
      - [Phase 2b — LLM prompt config](./#phase-2b-llm-prompt-config)
    - [:world_map: Directive best practices](./#world_map-directive-best-practices)
    - [:world_map: Render sequence](./#world_map-render-sequence)
    - [:world_map: Validation](./#world_map-validation)
    - [:world_map: Commit and propagate](./#world_map-commit-and-propagate)
    - [:world_map: Workflow](./#world_map-workflow)
    - [:world_map: Output](./#world_map-output)
  - [:warning: Warnings](./#warning-warnings)
  - [:books: References](./#books-references)
  - [:dart: Skills](./#dart-skills)

## :telescope: Overview

Plan and build the documentation structure for a single template repo so it reaches its **first version** (typically `v0.0.1`). The work has two sequential phases:

1. **Structure planning** — use `cmr utils graph docs structure` to analyse the target template, compare it against its parent template, and produce a concrete list of structural changes to apply (sections to add, remove, or reorder across all docs files).
2. **Directive planning** — once the target structure is agreed, assign the correct directive type (`<var>`, `<llm>`, `<cmr:…>`, `<fragment>`, `<list>`, `<table>`) to every section in that structure.

Apply one repo at a time, always working from the root of the hierarchy downward — a template at any tier (0, 1, 2, 3, …) must wait for **all ancestors** to be merged before it runs.

The target version is inferred from context in this order:
1. `package.json` → `version`
2. `.chimera-lab/meta.json` → `repo.version`
3. `CHANGELOG.md` → most recent version entry
4. Fallback: `v0.0.1`

### Strategy: skeleton-first

Template repos keep directives as **pending placeholders** — no LLM content applied. The goal is structure (typed headers + directives), not rendered content. Consumers render content when they instantiate the template.

A valid v0 skeleton has:
- All required files present (see gap checklist).
- Typed H2 headers throughout (`cmr docs headers list-typed` for the valid set).
- `<!-- <llm prompt="Section"> -->` pending directives for all prose sections.
- `<!-- <var key="org.name"> -->` pending directives for all metadata placeholders.
- TOC updated (`<!-- toc -->` resolved).
- `make cmr-check` passes with zero errors.
- Differences vs parent template justified and documented in `TEMPLATE.md`.

## :clipboard: Requirements

- **Target repo** must be provided as argument (e.g. `package.template`).
- The parent template must already be **committed, pushed, and merged into `main`** before running this on a derived template. `cmr repo template update` pulls from the remote — if the parent is not merged, the child will not receive the changes.
- Report any CMR CLI bugs or friction found during execution in `temp/CMR_PROBLEMS.md` if it exists, otherwise note them in the output.

## :world_map: Guides

### :world_map: Pre-flight

Before touching any file, discover current state from context:

```bash
# 1. Discover own tier and parent chain
cat .chimera-lab/meta.json | grep -E 'template|parent|tier'
# The `template.parent` field names the direct parent template repo.
# Trace the chain upward until you reach a repo with no parent — that is Tier 0.
# Example chain: laravel_docker_scaffold.template → scaffold.template → repository.template
# (Tier 2)                                           (Tier 1)            (Tier 0)

# 2. Confirm ALL ancestors are already merged into main on GitHub before proceeding.
#    If any ancestor is not yet merged, STOP and report which ancestor is blocking.

# 3. Infer target version
cat package.json 2>/dev/null | grep '"version"'        # check package.json first
cat .chimera-lab/meta.json 2>/dev/null | grep 'version' # fallback to meta.json

# 4. Sync from parent template (pulls from remote main of parent)
cmr repo template update

# 5. Review what changed
cmr repo template diff

# 6. Compare header structure with parent template
#    Run this inside the repo directory (not the org root — known bug: crawls submodules).
cmr utils graph docs structure
#    Then compare against the parent template:
cmr utils graph docs structure --repo <path-to-parent-template>
#    Use the diff to spot: missing sections, mismatched h2/h3 depth, unlabelled headers.

# 7. Check current validation state
make cmr-check
```

### :world_map: Gap checklist (universal — apply to every template except repository.template)

Verify each item and fix if missing:

| Gap | Check | Fix |
|-----|-------|-----|
| `TEMPLATE.md` absent | `ls TEMPLATE.md` | Create — see structure below |
| `DEVELOPMENT.md` missing h3s | `grep "^### " DEVELOPMENT.md` | Run `cmr repo template update` (h3s inherited from repository.template) |
| `docs/ARCHITECTURE.md` missing `:jigsaw: Components` | `grep "Components" docs/ARCHITECTURE.md` | Add `## :jigsaw: Components` with `<!-- <llm prompt="Architecture.Components"> --><!-- </llm> -->` |
| `CHANGELOG.md` has `org.name` pending var | `grep "org.name" CHANGELOG.md` | `cmr docs render --apply --skip llm,toc,fragment,cmr,i18n,link,badges,layout,code` |

#### Required files (must exist at v0)

```
README.md, LICENSE, CHANGELOG.md, CONTRIBUTING.md, CODE_OF_CONDUCT.md,
SECURITY.md, AGENTS.md, DEVELOPMENT.md, Makefile, TEMPLATE.md
docs/ARCHITECTURE.md, docs/STRUCTURE.md, docs/ORGANIZATION.md, docs/ROADMAP.md
```

Verify: `cmr repo template diff` — missing files appear as "not in repo".

#### `TEMPLATE.md` structure

Create with at minimum:
- **`:telescope: Overview`** — what this template is for and what type of repo it produces.
- **`:inbox_tray: Installation`** — how to instantiate (e.g., `cmr repo init --template <name>` or GitHub "Use this template").
- **`:building_construction: Structure`** — what makes this template different from its parent (extra files, overridden sections).
- **`:books: References`** — derived templates (children) and parent template.

#### Differences vs parent template

Before building the skeleton, run `cmr repo template diff` and `cmr utils graph docs structure` and decide for each delta:
- **Inherited verbatim** — keep as-is from parent.
- **Extended** — parent file with extra sections specific to this type.
- **Replaced** — parent file completely rewritten for this type (document why in `TEMPLATE.md`).
- **New** — file that doesn't exist in parent (document in `TEMPLATE.md`).

Document the justified differences in `TEMPLATE.md` under `:building_construction: Structure`.

### :world_map: Phase 1 — Structure planning

Run `cmr utils graph docs structure` **inside the target template repo** (not from the org root — known bug: crawls submodules) and compare against the parent:

```bash
# Inside the target template repo:
cmr utils graph docs structure

# Inside the parent template repo:
cmr utils graph docs structure
```

For each docs file, produce a **structural diff table** listing every section by file, current state, and recommended action:

| File | Section | Current | Action | Reason |
|------|---------|---------|--------|--------|
| `docs/ARCHITECTURE.md` | `:jigsaw: Components` | missing | add | required by all non-root templates |
| `DEVELOPMENT.md` | `:toolbox: Running Tests` (h3) | missing | add | inherited from repository.template |
| … | … | … | … | … |

Only proceed to Phase 2 after this table is complete and every action is justified.

### :world_map: Phase 2 — Directive planning

With the target structure confirmed, assign a directive to every section that requires generated content. Apply the directive preference order — do **not** default to `<llm>` for everything:

1. `<var key="...">` — for org/repo metadata (name, description, url, type)
2. `<!-- <list> -->` / `<!-- <table> -->` + `<!-- <cmr:...> -->` — for structured dynamic data (file lists, issue tables)
3. `<!-- <cmr:...> -->` (flat) — for single-value dynamic outputs
4. `<!-- <fragment> -->` — for reusing content blocks from other docs
5. `<!-- <llm prompt="Namespace.Section"> -->` — **last resort**: only for prose narrative where no structured CMR source exists. Use qualified names (`<TemplateName>.<DocName>.<Section>`). Never for structured data.

Produce a **directive plan table** before writing any file:

| File | Section | Directive type | Key / Prompt |
|------|---------|----------------|--------------|
| `docs/ARCHITECTURE.md` | `:jigsaw: Components` | `<llm>` | `Scaffold.Architecture.Components` |
| `CHANGELOG.md` | version heading | `<var>` | `org.name` |
| … | … | … | … |

Apply the changes only after the plan is reviewed.

#### Phase 2b — LLM prompt config

Every `<llm prompt="…">` directive references a key that must exist in the repo's LLM prompt config. These keys are stored in `.chimera-lab/config.json` under `llm.headerPrompts` and are managed with `cmr config repo`:

```bash
# Inspect current headerPrompts for the repo
cmr config repo get llm.headerPrompts

# Add or update a prompt entry (use the same key as the <llm prompt="…"> directive)
cmr config repo set llm.headerPrompts.<Key> "<natural-language instruction for the LLM>"

# Or edit .chimera-lab/config.json directly if adding multiple entries at once
```

For every `<llm>` row in the directive plan table, verify a matching `headerPrompts` entry exists. If the entry is missing or its instruction does not match the section's intent, update it before committing. The config change must be committed alongside the docs changes — the directive and its prompt config are a pair.

### :world_map: Directive best practices

See **Phase 2 — Directive planning** above for the full preference order and planning table format.

### :world_map: Render sequence

Template repos keep directives **pending** — do not run `cmr docs render --apply` (that would resolve directives and commit rendered content, which is wrong for a template). The render sequence here is for inspection and cleanup only:

```bash
# Reset any accidentally applied directives back to pending
cmr docs render clear --apply

# Preview what the rendered output would look like (stdout only, no files written)
cmr docs render --output
```

After reviewing the output, commit with directives in **pending** state. Consumers apply them when instantiating.

### :world_map: Validation

```bash
make cmr-check
# Runs: cmr-check-config + cmr-check-meta + cmr-check-docs + cmr-check-template + cmr-check-resources

# Individual checks if needed:
cmr docs check --strict
cmr repo template diff --summary
```

### :world_map: Commit and propagate

Ask permition to commit and push the changes to the template repo. This must be done before running `cmr repo template upgrade` on derived repos, which pulls from the remote.

```bash
# Stage and commit after asking user for confirmation.
git add -A
git commit -m "docs: v0 skeleton — <template-name>"
git push origin main

# GATE: merge must land in main on GitHub before proceeding to derived templates.
# Only after merge:
cmr repo template upgrade   # propagate to direct derived repos
```

### :world_map: Workflow

1. Infer target version from context (`package.json`, `.chimera-lab/meta.json`, `CHANGELOG.md`, fallback `v0.0.1`).
2. Run pre-flight commands above (sync from parent, check validation state).
3. **Phase 1 — Structure planning**: run `cmr utils graph docs structure` on target and parent, produce the structural diff table, get confirmation before proceeding.
4. **Phase 2 — Directive planning**: produce the directive plan table for the confirmed structure, get confirmation before writing files.
5. Fix all gaps from the gap checklist and apply the planned structure + directives.
6. Run render sequence.
7. Run `make cmr-check` — resolve all errors.
8. Commit + push + merge in `main` (gate before `cmr repo template upgrade`).
9. Run `cmr repo template upgrade` in each direct derived repo.
10. Report any CMR bugs or friction found.

### :world_map: Output

- Inferred version used (e.g. `v0.0.1`).
- `make cmr-check --strict` passes with zero errors.
- Commit hash and message.
- List of derived repos that received `cmr repo template upgrade`.
- Any CMR bugs or friction found during execution.

## :warning: Warnings

- Do not use `--force` on render commands.
- Do not modify `.chimera-lab/.template/` files directly — they are managed by CMR.
- Do not advance to a derived template before the parent is merged into `main` on GitHub.
- Do not overuse `<llm>` — use it only for prose where no structured CMR source exists.
- If `cmr repo template upgrade` produces unexpected changes, inspect with `cmr repo template diff` before committing.

## :books: References

- [:page_facing_up: ../../temp/CMR_PROBLEMS.md](../../temp/CMR_PROBLEMS.md)
- [:dart: code](../skills/code/SKILL.md)
- [:dart: review](../skills/review/SKILL.md)

## :dart: Skills

- [:dart: code](../skills/code/SKILL.md)
- [:dart: review](../skills/review/SKILL.md)
