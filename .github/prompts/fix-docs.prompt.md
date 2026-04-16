---
agent: technical-writer
description: Validate and improve documentation files for chimera-lab-cli following CLI documentation conventions
---

# Fix Docs Prompt

## Purpose

This prompt validates and improves documentation files in `.github/docs/` to ensure they follow chimera-lab-cli CLI documentation conventions, maintain appropriate detail level, and complement knowledge files effectively.

## Documentation Philosophy

**Docs vs Knowledge**:
- **Knowledge** (`docs/knowledge/`): AI-optimized, concise (< 200 lines), quick reference for CLI commands, modules, patterns
- **Docs** (`.github/docs/`): Human-friendly, detailed but focused, practical examples for CLI development

**Key Principle**: Docs provide depth for CLI architecture and development workflows, not exhaustive command catalogs. Reference knowledge for quick command lookup.

## Validation Rules

### Documentation Files

**Content Requirements**:
- Focused on CLI development guidance and workflows
- Examples show command implementation patterns (Typer, Rich, Pydantic)
- Clear structure with logical sections
- References knowledge files for command reference
- No temporary status reports or outdated information

**Naming Requirements**:
- Descriptive names in UPPER_CASE.md for major docs (e.g., `ARCHITECTURE.md`, `CLI_GUIDELINES.md`)
- Lowercase-with-hyphens for supporting docs (e.g., `python-migration-guide.md`)
- Clear purpose from filename alone

**Cross-Reference Requirements**:
- Must include quick reference to equivalent knowledge file at top
- Can reference other docs when providing detailed workflows
- Can reference project files (e.g., `src/cmrlab/`) when explaining structure
- Should NOT duplicate knowledge file content

