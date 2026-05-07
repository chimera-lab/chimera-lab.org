# :file_folder: Organization

## :book: Table of Contents

- [:file_folder: Organization](./#file_folder-organization)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:toolbox: Tools](./#toolbox-tools)
  - [:books: References](./#books-references)

## :telescope: Overview

<!-- <llm prompt="Organization.Overview" applied> -->

This repository represents the Chimera Lab organization as a documentation-centered super-repository. It brings together topic collections, template repositories, governance files, and shared automation so organizational standards can be managed in one place and reused consistently across child repositories.

<!-- </llm> -->

## :building_construction: Structure

<!-- <llm prompt="Organization.Structure" applied> -->

The organization is arranged around top-level topic directories, template collections, and shared metadata. Topic folders such as `*.topic` group related knowledge or projects, while repository identity and template ancestry are tracked in `.chimera-lab/meta.json`.

This layout supports a clear hierarchy: the organization root contains shared policy, documentation, and automation; topic directories group related repositories; and templates provide inherited structure for downstream repositories. Naming conventions based on suffixes such as `.topic`, `.project`, `.app`, `.package`, `.scaffold`, and `.template` make repository purpose visible from the path alone.

<!-- </llm> -->

## :toolbox: Tools

<!-- <llm prompt="Organization.Tools" applied> -->

The main operational tool is the CMR CLI, which supports repository discovery, metadata inspection, documentation validation, template management, and GitHub resource workflows. Common organization-level commands include `cmr org list`, `cmr org topic`, and `cmr org tree` for structure discovery, plus `cmr repo status` and `cmr repo template diff` for repository-specific checks.

Documentation and maintenance workflows also rely on `cmr docs validate`, `cmr docs fix`, and `cmr docs render --apply`, with GitHub-backed operations available through `cmr repo issues`, `cmr repo milestones`, and `cmr repo labels`. When authentication is required, use `gh auth login` and confirm status with `cmr config github status`.

<!-- </llm> -->

## :books: References

- [:page_facing_up: STRUCTURE.md](STRUCTURE.md)
- [:page_facing_up: ../README.md](../README.md)
- [:page_facing_up: knowledge/cmr.knowledge.md](knowledge/cmr.knowledge.md)
