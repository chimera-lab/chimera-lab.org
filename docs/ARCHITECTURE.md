# :file_folder: Architecture

## :book: Table of Contents

- [:file_folder: Architecture](./#file_folder-architecture)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:triangular_ruler: Technologies](./#triangular_ruler-technologies)
  - [:books: References](./#books-references)

## :telescope: Overview

<!-- <llm prompt="Architecture.Overview" applied> -->

This repository serves as the organization-level super-repository and template baseline for chimera-lab. Root-level governance and contribution documents define shared operating rules, `docs/` provides the canonical guidance and diagrams, `.github/` contains automation assets such as workflows, prompts, skills, and agent definitions, and the `.topic` directories organize subject-area collections and related repositories. Together, these layers make the repository both a central reference point and a reusable structural model for the wider organization.

The architecture is designed around clear separation of concerns and template-driven consistency. Policy remains at the root, documentation stays in `docs/`, automation is isolated in `.github/`, and domain organization is handled through topic collections and templates. The agent-oriented documentation model further links prompts, agents, skills, knowledge, and reference documents through explicit relationships, making shared standards easier to maintain, propagate, and reuse across chimera-lab repositories.

<!-- </llm> -->

## :building_construction: Structure

<!-- <llm prompt="Architecture.Structure" applied> -->

This repository is organized as the chimera-lab.org super-repository: a central top-level structure that combines shared governance, organization-wide documentation, GitHub automation assets, and topic-based collections managed as Git submodules. The root holds canonical project documents, while `docs/` contains the deeper architecture, organization, roadmap, structure, diagram, and knowledge material that defines how the organization operates.

Its subject and work domains are grouped through root-level `.topic` directories such as `arts.topic/`, `projects.topic/`, and `template.topic/`, which provide a scalable hierarchy for related repositories and collections. Supporting automation and operational assets live under `.github/`, while repository policy and contributor-facing standards remain at the root or in `docs/`, keeping implementation, governance, and automation concerns clearly separated.

The repository also reflects the organization’s layered agent architecture where prompts route work to agents, agents use skills, skills reference knowledge, and knowledge points back to documentation without skipping layers. In structural terms, this makes the repository both a super-repository for coordinated content and a documentation-backed control surface for the Chimera agent and tooling ecosystem.

<!-- </llm> -->

## :triangular_ruler: Technologies

<!-- <llm prompt="Architecture.Technologies" applied> -->

- **Content and structure:** Markdown is the primary source format, with repository-wide metadata and configuration stored in JSON under `.chimera-lab/`.

- **Repository management:** Git underpins the super-repository, with `.topic` submodules used to organize the broader chimera-lab.org knowledge structure.

- **Documentation tooling:** GNU Make and the Chimera CLI (`cmr`, distributed as `@chimera-lab/cli`) provide the main automation surface for validation, repair, and template synchronization.

- **Automation and governance:** GitHub-native workflows in `.github/`, along with `pre-commit`, support repository checks, policy enforcement, and contributor operations.

- **Architecture modeling:** PlantUML diagrams are used to describe structural relationships such as agent, prompt, skill, and knowledge-module interactions.

<!-- </llm> -->

## :books: References

- [:page_facing_up: ../README.md](../README.md)
