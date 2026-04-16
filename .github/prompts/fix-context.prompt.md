---
agent: prompt-engineer
description: Validate and improve agents, prompts and knowledge files following Chimera Lab conventions
---

# Fix Context Prompt

## Purpose

This prompt validates and improves agents, prompts and knowledge files to ensure they follow Chimera Lab conventions, maintain proper separation of concerns, and provide optimal AI guidance.

## Validation Rules

### Agents (`.agent.md`)

**Content Requirements**:
- Contains only information necessary for its specific function
- Information used by multiple agents must be centralized in knowledge
- Clear Role, Main Goal, Limitations, and Operational Instructions sections

**Naming Requirements**:
- Descriptive name ending with `.agent.md`
- Uses lowercase-with-hyphens format (e.g., `prompt-engineer.agent.md`)

**Reference Requirements**:
- References only knowledge files (`docs/knowledge/`)
- No direct references to other agents, prompts, or project files
- All shared information must be abstracted to knowledge

### Prompts (`.prompt.md`)

**Content Requirements**:
- Contains only information necessary for its specific task
- Information used by multiple prompts must be centralized in knowledge
- Valid frontmatter with `agent` and `description` fields
- Clear purpose and execution steps

**Naming Requirements**:
- Descriptive name ending with `.prompt.md`
- Uses lowercase-with-hyphens format (e.g., `integrate-component.prompt.md`)

**Reference Requirements**:
- References only knowledge files (`docs/knowledge/`)
- No direct references to other prompts, agents, or project files
- All shared information must be abstracted to knowledge

### Knowledge (`.knowledge.md`)

**Content Requirements**:
- Simple and AI-optimized (not massive documentation)
- Focused on providing guidance, not exhaustive details
- Contains information used by multiple agents or prompts
- Structured for quick lookup and reference

**Naming Requirements**:
- Descriptive name ending with `.knowledge.md`
- Uses lowercase-with-hyphens format (e.g., `tokens.knowledge.md`)

**Reference Requirements**:
- Self-contained, no references to other files
- Can be safely referenced by agents and prompts
- Acts as single source of truth for shared information

## Execution Workflow

**CRITICAL**: Before starting any work, you MUST use `manage_todo_list` tool to create a complete task plan covering all steps below.

---

## Validation Process

### Step 0: Information Gathering (MANDATORY FIRST STEP)

**Before any validation, you MUST complete the information gathering phase:**

1. **Discover all relevant files**:
   - List all files in `.github/agents/`
   - List all files in `.github/prompts/`
   - List all files in `docs/knowledge/`
   - Note any missing directories

2. **Read and catalog content**:
   - Read each agent file completely
   - Read each prompt file completely
   - Read each knowledge file completely
   - Take note of all sections and structure

3. **Map relationships**:
   - Identify all file references in agents (paths, filenames)
   - Identify all file references in prompts (paths, filenames)
   - Identify all file references in knowledge (paths, filenames)
   - Create a relationship map showing which files reference which

4. **Identify patterns**:
   - Find information repeated across multiple files
   - Note common topics and themes
   - Identify shared project structure references
   - List common patterns and conventions

**ONLY AFTER completing this information gathering phase should you proceed to validation.**

---

### Step 1: Naming Validation

For each file in `.github/agents/`, `.github/prompts/`, and `docs/knowledge/`:

1. **Check file extension**:
   - Agents must end with `.agent.md`
   - Prompts must end with `.prompt.md`
   - Knowledge must end with `.knowledge.md`

2. **Check naming format**:
   - Must use lowercase-with-hyphens
   - Must be descriptive of purpose
   - Should not be abbreviated unnecessarily

### Step 2: Content Validation

For each file:

1. **Check frontmatter**:
   - Valid YAML syntax
   - Required fields present (`name`, `description` for agents; `agent`, `description` for prompts)
   - No extra or invalid fields

2. **Check structure**:
   - Agents: Has Role, Main Goal, Limitations, Operational Instructions
   - Prompts: Has Purpose, clear task description
   - Knowledge: Has clear sections, AI-optimized format

3. **Check content quality**:
   - Information is necessary for the specific function
   - No redundant information
   - Clear and concise language
   - Examples where helpful

### Step 3: Reference Validation

For each file:

