---
name: repository
description: Patterns for repository structure, organization, and template management
---

# :file_folder: Repository Knowledge

## :book: Table of Contents

- [:file_folder: Repository Knowledge](./#file_folder-repository-knowledge)
  - [:telescope: Overview](./#telescope-overview)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Repository Structure](./#world_map-repository-structure)
    - [:world_map: Naming Conventions](./#world_map-naming-conventions)
    - [:world_map: Template Hierarchy](./#world_map-template-hierarchy)
    - [:world_map: Metadata Management](./#world_map-metadata-management)
  - [:books: References](./#books-references)

## :telescope: Overview

Repository knowledge defines the structure, naming conventions, template hierarchy, and metadata management for {{org.name}} repositories. All repositories follow standardized patterns with suffix-based typing and template inheritance.

## :world_map: Guides

### :world_map: Repository Structure

- Root: README, LICENSE, CHANGELOG, CODE_OF_CONDUCT, CONTRIBUTING, SECURITY, DEVELOPMENT.
- `.github/`: agents, prompts, skills, workflows directories.
- `docs/`: ARCHITECTURE, ORGANIZATION, ROADMAP, STRUCTURE, knowledge/, diagrams/.
- `.chimera-lab/`: meta.json for repository metadata and template tracking.
- Standard directories based on type: `src/` for code, `lib/` for libraries, `bin/` for executables.

### :world_map: Naming Conventions

- Repositories: `{name}.{suffix}` format where suffix defines repository type.
- Suffixes: app (applications), scaffold (project scaffolds), template (repository templates), topic (documentation collections).
- Agents: `{name}.agent.md` in `.github/agents/`.
- Prompts: `{name}.prompt.md` in `.github/prompts/`.
- Skills: `SKILL.md` in `.github/skills/{name}/`.
- Knowledge: `{name}.knowledge.md` in `docs/knowledge/`.

### :world_map: Template Hierarchy

- `repository.template` is the base template for all {{org.name}} repositories.
- Child templates inherit and extend parent templates.
- Use `cmr repo template diff` to check synchronization.
- Use `cmr repo template update` to apply upstream changes.
- Modify at the highest level that needs the change to avoid duplication across children.

### :world_map: Metadata Management

- Use `cmr repo status` to view current repository state.
- Metadata tracks template ancestry, custom configurations, and organizational context.
- Keep metadata synchronized with repository structure changes.

## :books: References

- [:page_facing_up: ../ORGANIZATION.md](../ORGANIZATION.md)
- [:page_facing_up: ../STRUCTURE.md](../STRUCTURE.md)
- [:page_facing_up: ../ARCHITECTURE.md](../ARCHITECTURE.md)
