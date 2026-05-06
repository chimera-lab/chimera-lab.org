---
description: Validate and fix context files (agents, prompts, knowledge) and documentation files following Chimera Lab conventions
---

# Fix Context & Docs Prompt

## Purpose

Fix all issues in:

- **Context files** (`.github/agents/`, `.github/prompts/`, `docs/knowledge/`) — naming, structure, content, and reference correctness.
- **Documentation files** (`docs/`, `.github/docs/`, `docs/knowledge/`) — validation errors, template alignment, and content quality.

## Documentation Philosophy

**Docs vs Knowledge**:
- **Knowledge** (`docs/knowledge/`): AI-optimized, concise (< 200 lines), quick reference for CLI commands, modules, patterns.
- **Docs** (`docs/`, `.github/docs/`): Human-friendly, detailed but focused, practical examples.

Docs provide depth; knowledge provides breadth. Docs must not duplicate knowledge — reference it instead.

---

## CMR CLI Reference

Use these commands at runtime — do NOT hardcode lists:

```bash
# show all valid typed headers with emoji
cmr docs headers list-typed
# show all validation rules with severity
cmr docs rules list
# validate current repo
cmr docs check
# auto-fix (TOC, broken links, H2 emoji, typed header renames)
cmr docs fix
# preview without writing
cmr docs fix --dry-run
# show all files that exist in repo but NOT in its template
cmr repo template diff --list-new-files
# show the template's canonical file structure
cmr repo template show
# run command in each submodule (excludes .template by default)
cmr submodule foreach -j 16 <cmd>
# include nested submodules
cmr submodule foreach -j 16 --recursive <cmd>
```

---

## CMR Formatting Directives

Directives are **paired HTML comments** written in template-level files. `cmr docs render` resolves them in strict phase order, producing the repo-level (instance) document. Do not invent new directive syntaxes. Do not use the old `<!-- llm<prompt> -->` style — it is deprecated.

### Directive preference order

Use directives in this order — do **not** default to `<llm>` for everything:

1. `<var>` — org/repo metadata (name, description, url, type)
2. `<badges>` — status badges
3. `<cmr:...>` — structured dynamic data (repo lists, tables, stats)
4. `<fragment>` — reusing content blocks from other docs
5. `<llm prompt="Namespace.Section">` — **last resort**: only for prose where no structured source exists. Use qualified names (e.g., `Overview`, `Architecture.Components`). Never for structured data.

### Rendering pipeline (template → repo)

```text
Template file (source)
  │
  ├─ 1. layout + badges    <!-- <badges name="brand"> --><!-- </badges> -->
  ├─ 2. vars               <!-- <var key="org.name"> --><!-- </var> -->
  ├─ 3. i18n               <!-- <i18n key="en.global.intro"> --><!-- </i18n> -->
  ├─ 4. fragment           <!-- <fragment src="./docs/api.md#Overview"> --><!-- </fragment> -->
  ├─ 5. cmr                <!-- <cmr:org.list> --><!-- </cmr> -->
  ├─ 6. llm                <!-- <llm prompt="Overview"> --><!-- </llm> -->
  └─ 7. toc                <!-- toc -->
       │
       └─ Rendered output (repo-level file, directives have applied attribute)
```

**Template = structure + unresolved directives. Repo = rendered output with content injected.**

Selective rendering: `cmr docs render --apply --skip llm,toc` skips specified phases.

### Canonical directive syntax

#### `<var>` — Template variables

```markdown
<!-- <var key="org.name"> --><!-- </var> -->               ← pending
<!-- <var key="org.name" applied> -->chimera-lab<!-- </var> -->  ← applied
```

| Key | Source |
|-----|--------|
| `org.name` | Organization directory name |
| `repo.name` | `meta.json → repo.name` or directory basename |
| `repo.type` | `meta.json → repo.type` |
| `repo.description` | `meta.json → repo.description` |

#### `<badges>` — Status badges

