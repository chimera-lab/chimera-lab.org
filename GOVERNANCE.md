# :building_construction: Structure

## :book: Table of Contents

- [:building_construction: Structure](./#building_construction-structure)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Roles](./#building_construction-roles)
    - [:building_construction: Decision Making](./#building_construction-decision-making)
    - [:building_construction: Policies](./#building_construction-policies)
  - [:clipboard: Requirements](./#clipboard-requirements)
    - [:building_construction: Membership](./#building_construction-membership)

## :building_construction: Structure

chimera-lab is a single-maintainer open-source organization. The maintainer holds final authority over all architectural, template, and CLI decisions. Community input is welcomed and encouraged through GitHub Issues and Discussions.

### :building_construction: Roles

| Role | Description |
| --- | --- |
| **Project Lead** | Single maintainer. Sets direction, reviews PRs, manages releases, and makes final decisions on architecture, templates, and the CMR CLI. |
| **Contributor** | Anyone who submits pull requests, reports issues, or suggests features. All contributions are reviewed by the project lead. |
| **Collaborator** | Contributors invited to maintain specific repositories after demonstrating sustained, quality contributions. |

### :building_construction: Decision Making

- The project lead makes all final decisions.
- Major changes (new repository types, template hierarchy changes, CLI breaking changes) are discussed in GitHub Issues or Discussions before implementation.
- Architecture decisions are documented in `docs/`.
- Minor changes (bug fixes, documentation improvements) can go directly through pull requests.

### :building_construction: Policies

- All contributions are accepted via pull request.
- All PRs must pass `cmr docs check` before merging.
- Template changes follow the template hierarchy — changes are made at the highest level needed and propagate downward.
- Code must follow existing conventions established in each repository.
- Commit messages follow the format: `type: description` (e.g., `docs: update governance`).

## :clipboard: Requirements

- Repositories must follow the organization naming conventions (semantic suffixes like `.topic`, `.project`, `.template`, `.app`, `.package`, `.scaffold`).
- All repositories must use the template system and include required files (README.md, LICENSE, CONTRIBUTING.md, CODE_OF_CONDUCT.md, CHANGELOG.md).
- Documentation must pass validation via `cmr docs check`.
- New repositories are added as submodules in the super-repository.

### :building_construction: Membership

chimera-lab is open to all contributors. There are no formal membership requirements to participate.

- **Contributing**: Anyone can open issues, submit PRs, or join discussions.
- **Collaborator access**: Contributors who demonstrate sustained, quality contributions to a specific repository may be invited as collaborators on that repository.
- **Organization-wide access**: Granted at the project lead's discretion based on trust and track record.