1. **Identify all references** to other files (relative paths, file names)

2. **Validate reference targets**:
   - Agents: Should only reference `docs/knowledge/` files
   - Prompts: Should only reference `docs/knowledge/` files
   - Knowledge: Should not reference any other files

3. **Identify shared information**:
   - Information appearing in multiple agents/prompts
   - Project structure details
   - Common patterns and conventions
   - Technical specifications

4. **Suggest knowledge extraction**:
   - Create new knowledge file if needed
   - Move shared information to existing knowledge
   - Update agents/prompts to reference knowledge

### Step 4: Improvement Suggestions

For each validated file:

1. **Content optimization**:
   - Remove unnecessary details
   - Clarify ambiguous instructions
   - Add missing critical information
   - Improve AI readability

2. **Structure optimization**:
   - Better section organization
   - Clearer headings
   - Improved examples
   - Better formatting

3. **Knowledge centralization**:
   - Extract repeated information
   - Create knowledge references
   - Reduce duplication

## Output Format

### For Each File Validated

```markdown
## File: {filename}

### Status: [PASS | FAIL | NEEDS IMPROVEMENT]

### Issues Found:
- [ ] Issue 1 description
- [ ] Issue 2 description

### Suggested Changes:
1. Change description
2. Change description

### Knowledge References:
- Refer to `{knowledge-filename}` for shared information on {topic}
- Refer to `{knowledge-topic}` for specific patterns on {topic}

### Knowledge Extraction Needed:
- Information that should be moved to knowledge
- Suggested knowledge file name
```

### Summary Report

```markdown
## Validation Summary

**Total Files Checked**: X
- Agents: X (Pass: X, Fail: X, Needs Improvement: X)
- Prompts: X (Pass: X, Fail: X, Needs Improvement: X)
- Knowledge: X (Pass: X, Fail: X, Needs Improvement: X)

**Critical Issues**: X
**Improvements Suggested**: X
**Knowledge Files to Create/Update**: X

### Priority Actions:
1. Action item
2. Action item
```

## Common Issues to Check

### Agents
- ❌ Contains project structure details (should be in knowledge)
- ❌ References specific file paths outside knowledge
- ❌ Duplicates information from other agents
- ❌ Missing critical operational instructions
- ❌ Too verbose or documentation-style
- ❌ Wrong file extension or naming

### Prompts
- ❌ Contains reusable information (should be in knowledge)
- ❌ References specific implementation details
- ❌ Duplicates information from other prompts
- ❌ Missing agent specification
- ❌ Unclear task description
- ❌ Wrong file extension or naming

### Knowledge
- ❌ Too verbose or documentation-style (should be AI-guidance focused)
- ❌ References other files (must be self-contained)
- ❌ Contains agent-specific instructions (should be general guidance)
- ❌ Not structured for quick lookup
- ❌ Missing information used by multiple agents/prompts
- ❌ Wrong file extension or naming

---

## Execution Steps

**MANDATORY WORKFLOW** - Follow this sequence exactly:

### 1. Planning Phase
**Use `manage_todo_list` tool to create complete task breakdown:**
```markdown
1. Information Gathering - Discover and read all files
2. Information Gathering - Map relationships between files
3. Information Gathering - Identify patterns and duplication
4. Naming Validation - Check all file names and extensions
5. Content Validation - Check frontmatter and structure
6. Reference Validation - Validate all file references
7. Improvement Suggestions - Optimize content and structure
8. Generate Reports - Create validation reports
```

### 2. Execute Information Gathering (Step 0)
Complete all discovery and reading tasks before proceeding.

### 3. Execute Validations (Steps 1-3)
Process each validation step systematically.

### 4. Generate Improvements (Step 4)
Create actionable improvement suggestions.

### 5. Deliver Reports
Provide formatted validation output and summary.

---

## Success Criteria

✅ **All files validated**:
- Correct naming conventions
- Valid frontmatter
- Proper structure

✅ **References optimized**:
- Agents/prompts only reference knowledge
- Knowledge is self-contained
- No circular references

✅ **Information centralized**:
- Shared information in knowledge
- No duplication across files
- Clear separation of concerns

✅ **Content optimized**:
- AI-friendly language
- Concise and focused
- Clear instructions
- Helpful examples
