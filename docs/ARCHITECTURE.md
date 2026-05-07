# :file_folder: Architecture

## :book: Table of Contents

- [:file_folder: Architecture](./#file_folder-architecture)
  - [:telescope: Overview](./#telescope-overview)
  - [:triangular_ruler: Technologies](./#triangular_ruler-technologies)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:jigsaw: Components](./#jigsaw-components)
  - [:books: References](./#books-references)

## :telescope: Overview

<!-- <llm prompt="Architecture.Overview" applied> -->

This repository’s architecture is centered on maintaining organizational structure and documentation consistency rather than delivering a runtime application. It combines metadata, documentation, template inheritance, and GitHub automation into a single super-repository so standards can be defined once and applied across the broader Chimera Lab ecosystem.

<!-- </llm> -->

## :triangular_ruler: Technologies

<!-- <llm prompt="Architecture.Technologies" applied> -->

The primary technologies are Git for super-repository and submodule management, Markdown for human-facing documentation, GitHub Actions for repository automation, and the CMR CLI for validation, rendering, metadata checks, and template operations. Supporting tooling includes `pre-commit` for repository hygiene and a `Makefile` that exposes the common local workflows.

The design is intentionally tool-driven: documentation is rendered and validated through CMR commands, repository metadata is stored in `.chimera-lab/`, and template synchronization is handled through dedicated CMR template commands rather than custom ad hoc scripts.

<!-- </llm> -->

## :building_construction: Structure

<!-- <llm prompt="Architecture.Structure" applied> -->

The repository is organized into a small number of high-level layers. Root documents define governance and contributor-facing guidance, `docs/` contains human-readable architecture and knowledge material, `.github/` holds automation assets such as agents, prompts, skills, workflows, and issue templates, and `.chimera-lab/` stores repository metadata and validation context.

Architecturally, content flows from reusable patterns toward concrete documentation. Template inheritance provides structural reuse across repositories, while validation commands such as `cmr docs check`, `cmr docs headers validate`, and `cmr repo template diff` enforce consistency between metadata, generated content, and repository layout.

<!-- </llm> -->

## :jigsaw: Components

<!-- <llm prompt="Architecture.Components" applied> -->

The main components are the documentation layer, the metadata layer, the automation layer, and the template layer. The documentation layer includes top-level guides and `docs/knowledge/` files that define organizational patterns; the metadata layer is anchored in `.chimera-lab/meta.json`; the automation layer lives in `.github/` and the `Makefile`; and the template layer governs inheritance and synchronization across related repositories.

Together, these components support a repeatable workflow: describe standards in documentation, encode reusable structure in templates, track repository identity in metadata, and enforce consistency with CMR and GitHub automation.

<!-- </llm> -->

## :books: References

- [:page_facing_up: ../README.md](../README.md)
- [:page_facing_up: STRUCTURE.md](STRUCTURE.md)
- [:page_facing_up: ORGANIZATION.md](ORGANIZATION.md)
- [:page_facing_up: ROADMAP.md](ROADMAP.md)
- [:page_facing_up: knowledge/repository.knowledge.md](knowledge/repository.knowledge.md)
- [:page_facing_up: knowledge/validating.knowledge.md](knowledge/validating.knowledge.md)
