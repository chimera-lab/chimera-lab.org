# :file_folder: Chimera Lab

## :book: Table of Contents

- [:file_folder: Chimera Lab](./#file_folder-chimera-lab)
  - [:telescope: Overview](./#telescope-overview)
  - [:keyboard: Usage](./#keyboard-usage)
  - [🧩 Components](./#jigsaw-components)
  - [📦 Material](./#package-material)
  - [⚙ Software](./#gear-software)
  - [🧰 Tools](./#toolbox-tools)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Repository Types](./#building_construction-repository-types)
    - [:building_construction: Template Inheritance](./#building_construction-template-inheritance)
  - [📓 Notes](./#notebook-notes)
  - [:card_file_box: Submodules](./#card_file_box-submodules)
  - [:busts_in_silhouette: Contributing](./#busts_in_silhouette-contributing)
  - [:scroll: License](./#scroll-license)

## :telescope: Overview

Chimera Lab is a structured multi-repository GitHub organization for managing knowledge, applications, and projects. Repositories follow semantic naming suffixes (`.topic`, `.app`, `.project`, etc.) and inherit from a template hierarchy that enforces consistent structure. The CMR CLI validates documentation and automates repository management across the organization.

## :keyboard: Usage

**Quick start**:

```bash
npm i -g @chimera-lab/cli
cmr repo init
cmr docs check
```

**Minimal project** — use `diy.template` for a lightweight repository with just a README, LICENSE, and `meta.json`:

```bash
cmr repo init --template diy
```

**Full application** — use `app.template` for repositories with agents, skills, knowledge modules, and full governance docs:

```bash
cmr repo init --template app
```

Browse all available templates in the [:file_folder: template.topic](template.topic/) directory.

## 🧩 Components

<!-- cmr:<project.list;applied> -->

| Name | Description | Tags |
| --- | --- | --- |
| organizer |  |  |
| chimera-lab-archives |  |  |
| chimera-lab-chat |  |  |
| chimera-lab-cli-website |  |  |
| chimera-lab-cli |  |  |
| chimera-lab-compliance |  |  |
| chimera-lab-docker-stack |  |  |
| chimera-lab-enterprise |  |  |
| chimera-lab-erp |  |  |
| chimera-lab-infra |  |  |
| chimera-lab-organization |  |  |
| chimera-lab-templates |  |  |
| chimera-lab-website |  |  |
| chimera-lab-workspace |  |  |
| chimera-lab |  |  |

## 📦 Material

<!-- cmr:<org.topic;applied> -->

| Name | Level | Path |
| --- | --- | --- |
| arts | 0 | arts.topic |
| art | 1 | arts.topic/art.topic |
| contributions | 0 | contributions.topic |
| formal-sciences | 0 | formal-sciences.topic |
| computer-science | 1 | formal-sciences.topic/computer-science.topic |
| humanities | 0 | humanities.topic |
| ideas | 0 | ideas.topic |
| natural-sciences | 0 | natural-sciences.topic |
| original | 0 | original.topic |
| partnership | 0 | partnership.topic |
| personal | 0 | personal.topic |
| projects | 0 | projects.topic |
| social-sciences | 0 | social-sciences.topic |
| finance | 1 | social-sciences.topic/finance.topic |
| legal | 1 | social-sciences.topic/legal.topic |
| template | 0 | template.topic |

## ⚙ Software

<!-- cmr:<org.list[suffix=app];applied> -->

| Name | Suffix | Level | Path |
| --- | --- | --- | --- |
| chimera-lab-cli.app | .app | 1 | original.topic/chimera-lab-cli.app |
| php-to-plantuml_vscode.app | .app | 1 | original.topic/php-to-plantuml_vscode.app |

## 🧰 Tools

<!-- cmr:<org.list[suffix=scaffold];applied> -->

| Name | Suffix | Level | Path |
| --- | --- | --- | --- |
| wordpress-plugin-abstraction.scaffold | .scaffold | 1 | original.topic/wordpress-plugin-abstraction.scaffold |

## :building_construction: Structure

### :building_construction: Repository Types

Every repository name ends with a semantic suffix that defines its purpose:

<!-- cmr:<org.types;applied> -->

| Suffix | Purpose |
| --- | --- |
| `.topic` | Knowledge organization |
| `.project` | Dedicated projects |
| `.app` | Applications and tools |
| `.package` | Libraries and packages |
| `.scaffold` | Boilerplates and generators |
| `.template` | Repository templates |
| `.overview` | Learning material and guides |
| `.diy` | DIY and hardware projects |

See [:page_facing_up: docs/ORGANIZATION.md](docs/ORGANIZATION.md) for naming conventions and [:page_facing_up: docs/STRUCTURE.md](docs/STRUCTURE.md) for the detailed directory layout.

### :building_construction: Template Inheritance

Templates form a hierarchy. Each child template extends its parent with additional structure:

<!-- cmr:<org.inheritance;applied> -->

```text
app.template (base)
├── laravel_app.template
└── typescript_app.template
diy.template (base)
org.template (base)
overview.template (base)
package.template (base)
project.template (base)
repository.template (base)
scaffold.template (base)
├── docker_scaffold.template
└── laravel_docker_scaffold.template
topic.template (base)
```

Repositories declare their template in `.chimera-lab/meta.json`. The CMR CLI uses this to validate structure and sync updates from the parent template.

## 📓 Notes

<!-- cmr:<org.stats;applied> -->

- **Total repositories**: 48
- **Templates**: 13
- **.topic**: 16
- **.app**: 2
- **.package**: 1
- **.project**: 15
- **.scaffold**: 1
- **.template**: 13
- **Level 0**: 12
- **Level 1**: 36

## :card_file_box: Submodules

Chimera Lab uses a super-repository pattern — this root repository manages all organization repositories as Git submodules. This enables coordinated commits, cross-repo validation, and organization-wide operations through the CMR CLI.

## :busts_in_silhouette: Contributing

See [:page_facing_up: CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines and [:page_facing_up: CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for community standards.

## :scroll: License

Licensed under the MIT License. See [:page_facing_up: LICENSE](LICENSE) for details.

