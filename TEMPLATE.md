# :package: org.template

This repository **is a template** for organisation repositories. It extends `repository.template` with structure for knowledge bases, community resources, and organisation-wide references.

## :book: Table of Contents

- [:package: org.template](./#package-orgtemplate)
  - [:telescope: Overview](./#telescope-overview)
  - [:inbox_tray: Installation](./#inbox_tray-installation)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Inherited verbatim from `repository.template`](./#building_construction-inherited-verbatim-from-repositorytemplate)
    - [:building_construction: Extended from `repository.template`](./#building_construction-extended-from-repositorytemplate)
    - [:building_construction: New in `org.template`](./#building_construction-new-in-orgtemplate)
  - [:books: References](./#books-references)

## :telescope: Overview

A repository skeleton for **organisation repositories** — knowledge bases, community structure, governance, and cross-team references. Extends `repository.template` with:

- Org-specific `README.md` with `:world_map: Guides` section for navigation and contributor guidance.
- Org-specific `DEVELOPMENT.md` placeholders using the `Org.Development.*` LLM namespace.
- Org-specific `docs/ARCHITECTURE.md` with a `:jigsaw: Components` section.
- This `TEMPLATE.md` documenting what distinguishes an org repo from the base.

## :inbox_tray: Installation

```bash
cmr repo init --template org.template <new-org-name>
```

Or use GitHub's "Use this template" button. Updates from this template can be pulled later with:

```bash
cmr repo template upgrade
```

## :building_construction: Structure

### :building_construction: Inherited verbatim from `repository.template`

All root governance files (`LICENSE`, `CHANGELOG.md`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, `AGENTS.md`, `Makefile`), `docs/` baseline, `.github/` baseline, and tooling files (`.editorconfig`, `.gitattributes`, `.gitignore`, `.pre-commit-config.yaml`).

### :building_construction: Extended from `repository.template`

| File                   | Change                                                                                        |
| ---------------------- | --------------------------------------------------------------------------------------------- |
| `README.md`            | Adds `:world_map: Guides` section for community navigation and contributor guidance           |
| `DEVELOPMENT.md`       | Sections specialised for organisation repos using the `Org.Development.*` LLM namespace       |
| `docs/ARCHITECTURE.md` | Adds `:jigsaw: Components` h2 with pending `<llm prompt="Architecture.Components">` directive |

### :building_construction: New in `org.template`

| File          | Purpose                                                                  |
| ------------- | ------------------------------------------------------------------------ |
| `TEMPLATE.md` | This file — documents the template's purpose and differences from parent |

## :books: References

- Parent template: [:page_facing_up: repository.template](https://github.com/chimera-lab/repository.template)
- [:page_facing_up: AGENTS.md](AGENTS.md) - Agent orchestration model
- [:page_facing_up: docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) - Architectural overview
