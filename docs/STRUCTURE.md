# :file_folder: Repository Structure

## :book: Table of Contents

- [:file_folder: Repository Structure](./#file_folder-repository-structure)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Layer Separation Rules](./#building_construction-layer-separation-rules)
      - [:building_construction: Semantic Header Vocabulary](./#building_construction-semantic-header-vocabulary)
      - [:building_construction: GitHub Automation Structure](./#building_construction-github-automation-structure)
  - [:books: References](./#books-references)

## :telescope: Overview

<!-- <llm prompt="Structure.Overview" applied> -->

This repository uses a documentation-first super-repository layout to organize shared governance, templates, topic collections, and automation for the Chimera Lab organization. Its structure is intentionally opinionated: metadata lives alongside repository rules, reusable automation is centralized, and topic- or template-based subrepositories are grouped by suffix and purpose.

<!-- </llm> -->

## :building_construction: Structure

<!-- <llm prompt="Structure.Structure" applied> -->

At the root, the repository keeps common policy and entry-point files such as `README.md`, `CONTRIBUTING.md`, `DEVELOPMENT.md`, and governance documents. Supporting structure is split across `.chimera-lab/` for repository metadata and template tracking, `.github/` for agents, prompts, skills, workflows, and issue templates, and `docs/` for architecture, organization, structure, roadmaps, diagrams, and knowledge files.

Content repositories are grouped as top-level `*.topic` directories, with `template.topic/` holding reusable repository templates and other topic folders collecting related material. This keeps shared documentation at the top level while allowing nested repositories to follow the same naming and inheritance rules.

<!-- </llm> -->

### :building_construction: Layer Separation Rules

<!-- <llm prompt="Structure.LayerSeparation" applied> -->

The repository follows a strict layered model so responsibilities stay clear and references remain predictable. Prompts define task entry points, agents orchestrate work, skills capture reusable execution patterns, knowledge files provide compact domain guidance, and human-facing documents sit at the outer layer.

References should move one layer at a time rather than jumping across the stack. In practice, that means prompts point to agents, agents point to skills, skills point to knowledge, and knowledge supports documentation; changes should also be made at the highest shared layer that owns the behavior.

<!-- </llm> -->

#### :building_construction: Semantic Header Vocabulary

<!-- <llm prompt="Structure.SemanticHeaders" applied> -->

Section headers use semantic labels rather than arbitrary titles so readers can recognize intent quickly across documents. Common patterns include `:telescope:` for overview and discovery, `:building_construction:` for structure and architecture, `:clipboard:` for requirements, `:wrench:` for configuration, `:toolbox:` for tools, `:world_map:` for guides, `:jigsaw:` for components, and `:books:` for references.

This vocabulary is consistent across repository docs, knowledge files, and agent documentation. Reusing the same header semantics makes generated tables of contents predictable and helps related documents read as one coherent system.

<!-- </llm> -->

#### :building_construction: GitHub Automation Structure

<!-- <llm prompt="Structure.GitHubAutomation" applied> -->

GitHub automation is concentrated under `.github/` and separated by concern. `agents/` defines specialized agent roles, `prompts/` provides reusable task entry points, `skills/` holds execution guidance, `workflows/` contains CI and pre-commit automation, and standard support files such as `ISSUE_TEMPLATE/` and `FUNDING.yml` sit beside them.

The current workflow set includes a generic `ci.yml` scaffold and a concrete `pre-commit.yml` workflow that installs and runs repository hooks on pull requests. This keeps automation template-friendly: shared repository behavior lives in versioned GitHub configuration, while project-specific build or test steps can be filled in by child repositories when needed.

<!-- </llm> -->

## :books: References

<!-- <llm prompt="Structure.References" applied> -->

- `../AGENTS.md` for the repository's agent model, layer separation pattern, and orchestration rules.
- `ORGANIZATION.md` for the broader organizational hierarchy and repository typing conventions.
- `knowledge/repository.knowledge.md` for repository layout, naming, template hierarchy, and metadata guidance.
- `knowledge/system.knowledge.md` for the super-repository pattern, metadata system, and automation context.
- `../.github/workflows/ci.yml` and `../.github/workflows/pre-commit.yml` for the current GitHub Actions layout.
- `../Makefile` for the local automation entry points that mirror repository validation and rendering workflows.

<!-- </llm> -->
