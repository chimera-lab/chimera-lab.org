---
agent: project-manager
description: Create executable task lists for organization-wide or cross-repository work with appropriate agent assignments
---

# Plan Execution

Transform organizational tasks into well-structured, executable task lists with detailed descriptions and appropriate agent assignments for chimera-lab.org management.

## Required Information

- **Task description**: Organization-wide, topic-specific, or repository-specific work
- **Scope**: Affected repositories, topics, or templates
- **Priority order**: Optional prioritization guidance
- **Constraints**: Dependencies, submodule relationships, cross-repo impacts

## Execution Steps

### 1. Analyze Task Scope

**Determine Task Type**:
- **Organization-wide**: Affects multiple topics/repos (e.g., template updates, rule changes)
- **Topic-specific**: Limited to one topic hierarchy
- **Repository-specific**: Single repository work
- **Template-related**: Template creation, application, or updates
- **Documentation**: Knowledge base, docs, or README updates

**Identify Affected Components**:
- Topics and sub-topics
- Repositories and their relationships
- Templates being used
- Metadata files (.chimera-lab/)
- Submodule dependencies

### 2. Validate Decomposition Quality

**Check if task is properly decomposed**:

**Well-Decomposed Task** (ready for execution):
- Single, focused objective
- Actionable steps clear
- Estimated effort < 1 day per subtask
- No ambiguous requirements
- Components/repos identified
- Agent assignment clear

**Needs Further Decomposition** (create sub-tasks):
- Multiple objectives combined
- Complexity > 1 day
- Cross-repo coordination needed without clear plan
- Cross-cutting concerns (affects multiple modules)
- Unclear implementation path
- Missing technical details

**Action**:
- If decomposition needed: Comment on issue with breakdown suggestions and stop
- If well-decomposed: Proceed to task creation

### 3. Create Task List

**Use `manage_todo_list` tool** to create structured execution plan:

**Task Title Format**: `#<issue-number>: <action> - @<agent>`

**Examples**:
- `#42: Implement graph templates command - @cli-developer`
- `#43: Add RepositoryGraph type model - @python-architect`
- `#44: Update graph documentation - @technical-writer`
- `#45: Create graph integration tests - @cli-developer`

**Task Description Format**:
```markdown
**Issue**: #<number> - <issue-title>
**Module**: <affected-module>
**Goal**: <what-needs-to-be-done>

**Implementation Details**:
- Step 1: Specific action with file/function references
- Step 2: Another specific action
- Step 3: Testing/validation step

**Dependencies**: <other-task-ids-if-any>
**Files**: <key-files-to-modify>
```

**Agent Assignment Guide**:
- `@cli-developer`: Commands, Typer integration, Rich formatting, CLI logic
- `@python-architect`: Type models, architecture, patterns, module design
- `@technical-writer`: Documentation, knowledge base, README updates
- `@repository-manager`: Git operations, GitHub workflows, releases, CI/CD
- `@project-manager`: Coordination, planning, milestone tracking

### 4. Task Ordering and Dependencies

**Sequence tasks by**:
1. **Foundation first**: Type models, core utilities, base patterns
2. **Implementation**: Commands, modules, integrations
3. **Validation**: Tests, error handling, edge cases
4. **Documentation**: Knowledge base, docs, README updates
5. **Integration**: GitHub workflows, releases, deployment

**Mark dependencies**:
```json
{
  "id": 3,
  "title": "#42: Implement graph templates command - @cli-developer",
  "description": "...\n**Dependencies**: Task #1 (RepositoryGraph model), Task #2 (GraphML utilities)",
  "status": "not-started"
}
```

### 5. Execute Task Creation