**Content Balance**:
- ✅ CLI development workflows and patterns
- ✅ Practical command implementation examples
- ✅ Architecture explanations (Typer, Walker, Pydantic)
- ✅ Integration guides (GitHub API, Git operations)
- ❌ Exhaustive command catalogs (use references instead)
- ❌ Command/module lists (summarize, don't list all)
- ❌ Temporary status reports
- ❌ Duplicate knowledge file content

## Execution Workflow

**CRITICAL**: Before starting any work, you MUST use `manage_todo_list` tool to create a complete task plan.

---

## Validation Process

### Step 0: Information Gathering (MANDATORY FIRST STEP)

**Before validation, complete the information gathering phase:**

1. **Discover all files**:
   - List all files in `.github/docs/`
   - List all files in `docs/knowledge/`
   - Note file types and purposes

2. **Read and catalog**:
   - Read each doc file (note length, structure, topics)
   - Identify main documentation files vs supporting files
   - Note which knowledge files exist for cross-reference

3. **Map relationships**:
   - Which docs reference knowledge files (correctly)?
   - Which docs reference non-existent files?
   - Which docs duplicate knowledge content?
   - Which docs lack cross-references?

4. **Identify issues**:
   - Temporary/status files (delete candidates)
   - Exhaustive catalogs (should reference instead)
   - Missing cross-references to knowledge
   - Outdated or duplicate information

---

### Step 1: Content Type Validation

For each file in `.github/docs/`:

**Classify file type**:
- **Core Documentation**: Major guides (ARCHITECTURE, CLI_GUIDELINES, DEVELOPMENT, ORGANIZATION_STRUCTURE, etc.)
- **Supporting Documentation**: Migration guides, specific patterns
- **Status/Temporary**: Reports, inventories, analysis (DELETE candidates)

**Validation by type**:

#### Core Documentation
- ✅ Has cross-reference to knowledge file at top (e.g., "Quick reference: `docs/knowledge/commands.knowledge.md`")
- ✅ Focuses on CLI architecture, patterns, and workflows
- ✅ Examples show Typer commands, Pydantic models, Walker usage
- ✅ Explains Python/CLI concepts thoroughly
- ❌ Does NOT list every command exhaustively (references knowledge instead)
- ❌ Does NOT duplicate command syntax tables from knowledge

**Expected Core Files**:
- `ARCHITECTURE.md` - CLI technical architecture
- `DEVELOPMENT.md` - Development workflow and setup
- `CLI_GUIDELINES.md` - Command implementation standards
- `ORGANIZATION_STRUCTURE.md` - Repository conventions
- ✅ Provides detailed workflows and explanations
- ✅ Examples are focused and practical
- ✅ Length is justified by content depth
- ❌ Does not export exhaustive lists
- ❌ Does not duplicate knowledge content

#### Supporting Documentation
- ✅ Clear, specific purpose
- ✅ References core docs when needed
- ✅ Concise and actionable
- ❌ Not outdated or temporary

#### Status/Temporary Files
- ❌ **Should be deleted** (e.g., `*-status.md`, `*-inventory.md`, `*-analysis.md`)
- Exception: Templates for issues/PRs are acceptable

---

### Step 2: Content Quality Validation

For each documentation file:

1. **Structure Check**:
   - Clear hierarchy (H1 → H2 → H3)
   - Logical section flow
   - Table of contents if > 300 lines
   - Examples are properly formatted

2. **Cross-Reference Check**:
   - Has quick reference to knowledge at top: `> 💡 Quick Reference: see [file.knowledge.md](../../docs/knowledge/file.knowledge.md)`
   - References to other docs are valid
   - References to project files are accurate
   - No broken links

3. **Content Depth Check**:
   - **Appropriate Detail** (✅):
     - Explains "how" and "why"
     - Provides context and rationale
     - Shows practical examples
     - Describes workflows step-by-step

   - **Excessive Detail** (❌):
     - Lists all tokens (summarize instead: "See tokens.knowledge.md for complete list")
     - Lists all components (summarize: "See catalog.knowledge.md")
     - Exports entire configs (show representative samples)
     - Duplicates knowledge file content verbatim

4. **Examples Check**:
   - Examples are realistic and practical
   - Code samples are complete but concise
   - Variants/options summarized, not exhaustively listed
   - Each example has clear purpose

---

### Step 3: Knowledge Integration Check

For each doc file, verify:

1. **Has Cross-Reference**: Top of file links to relevant knowledge
   ```markdown
   > 💡 **Quick Reference**: For AI-optimized reference, see [system.knowledge.md](../../docs/knowledge/system.knowledge.md)
   ```

2. **Complements Knowledge**: Doc provides depth knowledge doesn't
   - Knowledge: "Token system has 3 layers"
   - Doc: "Here's how to use the 3-layer system in practice [detailed workflow]"

3. **Doesn't Duplicate Knowledge**: Doc references instead of repeating
   - ❌ Don't: Copy token list from knowledge
   - ✅ Do: "For token reference, see tokens.knowledge.md. Here's how to use tokens in components..."

---

### Step 4: Cleanup and Organization

Identify files to:

**DELETE** (Temporary/Status files):
- `*-status.md` - Status reports
- `*-inventory.md` - Inventories that duplicate catalog.knowledge.md
- `*-analysis.md` - Temporary analysis documents
- `*-roadmap.md` - Outdated roadmaps
- Any file marked as "Working Document" or "Draft"

**KEEP** (Essential docs):
- Major documentation (ARCHITECTURE, STYLING, COMPONENT_GUIDELINES, etc.)
- Templates (issue templates, PR templates)
- README.md (documentation index)
- Specialized guides (TESTING, DEVELOPMENT, API)

**UPDATE** (Missing cross-references):
- Add knowledge cross-references at top
- Update README to mention knowledge files
- Fix broken references

---

## Output Format

### For Each File Validated

```markdown
## File: {filename}

### Classification: [CORE | SUPPORTING | TEMPORARY]

### Status: [KEEP | DELETE | NEEDS IMPROVEMENT]

### Issues Found:
- [ ] Issue description
- [ ] Issue description

### Suggested Changes:
1. Add cross-reference to {knowledge-file}
2. Reduce exhaustive list of {items} to summary
3. Update broken link to {file}

### Improvement Actions:
- **Add**: Cross-reference at top
- **Reduce**: Section {X} is too exhaustive, summarize
- **Remove**: Duplicate content from knowledge
- **Update**: Broken references
```

### Summary Report

```markdown
## Validation Summary

**Total Files Checked**: X

**Classification**:
- Core Documentation: X files
- Supporting Documentation: X files
- Temporary/Status: X files

**Actions Required**:
- DELETE: X files (list files)
- NEEDS IMPROVEMENT: X files
- GOOD: X files

**Common Issues**:
- Missing cross-references: X files
- Exhaustive catalogs: X files
- Duplicate knowledge content: X files
- Broken references: X files

### Priority Actions:
1. Delete temporary files: [list]
2. Add cross-references to: [list]
3. Reduce exhaustive content in: [list]
```

---

## Common Issues to Check

### ❌ Delete Candidates
- Status reports (`design-system-documentation-status.md`)
- Analysis documents (`webcomponent-analysis.md`)
- Inventories that duplicate knowledge (`component-inventory.md` when `catalog.knowledge.md` exists)
- Outdated roadmaps
- Working documents not finalized

### ❌ Content Issues
- **Exhaustive Catalogs**: Lists all tokens, components, or configs
  - Fix: Summarize and reference knowledge
- **Duplicate Knowledge**: Repeats knowledge file content verbatim
  - Fix: Remove and reference knowledge file
- **Missing Context**: Examples without explanation
  - Fix: Add practical context and use cases
- **Broken Structure**: Poor hierarchy, missing TOC
  - Fix: Reorganize with clear sections

### ✅ Good Documentation Patterns
- Starts with cross-reference to knowledge
- Explains workflows step-by-step
- Shows practical, focused examples
- References other docs and knowledge appropriately
- Has clear purpose and audience
- Length justified by content depth

---

## Execution Steps

### 1. Planning Phase
Use `manage_todo_list` tool:
```markdown
1. Discover all docs and knowledge files
2. Read and classify each doc
3. Check cross-references and links
4. Identify delete candidates
5. Check content depth and duplication
6. Generate validation report
```

### 2. Execute Validation
- Classify each file
- Check structure and cross-references
- Identify content issues
- Note delete candidates

### 3. Generate Report
- List files by classification
- Document issues found
- Provide specific improvement actions
- Prioritize actions (delete, update, improve)

---

## Success Criteria

✅ **Documentation Structure**:
- All core docs have cross-references to knowledge
- No temporary/status files remain
- README.md lists both docs and knowledge
- All references are valid

✅ **Content Quality**:
- Docs provide depth, not catalogs
- Examples are focused and practical
- No duplication of knowledge content
- Clear structure and navigation

✅ **Integration**:
- Docs complement knowledge files
- Clear separation: quick reference (knowledge) vs detailed guide (docs)
- Cross-references guide readers appropriately