```markdown
<!-- <badges name="brand"> --><!-- </badges> -->
<!-- <badges name="license,last-commit,issues,stars" layout="inline"> --><!-- </badges> -->
```

#### `<toc>` — Table of contents

```markdown
<!-- toc -->
```

Auto-generated from heading structure. Run `cmr docs fix` to regenerate after manual edits.

#### `<i18n>` — Internationalization

```markdown
<!-- <i18n key="en.global.intro"> --><!-- </i18n> -->
```

#### `<fragment>` — Content composition

Inlines external markdown sections. Primary mechanism for composing docs from shared sources.

```markdown
<!-- <fragment src="./docs/api.md#Overview"> --><!-- </fragment> -->
```

#### `<llm>` — AI content generation

```markdown
<!-- <llm prompt="Overview"> -->
directive: <llm prompt="Overview">
<!-- </llm> -->
```

- Template files: always leave as unresolved (no `applied` attribute).
- Rendered repo files: `applied` attribute is added automatically by the renderer.
- Use qualified prompt names matching typed header categories (e.g., `Overview`, `Architecture.Components`, `Installation`).

#### `<cmr:...>` — CLI output embedding

Embeds live `cmr` command output. Do not hand-write content this directive can generate.

```markdown
<!-- <cmr:org.list> --><!-- </cmr> -->
<!-- <cmr:org.list[suffix=app]> --><!-- </cmr> -->
<!-- <cmr:org.stats> --><!-- </cmr> -->
<!-- <cmr:project.list> --><!-- </cmr> -->
<!-- <cmr:project.tree> --><!-- </cmr> -->
```

### Directive usage rules

1. Do not invent new directive syntaxes.
2. Template/source files must have unresolved directives — `applied` attribute only appears in rendered output.
3. Use `<llm>` for narrative prose only; use `<cmr:...>` for inventories, tables, and lists.
4. Keep existing directive lines unless invalid; fix invalid syntax instead of removing.
5. If a section is template-driven, preserve directive placeholders and refactor surrounding content around them.

Validate directives:

```bash
cmr docs check <file>     # validate after each manual change
cmr docs fix --dry-run    # preview TOC and header fixes
```

---

## Rules (Non-Negotiable)

1. **Fix ALL errors AND warnings** — both must reach 0.
2. **DO NOT suppress** — no `allowCustomHeaders`, no `--exclude`, no frontmatter hacks. Actually fix the document.
3. **DO NOT modify CLI source** (`original.topic/chimera-lab-cli.app/`).
4. **DO NOT destroy content** — restructuring preserves ALL information.
5. **TEST after every fix** — run `cmr docs check`. If `cmr docs fix` makes things worse, revert with `git checkout -- .` and fix manually.
6. **Align to template** — use `cmr repo template show` to see the canonical file structure. Extra files found in `cmr repo template diff --list-new-files` must be refactored into template-provided files, not kept as parallel files.
7. **Escalate unresolvable errors** — if `cmr docs check` reports an error with no clear fix after two attempts, stop and report: the error message, the file, and what was tried. Do not loop indefinitely.

---

## Validation Rules

### Agents (`.agent.md`)

- Contains only information for its specific function; shared info goes to knowledge.
- Has Role, Main Goal, Limitations, and Operational Instructions sections.
- Named `lowercase-with-hyphens.agent.md`.
- References only `docs/knowledge/` files.

### Prompts (`.prompt.md`)

- Contains only task-specific information; shared info goes to knowledge.
- Valid frontmatter: `agent` and `description` fields required.
- Named `lowercase-with-hyphens.prompt.md`.
- References only `docs/knowledge/` files.

#### Prompt quality evaluation

When reviewing or rewriting any `.prompt.md` or `.agent.md`, score each indicator before and after the fix:

| # | Indicator | What it measures |
|---|---|---|
| 1 | **Purpose clarity** | The model knows exactly what to do and in what scope |
| 2 | **Completeness** | Covers all necessary scenarios without gaps |
| 3 | **Precision** | Concrete instructions that leave no room for guessing |
| 4 | **Actionability** | The model can execute without extra inference |
| 5 | **Internal consistency** | No contradictions; cross-references between sections are explicit |
| 6 | **Grounding** | Real examples/commands that anchor abstract instructions |
| 7 | **Scope control** | Explicit guardrails against over/under-doing |
| 8 | **Failure handling** | Clear paths for when things go wrong (rollback, escalation) |
| 9 | **Navigability** | Sequential flow; sections don't require jumping back |
| 10 | **Token efficiency** | No verbosity or unnecessary duplication |

Score each: ✅ Strong / ⚠️ Partial / ❌ Weak. All must reach ✅ before the file is considered fixed. Report the score and list specific fix actions for any gap.

### Knowledge (`.knowledge.md`)

- AI-optimized, concise (< 200 lines), structured for quick lookup.
- Self-contained — no references to other files.
- Named `lowercase-with-hyphens.knowledge.md`.

### Documentation files (`docs/`, `.github/docs/`)

- Focused on development guidance and workflows; no temporary status reports.
- Does not duplicate knowledge content — references knowledge files instead.
- Named `UPPER_CASE.md` for major docs, `lowercase-with-hyphens.md` for supporting docs.
- Uses typed H2 headers (`cmr docs headers list-typed`).
- Passes `cmr docs check` with 0 errors, 0 warnings.

---

## Execution

> **CRITICAL**: Call `manage_todo_list` with the items below **before reading the Steps**. Execute one item at a time; mark each complete before moving to the next.

### TODO

Each item maps to the numbered Step in this section. Follow in order.

```
1.  [ ] Discover: run cmr docs check (super-repo)                          → Step 1
2.  [ ] Discover: run cmr repo template show (canonical template structure) → Step 1
3.  [ ] Discover: run cmr repo template diff --list-new-files (extra files) → Step 1
4.  [ ] Discover: list .github/agents/, .github/prompts/, docs/knowledge/  → Step 1
5.  [ ] Auto-fix: cmr docs fix --dry-run, review, apply                    → Step 2
6.  [ ] Refactor: for each extra file, apply C→B→A→D to reach template compliance → Step 3
7.  [ ] Fix: manual restructuring for remaining cmr docs check errors       → Step 4
8.  [ ] Fix: context files (agents, prompts, knowledge)                    → Step 5
9.  [ ] Validate: cmr docs check (MUST be 0 errors, 0 warnings)            → Step 6
10. [ ] Validate: submodules                                               → Step 6
```

**Steps below expand each TODO item in detail.**

---

### Step 1: Discover current state

```bash
# super-repo validation baseline
cmr docs check
# see canonical template file structure
cmr repo template show
# files in repo that do NOT exist in template
cmr repo template diff --list-new-files
# all submodules baseline
cmr submodule foreach -j 16 --recursive "cmr docs check"
```

### Step 2: Auto-fix

```bash
# preview first
cmr docs fix --dry-run
# apply
cmr docs fix
# TEST: errors must decrease, not increase
cmr docs check
```

If CLI made things worse → `git checkout -- .` and fix manually.

### Step 3: Refactor extra docs to comply with template structure

**Goal**: After this step the repo's file structure must match the template. Every file produced by `cmr repo template diff --list-new-files` is a structural deviation. The default outcome for each file is **elimination through merge or deletion**. Keeping is the exception, not the default.

Before making destructive changes, create a checkpoint:

```bash
# checkpoint before deletions and merges
git add -A && git stash push -m "pre-refactor checkpoint"
# to restore if something goes wrong: git stash pop
```

List the canonical template files now so you know where content can land:

```bash
cmr repo template show
```

The template files are the **only valid merge targets** (e.g., `ARCHITECTURE.md`, `CONTRIBUTING.md`, `DEVELOPMENT.md`, `ORGANIZATION.md`, `ROADMAP.md`, `STRUCTURE.md`, `README.md`, knowledge files). Any content that belongs in the repo must fit into one of these.