**Use `manage_todo_list` with operation="write"**:
```json
{
  "operation": "write",
  "todoList": [
    {
      "id": 1,
      "title": "#43: Add RepositoryGraph type model - @python-architect",
      "description": "**Issue**: #43 - Create RepositoryGraph Pydantic model\n**Module**: src/cmrlab/types/repository.py\n**Goal**: Define type-safe graph representation for GraphML export\n\n**Implementation Details**:\n- Add RepositoryGraph model with nodes and edges fields\n- Define NodeModel (id, label, type, metadata)\n- Define EdgeModel (source, target, relationship)\n- Add validation for graph structure integrity\n\n**Dependencies**: None\n**Files**: src/cmrlab/types/repository.py",
      "status": "not-started"
    },
    {
      "id": 2,
      "title": "#42: Implement graph templates command - @cli-developer",
      "description": "**Issue**: #42 - Add cmr graph templates CLI command\n**Module**: src/cmrlab/graph.py, src/cmrlab/app.py\n**Goal**: Create command to list and apply GraphML templates\n\n**Implementation Details**:\n- Add `graph_templates()` function to graph.py\n- Integrate with Typer app in app.py under graph command group\n- Use Walker to discover template files in .chimera-lab/templates/\n- Format output with Rich table showing template names and descriptions\n- Add --apply flag to apply selected template\n\n**Dependencies**: Task #1 (RepositoryGraph model)\n**Files**: src/cmrlab/graph.py, src/cmrlab/app.py",
      "status": "not-started"
    },
    {
      "id": 3,
      "title": "#44: Update graph documentation - @technical-writer",
      "description": "**Issue**: #44 - Document graph templates feature\n**Module**: docs/knowledge/commands.knowledge.md\n**Goal**: Add documentation for new graph templates command\n\n**Implementation Details**:\n- Update commands.knowledge.md with graph templates syntax\n- Add examples of template usage to docs/CLI_GUIDELINES.md\n- Create .chimera-lab/templates/example.graphml reference\n- Document template file format requirements\n\n**Dependencies**: Task #2 (command implementation)\n**Files**: docs/knowledge/commands.knowledge.md, .github/docs/CLI_GUIDELINES.md",
      "status": "not-started"
    }
  ]
}
```

## Output Format

**Confirmation Message**:
```markdown
✅ Task list created: <N> tasks from <M> issues

**Execution Order**:
1. Task #1: #43 - Add RepositoryGraph type model (@python-architect)
2. Task #2: #42 - Implement graph templates command (@cli-developer)
3. Task #3: #44 - Update graph documentation (@technical-writer)

**Agent Distribution**:
- @python-architect: 1 task
- @cli-developer: 1 task
- @technical-writer: 1 task

**Ready to Start**: Use `@<agent> work` prompt to execute tasks
```

## Validation Checklist

Before creating task list:
- [ ] All issues read and analyzed
- [ ] Decomposition quality validated
- [ ] Tasks have clear titles with issue ID and agent
- [ ] Descriptions include implementation details
- [ ] Dependencies identified and documented
- [ ] Logical execution sequence established
- [ ] Agent assignments appropriate for task type
- [ ] Each task is actionable and well-scoped

## Best Practices

**Task Granularity**:
- ✅ 1 task = 1-4 hours of focused work
- ✅ Clear start and end state
- ❌ Avoid multi-day monolithic tasks
- ❌ Don't split atomic operations

**Agent Selection**:
- Match task type to agent expertise
- Consider workload distribution
- Respect module ownership patterns
- Enable parallel execution when possible

**Description Quality**:
- Specific file and function references
- Clear acceptance criteria
- Testing requirements included
- Context links to knowledge base

**Dependency Management**:
- Explicit dependency IDs in descriptions
- Logical execution sequence
- Avoid circular dependencies
- Enable parallel tracks when possible

## Common Patterns

**Feature Implementation Sequence**:
1. Type models (@python-architect)
2. Core logic/utilities (@cli-developer)
3. CLI command integration (@cli-developer)
4. Tests and validation (@cli-developer)
5. Documentation updates (@technical-writer)

**Bug Fix Sequence**:
1. Root cause analysis (@relevant-agent)
2. Fix implementation (@relevant-agent)
3. Regression test (@cli-developer)
4. Documentation update if needed (@technical-writer)

**Refactor Sequence**:
1. Design new structure (@python-architect)
2. Implement changes (@cli-developer)
3. Migration of existing code (@cli-developer)
4. Update documentation (@technical-writer)
5. Cleanup and verification (@repository-manager)

---

**After task list creation**: Use individual agent prompts (`work.prompt.md`) to execute tasks sequentially or assign to team members.
