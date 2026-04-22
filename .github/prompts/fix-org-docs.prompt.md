---
agent: writer
description: Unify and fix documentation across the entire chimera-lab organization
---

# Fix Organization Documentation

## Objective

Fix all `cmr docs check` errors and warnings across the entire organization (super-repo + all submodules) so every repo passes with 0 errors, 0 warnings.

## CLI Reference

Use these commands to get context at runtime — do NOT rely on hardcoded lists:

```bash
cmr docs headers list-typed     # show all valid typed headers with emoji
cmr docs rules list             # show all validation rules with severity
cmr docs check                  # validate current repo
cmr docs fix                    # auto-fix (TOC, broken links, H2 emoji, typed header renames)
cmr docs fix --dry-run          # preview without writing
cmr repo template diff --list-new-files   # show docs/files that exist in repo but not in template
cmr submodule foreach <cmd>     # run command in each submodule (excludes .template by default)
cmr submodule foreach --recursive <cmd>  # include nested submodules
```

## CLI Formatting Tags (Directives)

When editing docs, preserve and use CLI directives with the official syntax only.

### Directive types

- TOC directive: `<!-- toc -->`
- LLM directive: `<!-- llm<prompt> -->`
- LLM applied marker: `<!-- llm<prompt;applied> -->`
- Tag directive: `<!-- llm<tags:name> -->`
- i18n directive: `<!-- i18n<locale.file.key> -->`
- Fragment directive: `<!-- fragment<source#anchor> -->`
- CMR directive: `<!-- cmr:<group.command[key=value,...]> -->`

### Usage rules for the model

1. Do not invent new directive syntaxes.
2. Prefer unresolved directives in source/template docs; `;applied` should appear only after render output.
3. Use LLM directives for narrative content and CMR directives only for generated inventories/lists.
4. Keep existing directive lines unless they are invalid; fix invalid syntax instead of removing directives.
5. If a section is template-driven, preserve directive placeholders and refactor surrounding content around them.

### Validate directives during fixes

```bash
cmr docs check --tags
cmr docs render <file> --fail-on-unresolved
cmr docs check <file>
```

For batch verification:

```bash
cmr submodule foreach --recursive --continue-on-error "cmr docs check --tags"
```

## Rules

1. **MUST fix ALL errors AND warnings** — both must reach 0.
2. **DO NOT suppress/ignore** — no `allowCustomHeaders`, no `--exclude`, no frontmatter hacks, no disabling rules. Actually fix the document.
3. **DO NOT modify CLI source** (`original.topic/chimera-lab-cli.app/`)
4. **DO NOT destroy content** — restructuring preserves ALL information.
5. **TEST after every fix** — run `cmr docs check` to verify. If `cmr docs fix` produces bad output, revert with `git checkout -- .` and fix manually.
6. **UNIFY docs with the template structure** — prefer the documentation files that come from the repo template; repo-specific content should be merged/refactored into those files instead of keeping extra parallel docs.

## Fix Strategy

### 1. Discover current state

```bash
cmr docs check                                          # super-repo
cmr repo template diff --list-new-files                 # repo files not present in template
cmr submodule foreach --recursive "cmr docs check"      # all submodules
```

### 2. Auto-fix what CLI handles

```bash
cmr docs fix --dry-run    # preview first
cmr docs fix              # apply
cmr docs check            # TEST: errors must decrease, not increase
```

If CLI made things worse → `git checkout -- .` and fix manually.

### 3. Rework docs to match template structure

Before keeping or editing extra docs, compare the repo against the template:

```bash
cmr repo template diff --list-new-files
```

Rules for extra documentation files (`docs/`, `knowledge/`, `skills/`, `prompts/`, etc.) that exist in the repo but not in the template:

- Prefer the file set defined by the template as the canonical structure
- Refactor repo-specific content into the corresponding template files whenever possible
- Keep the same information, but move/merge it into template-aligned files instead of preserving extra parallel files
- Treat the template as the structural baseline and the repo as the content customization layer
- Do not let the number of documentation files grow beyond the current template-aligned structure unless there is a clear, unavoidable reason

Goal: the repo should end with the same documentation file shapes/patterns as the template, but with repo-specific content inside those files rather than in extra files.

### 4. Manual restructuring for remaining validation errors

For files with custom H2 headers not in the typed registry (`cmr docs headers list-typed`):

- Map each custom H2 to the closest typed header category
- Demote domain-specific content to H3 under the typed H2
- Think of typed headers as **categories** that contain your content as subsections

| Custom Header Pattern | Map To |
|---|---|
| Intro/title sections | `## :telescope: Overview` |
| Body content (multiple sections) | `## :world_map: Guides` with H3 subsections |
| References, contacts, links | `## :books: References` |
| Warnings, disclaimers | `## :warning: Warnings` |
| Requirements, obligations | `## :clipboard: Requirements` |
| Notes, temporary info | `## :notebook: Notes` |
| Structure info | `## :building_construction: Structure` |
| Definitions | `## :mag: Terminology` |

### 5. Final validation

```bash
cmr docs fix              # update TOC after manual changes
cmr docs check --tags     # validate tag directives/submodule tagging state
cmr docs check            # MUST be 0 errors, 0 warnings
```

## Execution Loop

```bash
# For each failing repo:
cd <repo-path>
cmr docs check            # record initial state
cmr repo template diff --list-new-files   # identify extra docs to merge/refactor
cmr docs fix --dry-run    # preview
cmr docs fix              # apply if safe
cmr docs check --tags     # directive/tag validation
cmr docs check            # TEST
# manual fixes for remaining issues...
cmr docs check            # TEST after EACH file
cmr docs fix && cmr docs check   # final pass (TOC update + verify)
```

Iterate all submodules:
```bash
cmr submodule foreach --recursive --continue-on-error "cmr docs fix && cmr docs check"
```

## Acceptance Criteria

- Every repo passes `cmr docs check` with **0 errors AND 0 warnings**
- No suppression mechanisms (no `allowCustomHeaders`, no `--exclude`, no ignore)
- No content loss — all information preserved (reorganized under typed headers)
- Repo docs are unified against the template structure using `cmr repo template diff --list-new-files`
- Extra repo docs are merged/refactored into template-provided docs where possible, instead of remaining as parallel files
- Documentation file count does not grow beyond the template-aligned structure without strong justification
- Documents remain readable and logically organized
- CLI was tested during the process (not blindly trusted)