For **each file** listed by `cmr repo template diff --list-new-files`, work through this decision tree **in order — stop at the first rule that applies**:

**C. Is the file a temporary artefact?**
- Matches any of: `*-status.md`, `*-inventory.md`, `*-analysis.md`, `*-validation.md`, `*-report.md`, `*-gate.md`, `*-consolidation.md`, or marked "Working Document" / "Draft" / "Snapshot".
- **Delete without merging** — temporary artefacts have no place in long-term docs.
- Run `cmr docs check` after deletion.

**B. Does the file contain content that already exists in a knowledge file?**
- Compare content against `docs/knowledge/`. If it duplicates what is already there, delete it and add a reference link in the relevant template file instead.
- Run `cmr docs check` after deletion.

**A. Can the file's content be merged into a template file?**
- This is the primary path for files that survive C and B.
- Read `cmr repo template show` and identify the closest template file by topic:
  - Architecture, design decisions → `ARCHITECTURE.md`
  - Contribution workflow, process rules → `CONTRIBUTING.md`
  - Development environment, tooling → `DEVELOPMENT.md`
  - Organization structure, naming, conventions → `ORGANIZATION.md` or `STRUCTURE.md`
  - Future work, planning → `ROADMAP.md`
  - GitHub-specific rules, CI rules → `CONTRIBUTING.md` or `DEVELOPMENT.md`
  - Reference material, quick lookup → appropriate `docs/knowledge/*.knowledge.md`
- Merge the content as a new `### Section` under the appropriate typed H2 in that target file.
- Delete the extra file after merging.
- Run `cmr docs fix` on the target file, then `cmr docs check`.

**D. The file has no template equivalent AND its content cannot fit anywhere?**
- This is a **last resort** that requires explicit justification. Apply only when:
  1. You have checked every template file from `cmr repo template show` and none can absorb the content.
  2. The content is actively referenced by other files (verify with `grep -r "filename" .`).
  3. The content is unique and necessary — not covered by any knowledge file.
- If all three conditions hold: keep the file, add a `> **Why this file exists**: <reason>` block to its Overview section, and note it in the step output.
- If the file is so important it must exist permanently, it is a candidate to be added to the template itself — note this for a future `cmr repo template update`.

**Invariants:**
- File count in `docs/` must not exceed the template baseline after this step unless explicitly justified via D.
- Content is never destroyed — it is moved, merged, or referenced.
- After every action (merge, delete, or D-keep), run `cmr docs check` on affected files.
- Report each file's decision (C/B/A/D) and the result in your step output.

### Step 4: Manual restructuring for validation errors

For files with custom H2 headers not in the typed registry (`cmr docs headers list-typed`):

- Map each custom H2 to the closest typed header category.
- Demote domain-specific content to H3 under the typed H2.

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

### Step 5: Fix context files

For each agent, prompt, and knowledge file found in Step 1:

- **Naming**: correct extension and format.
- **Frontmatter**: valid YAML, required fields present.
- **Structure**: agents have Role/Goal/Limitations/Instructions; prompts have Purpose and steps; knowledge has clear sections.
- **References**: agents and prompts reference only `docs/knowledge/`; knowledge is self-contained.
- **Duplication**: extract repeated information to knowledge; update references.

### Step 6: Final validation

```bash
# update TOC after manual changes
cmr docs fix
# MUST be 0 errors, 0 warnings
cmr docs check
```

Submodules:

```bash
cmr submodule foreach -j 16 --recursive --continue-on-error "cmr docs fix && cmr docs check"
```

---

## Acceptance Criteria

- `cmr docs check` passes with **0 errors AND 0 warnings** per repo.
- No suppression mechanisms used.
- No content destroyed — all information preserved or merged.
- Extra files from `cmr repo template diff --list-new-files` are resolved (merged, referenced, or deleted).
- File count does not exceed template baseline without documented justification.
- Context files pass naming, structure, and reference rules.
- CLI was tested during the process, not blindly trusted.
