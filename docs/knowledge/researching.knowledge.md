---
name: researching
description: Patterns for discovering, gathering, and synthesizing project context
---

# :file_folder: Researching Knowledge

## :book: Table of Contents

- [:file_folder: Researching Knowledge](./#file_folder-researching-knowledge)
  - [:book: Table of Contents](./#book-table-of-contents)
  - [:telescope: Overview](./#telescope-overview)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Context Discovery](./#world_map-context-discovery)
    - [:world_map: Issue Analysis](./#world_map-issue-analysis)
    - [:world_map: Codebase Exploration](./#world_map-codebase-exploration)
  - [:books: References](./#books-references)

## :telescope: Overview

Researching is the process of gathering, validating, and synthesizing context before acting. Start from project metadata, then expand through issues, documentation, and code. Prefer structured discovery over broad reading.

## :world_map: Guides

### :world_map: Context Discovery

- Read repository README and ORGANIZATION docs first for scope.
- Consult ARCHITECTURE docs for system design, technology decisions, and structural patterns.
- Use `cmr docs list` to enumerate documentation by category.
- Use `cmr repo status` to understand repository state.
- Use `gh issue list` and `gh issue view` to extract issue context.

### :world_map: Issue Analysis

- Extract title, body, labels, milestone from issues.
- Identify acceptance criteria, dependencies, and affected components.
- Decompose complex issues into focused sub-tasks.
- Map issues to agents, skills, and knowledge domains.

### :world_map: Codebase Exploration

- Search for relevant files using semantic search or grep.
- Read referenced documentation and knowledge before modifying.
- Validate assumptions against existing structure and conventions.

## :books: References

- [:page_facing_up: ../ARCHITECTURE.md](../ARCHITECTURE.md)
- [:page_facing_up: ../ORGANIZATION.md](../ORGANIZATION.md)
- [:page_facing_up: ../STRUCTURE.md](../STRUCTURE.md)
- [:page_facing_up: ../../README.md](../../README.md)
