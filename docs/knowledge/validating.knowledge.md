---
name: validating
description: Patterns for verifying structure, templates, and organization consistency
---

# :file_folder: Validating Knowledge

## :book: Table of Contents

- [:file_folder: Validating Knowledge](./#file_folder-validating-knowledge)
  - [:book: Table of Contents](./#book-table-of-contents)
  - [:telescope: Overview](./#telescope-overview)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Structure Validation](./#world_map-structure-validation)
    - [:world_map: Template Validation](./#world_map-template-validation)
    - [:world_map: Naming Conventions](./#world_map-naming-conventions)
    - [:world_map: Semantic Header Vocabulary](./#world_map-semantic-header-vocabulary)
  - [:books: References](./#books-references)

## :telescope: Overview

Validating ensures that repository structure, templates, and naming conventions are consistent across the organization. Use `cmr` tools for automated validation. Templates follow an inheritance hierarchy, and changes should propagate from the highest appropriate level.

## :world_map: Guides

### :world_map: Structure Validation

- Run `cmr docs validate` to check all documentation categories.
- Ensure `.github/` contains agents, prompts, skills, and workflows directories.
- Check that knowledge files live in `docs/knowledge/`.

### :world_map: Template Validation

- Use `cmr repo template validate` to check template synchronization.
- Use `cmr repo template update` to apply upstream template changes.
- Inheritance chain: child template inherits from parent up to `repository.template`.
- Modify at the highest level that needs the change to avoid duplication.

### :world_map: Naming Conventions

- Agents: `{name}.agent.md` in `.github/agents/`.
- Prompts: `{name}.prompt.md` in `.github/prompts/`.
- Skills: `SKILL.md` in `.github/skills/{name}/`.
- Knowledge: `{name}.knowledge.md` in `docs/knowledge/`.
- Repositories: `{name}.{suffix}` where suffix defines type (app, scaffold, template, topic, etc.).

### :world_map: Semantic Header Vocabulary

Headers use semantic emoji to categorize content. This vocabulary is enforced across all documentation.

**Discover available header types:**

```bash
cmr docs headers list-typed
```

**Header validation:**

- Run `cmr docs validate` to check emoji and header consistency.
- Run `cmr docs fix` to auto-correct formatting issues.
- Headers must follow approved vocabulary (see list above).
- All headers must be properly nested and referenced in table of contents.

### :world_map: Task completion

- Understand task: Clarify validation requirements and objectives
- Understand changes: Review modifications to validation logic
- Understand requirements: Identify acceptance criteria and constraints
- Evaluate: Assess implementation against requirements and patterns
- Verify completion: Confirm all structure checks pass via `cmr docs validate`
- Validate naming: Match naming conventions to defined patterns

## :books: References

- [:page_facing_up: ../STRUCTURE.md](../STRUCTURE.md)
- [:page_facing_up: ../ORGANIZATION.md](../ORGANIZATION.md)
