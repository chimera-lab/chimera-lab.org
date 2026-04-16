---
agent: project-manager
description: Plan and structure a milestone with MVP definition, issue prioritization, and task decomposition for chimera-lab-cli
---

# Plan Milestone Prompt

Plan a development milestone for chimera-lab-cli Python CLI tool with MVP definition, prioritized issues, and task decomposition.

## Required Information

- **Milestone name and goal**: Clear objective (e.g., "v0.3.0 - Graph Templates System")
- **Target date**: Expected completion (YYYY-MM-DD)
- **Category**: feature | enhancement | bugfix | refactor | docs | migration
- **Breaking changes**: Yes/No

## Execution Steps

### 1. Define MVP Scope

Review `docs/knowledge/commands.knowledge.md` and organization requirements.

**Output**:
```markdown
## MVP: [Milestone Name]

### Must Have
- [ ] Critical CLI command or module
- [ ] Critical integration or feature

### Success Criteria
- Measurable completion metrics
- Quality standards (manual testing passed, type hints complete, docs updated)

### Out of Scope
- Deferred items for future milestones
```

### 2. Identify and Prioritize Issues

**Issue Format**:
```markdown
### Issue: [Title]
- **Type**: feature | bug | enhancement | docs | chore
- **Agent**: cli-developer | python-architect | technical-writer | repository-manager
- **Complexity**: S (1-2h) | M (3-8h) | L (1-3d) | XL (>3d)
- **Module**: repo | docs | graph | walker | types | etc.
- **Description**: Brief explanation
```

**Priority Levels**:
- **P0 - Critical**: Blocks other work, breaks functionality
- **P1 - High**: Core MVP, has dependents
- **P2 - Medium**: Nice-to-have, deferrable
- **P3 - Low**: Future enhancements

**Dependency Chain Example**:
```markdown
### P0
1. Design module architecture (python-architect) - Blocks: #2, #3

### P1
2. Implement CLI command (cli-developer) - Depends: #1, Blocks: #3, #4
3. Add Pydantic models (cli-developer) - Depends: #1, Parallel: #4
4. Integrate with Walker (cli-developer) - Depends: #1, Parallel: #3

### P2
5. Update knowledge base (technical-writer) - Depends: #2, #3, #4
```

### 3. Decompose Complex Issues

Break L/XL issues into M/S sub-tasks:

```markdown
## Issue #X: [Parent Issue] (L)

### Sub-Issue X.1: [Specific Task]
- Agent: cli-developer
- Complexity: M
- Dependencies: #Y
- Files: `src/cmrlab/module.py`
- Testing: `cmr <command> --help` + manual verification
- Can parallel with: X.2

### Sub-Issue X.2: [Another Task]
- Agent: python-architect
- Complexity: S
- Dependencies: #Y
- Files: `src/cmrlab/types/model.py`
- Can parallel with: X.1
```

### 4. Plan Communication

**CHANGELOG**:
```markdown
## [Version] - Date

### Added
- New features

### Changed
- Updates (note breaking changes)

### Fixed
- Bug fixes
```

**Migration Guide** (if breaking changes):
- Before/after code examples
- Step-by-step upgrade instructions

### 5. Validate Plan

**Checklist**:
- [ ] MVP achievable in timeframe
- [ ] Dependencies properly ordered (no circular deps)
- [ ] Work balanced across agents
- [ ] Success criteria measurable
- [ ] Documentation and tests planned
- [ ] Breaking changes documented

## Output Template

```markdown
# Milestone: [Name]

## Overview
- **Goal**: [objective]
- **Target**: [date]
- **Category**: [type]
- **Breaking**: [yes/no]

## MVP
[Use template from Step 1]

## Issues (Priority Ordered)
[Use format from Step 2]

## Decomposition
[Use format from Step 3 for complex issues]

## Communication
[Use format from Step 4]

## Timeline
- Week 1: [issues]
- Week 2: [issues]

## Success Metrics
- [ ] All P0/P1 complete
- [ ] Tests pass
- [ ] Docs ≥ 95%
- [ ] Build successful
```

## Usage Example

```
Plan milestone:
- Name: "v2.1.0 - Spacing Token Enhancement"
- Goal: "Extend spacing token system with xs/xl values"
- Target: 2025-01-15
- Category: enhancement
- Breaking: No
```

## Related Knowledge

- `docs/knowledge/system.knowledge.md` - CLI architecture and modules
- `docs/knowledge/commands.knowledge.md` - Command reference
- `docs/knowledge/automation.knowledge.md` - Rules and templates
