# :file_folder: chimera-lab.org

## :book: Table of Contents

- [:file_folder: chimera-lab.org](./#file_folder-chimera-laborg)
  - [:telescope: Overview](./#telescope-overview)
    - [:telescope: Knowledge Domains](./#telescope-knowledge-domains)
    - [:telescope: Projects](./#telescope-projects)
    - [:toolbox: Tools](./#toolbox-tools)
  - [:clipboard: Requirements](./#clipboard-requirements)
  - [:inbox_tray: Installation](./#inbox_tray-installation)
  - [:keyboard: Usage](./#keyboard-usage)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Statistics](./#building_construction-statistics)
    - [:building_construction: Repository Types](./#building_construction-repository-types)
    - [:building_construction: Template Hierarchy](./#building_construction-template-hierarchy)
    - [:building_construction: Popular Repositories](./#building_construction-popular-repositories)
    - [:building_construction: Pinned](./#building_construction-pinned)
    - [:building_construction: Recently Updated](./#building_construction-recently-updated)
  - [:books: References](./#books-references)
  - [:scroll: License](./#scroll-license)

## :telescope: Overview

<!-- <llm prompt="Overview" applied> -->

This repository is the organization-level super-repository for chimera-lab.org, serving as the central index for shared documentation, governance, and topic-based collections managed as Git submodules. It provides the common structure and reference material used across the organization, with root-level policy documents, detailed guides under `docs/`, and GitHub automation assets under `.github/`.

The layout follows chimera-lab’s suffix-based repository conventions and template system so repositories remain consistent, easier to navigate, and simpler to maintain. Topic directories such as `arts.topic`, `humanities.topic`, `natural-sciences.topic`, and `projects.topic` organize related work, while the CMR CLI supports documentation validation, template synchronization, and repository management workflows.

<!-- </llm> -->

### :telescope: Knowledge Domains

<!-- <cmr cmd="org.topic" applied> -->

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

<!-- </cmr> -->

### :telescope: Projects

<!-- <cmr cmd="project.list" applied> -->

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
| chimera-lab-erp | Template for dedicated development projects |  |
| chimera-lab-infra |  |  |
| chimera-lab-organization |  |  |
| chimera-lab-templates |  |  |
| chimera-lab-website |  |  |
| chimera-lab-workspace |  |  |
| chimera-lab |  |  |

<!-- </cmr> -->

### :toolbox: Tools

<!-- <cmr cmd="org.list[suffix=.app]" applied> -->

| Name | Suffix | Level | Path |
| --- | --- | --- | --- |
| chimera-lab-cli.app | .app | 1 | original.topic/chimera-lab-cli.app |
| php-to-plantuml_vscode.app | .app | 1 | original.topic/php-to-plantuml_vscode.app |

<!-- </cmr> -->

## :clipboard: Requirements

<!-- <llm prompt="Requirements" applied> -->

- **Git** with submodule support for cloning the repository.
- **Node.js and npm** to install and run the Chimera CLI (`@chimera-lab/cli`).
- **GNU Make** to use the documented development commands (`make install`, `make test`, `make lint`, and related targets).
- **pre-commit** for optional but recommended local validation hooks.
- **A project-specific runtime/toolchain** as required by the repository you create from this template (for example, Python, Node.js, or Go).
- **A code editor** such as VS Code or an equivalent editor of your choice.

<!-- </llm> -->

## :inbox_tray: Installation

<!-- <llm prompt="Installation" applied> -->

This repository is the organization-level super-repository and template for chimera-lab.org. To work with it locally, install Git with submodule support, Node.js/npm, and GNU Make, then run:

```bash
git clone --recursive https://github.com/chimera-lab/chimera-lab.git
cd chimera-lab

npm i -g @chimera-lab/cli
cmr --help

make install
```

Installing `pre-commit` hooks is optional but recommended for local validation before committing:

```bash
pre-commit install
```

<!-- </llm> -->

## :keyboard: Usage

<!-- <llm prompt="Usage" applied> -->

This repository is used as a **project template and documentation baseline** for chimera-lab.org repositories rather than as a standalone application. The typical workflow is to clone the repository, install the Chimera CLI, and use the provided `make` targets for setup, validation, and maintenance.

```bash
git clone --recursive https://github.com/chimera-lab/chimera-lab.git
cd chimera-lab

npm i -g @chimera-lab/cli
cmr --help

make install
make setup
make test
make lint
make format
make check
make clean
```

For documentation and repository hygiene, you can also run:

```bash
pre-commit install
pre-commit run --all-files
cmr docs check
cmr docs fix -r toc -r header-emoji
```

<!-- </llm> -->

## :building_construction: Structure

### :building_construction: Statistics

<!-- <cmr cmd="org.stats" applied> -->

- **Total repositories**: 48
- **Templates**: 13
- **.topic**: 16
- **.app**: 2
- **.package**: 2
- **.project**: 15
- **.template**: 13
- **Level 0**: 12
- **Level 1**: 36

<!-- </cmr> -->

### :building_construction: Repository Types

<!-- <cmr cmd="org.types" applied> -->

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
| `.org` | Organization-level repository |

<!-- </cmr> -->

### :building_construction: Template Hierarchy

<!-- <cmr cmd="org.inheritance" applied> -->

```text
repository.template (base)
├── app.template
│   ├── laravel_app.template
│   └── typescript_app.template
├── diy.template
├── org.template
├── overview.template
├── package.template
├── project.template
├── scaffold.template
│   ├── docker_scaffold.template
│   └── laravel_docker_scaffold.template
└── topic.template
```

<!-- </cmr> -->

### :building_construction: Popular Repositories

<!-- <cmr cmd="org.popular[count=8]" applied> -->

_No repositories found._

<!-- </cmr> -->

### :building_construction: Pinned

<!-- <cmr cmd="org.pinned" applied> -->

_No pinned repositories found. Set GITHUB_TOKEN to fetch pinned repos._

<!-- </cmr> -->

### :building_construction: Recently Updated

<!-- <cmr cmd="org.recent[count=8]" applied> -->

_No recent activity found._

<!-- </cmr> -->

## :books: References

- [:page_facing_up: CODE\_OF\_CONDUCT.md](CODE_OF_CONDUCT.md)
- [:page_facing_up: CONTRIBUTING.md](CONTRIBUTING.md)
- [:page_facing_up: SECURITY.md](SECURITY.md)
- [:page_facing_up: ./docs/STRUCTURE.md](./docs/STRUCTURE.md) - Project Structure
- [:page_facing_up: ./docs/ORGANIZATION.md](./docs/ORGANIZATION.md) - Managing entity

## :scroll: License

- Licensed under the terms specified in [:link: LICENSE](LICENSE). Review before distributing or reusing this template.
