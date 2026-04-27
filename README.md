# :file_folder: chimera-lab.org

Repository template providing the standard structure, docs, and contribution workflow for chimera-lab.org projects.

## :book: Table of Contents

- [:file_folder: chimera-lab.org](./#file_folder-chimera-laborg)
  - [:telescope: Overview](./#telescope-overview)
  - [:clipboard: Requirements](./#clipboard-requirements)
  - [:inbox_tray: Installation](./#inbox_tray-installation)
  - [:keyboard: Usage](./#keyboard-usage)
    - [:keyboard: Documented commands/steps](./#keyboard-documented-commandssteps)
      - [:keyboard: Extra documented checks](./#keyboard-extra-documented-checks)
      - [:notebook: Notes](./#notebook-notes)
      - [:keyboard: Files used](./#keyboard-files-used)
  - [:books: References](./#books-references)
  - [:scroll: License](./#scroll-license)

## :telescope: Overview

<!-- llm<Overview;applied> -->

This repository is the organization-level super-repository and template baseline for `chimera-lab.org`. It serves as the central index for shared documentation, governance, and topic-based collections managed as Git submodules, with core policy files at the root, extended guidance in `docs/`, and GitHub automation assets in `.github/`.

Its layout follows chimera-lab’s semantic repository conventions and template hierarchy so repositories stay consistent, easier to navigate, and easier to maintain. Topic directories such as `arts.topic`, `humanities.topic`, `natural-sciences.topic`, and `projects.topic` group related work, while the CMR CLI supports documentation validation, template synchronization, and repository management workflows.● Writer Draft overview text
│ Read ORGANIZATION.md
│   │ docs/ORGANIZATION.md
│   └ L1:120 (119 lines read)
└ Todo completed draft-overview

This repository is the organization-level super-repository and template baseline for `chimera-lab.org`. It serves as the central index for shared documentation, governance, and topic-based collections managed as Git submodules, with core policy files at the root, extended guidance in `docs/`, and GitHub automation assets in `.github/`.

Its layout follows chimera-lab’s semantic repository conventions and template hierarchy so repositories stay consistent, easier to navigate, and easier to maintain. Topic directories such as `arts.topic`, `humanities.topic`, `natural-sciences.topic`, and `projects.topic` group related work, while the CMR CLI supports documentation validation, template synchronization, and repository management workflows.

● skill(write)

I’m checking the repository’s scope and structure so the overview matches the project accurately.

● Read README.md
└ L1:220 (220 lines read)

● Read AGENTS.md
└ L1:220 (150 lines read)

This repository is the organization-level super-repository for chimera-lab.org, acting as the central index for shared documentation, governance, and topic-based collections managed as Git submodules. It brings together root-level policy documents, detailed guidance under `docs/`, and GitHub automation assets under `.github/` to support consistent repository management across the organization.

The layout follows chimera-lab’s suffix-based repository conventions and template system so projects remain easier to navigate, maintain, and extend. Topic directories such as `arts.topic`, `humanities.topic`, `natural-sciences.topic`, and `projects.topic` group related work, while the Chimera CLI and documented workflows support validation, template synchronization, and ongoing repository maintenance.

This repository is the organization-level super-repository for chimera-lab.org, serving as the central index for shared documentation, governance, and topic-based collections managed as Git submodules. It provides the common structure and reference material used across the organization, with root-level policy documents, detailed guides under `docs/`, and GitHub automation assets under `.github/`.

The layout follows chimera-lab’s suffix-based repository conventions and template system so repositories remain consistent, easier to navigate, and simpler to maintain. Topic directories such as `arts.topic`, `humanities.topic`, `natural-sciences.topic`, and `projects.topic` organize related work, while the CMR CLI supports documentation validation, template synchronization, and repository management workflows.● Writer Draft repo overview
│ Read GOVERNANCE.md
│   └ 53 lines read
└ Todo completed 2 items
│ read-config
└ draft-overview

This repository is the organization-level super-repository for chimera-lab.org, serving as the central index for shared documentation, governance, and topic-based collections managed as Git submodules. It provides the common structure and reference material used across the organization, with root-level policy documents, detailed guides under `docs/`, and GitHub automation assets under `.github/`.

The layout follows chimera-lab’s suffix-based repository conventions and template system so repositories remain consistent, easier to navigate, and simpler to maintain. Topic directories such as `arts.topic`, `humanities.topic`, `natural-sciences.topic`, and `projects.topic` organize related work, while the CMR CLI supports documentation validation, template synchronization, and repository management workflows.

No actionable task was provided. I’m ready to proceed once you provide a specific request.

## :clipboard: Requirements

<!-- llm<Requirements;applied> -->

I’m pulling the repository context and the writer agent instructions so the section matches the project accurately.

● Read README.md
└ L1:220 (220 lines read)

● Read DEVELOPMENT.md
└ L1:240 (144 lines read)

● Read AGENTS.md
└ L1:260 (150 lines read)

● Search (glob)
│ ".github/{agents,prompts}/\*\*/\*"
└ 35 files found

I found existing repository phrasing for this section; I’m checking the writer agent prompt and then I’ll return the final markdown body in the repo’s style.

● Read writer.agent.md
│ .github/agents/writer.agent.md
└ L1:220 (60 lines read)

● Read write.prompt.md
│ .github/prompts/write.prompt.md
└ L1:220 (32 lines read)

● Read Makefile
└ L1:220 (79 lines read)

● skill(write)

I have the repository wording and the write skill loaded; I’m handing it to the writer agent for the final, repo-aligned section text.

- Git with submodule support

- Node.js and npm for the Chimera CLI (`@chimera-lab/cli` / `cmr`)

- GNU Make

- The runtime and toolchain required by the specific project you are working on

- A code editor; `pre-commit` is optional but recommended● Writer(gpt-5.4-mini) Draft requirements copy
  └ skill(write)

- Git with submodule support

- Node.js and npm for the Chimera CLI (`@chimera-lab/cli` / `cmr`)

- GNU Make

- The runtime and toolchain required by the specific project you are working on

- A code editor; `pre-commit` is optional but recommended

● skill(write)

● Read README.md
└ L1:220 (220 lines read)

● Read DEVELOPMENT.md
└ L1:220 (144 lines read)

● Read Makefile
└ L1:220 (79 lines read)

- **Git** with submodule support for cloning and updating the repository.
- **Node.js and npm** to install and run the Chimera CLI (`@chimera-lab/cli` / `cmr`).
- **GNU Make** to use the documented workflow targets such as `make install`, `make test`, `make lint`, and `make check`.
- **A project-specific runtime/toolchain** required by the repository content you manage from this template (for example, Python, Node.js, or Go).
- **pre-commit** for optional but recommended local validation hooks.
- **A code editor** such as VS Code or another editor of your choice.

● skill(write)

● Read README.md
└ L1:220 (124 lines read)

● Read DEVELOPMENT.md
└ L1:220 (144 lines read)

● Read Makefile
└ L1:220 (79 lines read)

- **Git** with submodule support for cloning the repository.
- **Node.js and npm** to install and run the Chimera CLI (`@chimera-lab/cli`).
- **GNU Make** to use the documented development commands (`make install`, `make test`, `make lint`, and related targets).
- **pre-commit** for optional but recommended local validation hooks.
- **A project-specific runtime/toolchain** as required by the repository you create from this template (for example, Python, Node.js, or Go).
- **A code editor** such as VS Code or an equivalent editor of your choice.

No actionable task was provided beyond the session requirements. I'm ready to proceed once a concrete repository task or question is given.

## :inbox_tray: Installation

<!-- llm<Installation;applied> -->

This repository is primarily a documentation and organization super-repository, not a standalone application, so there is no root-level build or package installation step by default.

To work with it locally, clone the repository with submodules enabled and install the Chimera CLI used for repository management and documentation workflows:

```bash
git clone --recursive https://github.com/chimera-lab/chimera-lab.git
cd chimera-lab

npm i -g @chimera-lab/cli
cmr --help
```

Recommended local tooling includes Git with submodule support, Node.js with npm, GNU Make, and `pre-commit`. If you want local validation hooks before committing, run:

```bash
pre-commit install
```

The root `make install` target is a template placeholder, so no additional repository-wide dependency installation is required unless a specific subproject or template documents its own setup steps.● Writer(gpt-5.4) Draft install docs
│ Search (grep)
│   │ "cmr docs check|cmr repo template diff|cmr repo template update|cmr docs
│   │ fix" in \*.{md,yml,yaml,Makefile}
│   └ 7 lines found
└ Todo completed research-installation

I found the repo is documentation-first, so I’m just verifying the exact local setup commands before I hand back the final markdown.

● Read README.md
└ L1:220 (220 lines read)

● Read Makefile
└ L1:240 (79 lines read)

● Read DEVELOPMENT.md
└ L1:240 (144 lines read)

This repository is an organization-level super-repository and template, so local setup mainly consists of cloning it with submodules and installing the Chimera CLI.

- **Required tools:** Git with submodule support, Node.js with npm, GNU Make
- **Recommended:** `pre-commit` for local validation hooks

```bash
git clone --recursive https://github.com/chimera-lab/chimera-lab.git
cd chimera-lab

npm i -g @chimera-lab/cli
cmr --help
```

To enable local hooks before committing, install `pre-commit` and run:

```bash
pre-commit install
```

The root `make install` target is a template placeholder. Use it only after adding project-specific dependency commands, or follow the installation steps documented by the specific subproject or template you are working with.

● skill(write)

● Read README.md
└ L1:220 (220 lines read)

● Read DEVELOPMENT.md
└ L1:260 (144 lines read)

● Read Makefile
└ L1:220 (79 lines read)

● Search (grep)
│ "(?i)install|installation|setup|requirements|prerequisites|make " in
│ README.md|DEVELOPMENT.md|docs/\*\*/\*.md|Makefile
└ No matches found

To work with this repository locally, clone it with submodules enabled, install the Chimera CLI, and then run the repository setup target:

```bash
git clone --recursive https://github.com/chimera-lab/chimera-lab.git
cd chimera-lab

npm i -g @chimera-lab/cli
cmr --help

make install
```

Installing Git with submodule support, Node.js with npm, and GNU Make is required before starting.

For local validation before committing, install the pre-commit hooks as an optional but recommended step:

```bash
pre-commit install
```

I’m pulling the repository’s setup details first so the installation text matches the actual workflow.

● Read DEVELOPMENT.md
└ L1:220 (144 lines read)

● Read README.md
└ L1:220 (198 lines read)

● Read Makefile
└ L1:220 (79 lines read)

● Search (glob)
│ ".github/{agents,prompts}/\*\*/\*"
└ 35 files found

I found the documented setup flow; now I’m having the writer agent turn that into polished installation copy aligned with the repo’s templates.

● Read writer.agent.md
│ .github/agents/writer.agent.md
└ L1:220 (60 lines read)

● Read write.prompt.md
│ .github/prompts/write.prompt.md
└ L1:220 (32 lines read)

This repository is the organization-level super-repository/template for chimera-lab.org. To work with it locally, install Git with submodule support, Node.js/npm, and GNU Make, then run:

```bash
git clone --recursive https://github.com/chimera-lab/chimera-lab.git
cd chimera-lab

npm i -g @chimera-lab/cli
cmr --help

make install
```

Optional but recommended: install `pre-commit` hooks for local checks before committing.

```bash
pre-commit install
```

**Writer**● Writer Draft installation copy
│ Read Makefile
│   └ L1:220 (79 lines read)
└ Todo completed draft-installation-section

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

## :keyboard: Usage

<!-- llm<Usage;applied> -->

● Read README.md
└ L1:260 (260 lines read)

● Read DEVELOPMENT.md
└ L1:220 (144 lines read)

● Read Makefile
└ 79 lines read

I found the repository’s existing usage patterns and I’m having the writer subagent turn them into concise section copy aligned with the repo’s docs.

Use this repository as the shared template and documentation baseline for chimera-lab.org projects. Day-to-day work is done through `make`, while the CMR targets keep repository documentation, tags, and template state aligned.

```bash
make install
make test
make lint
make format
make check
make clean
make setup
```

```bash
make cmr-check
make cmr-template-diff
make cmr-template-update
make cmr-render
make cmr-pipeline
```

The CMR targets wrap the underlying `cmr` commands used for documentation checks, template synchronization, and TOC/tag refreshes.● Writer(gpt-5.4-mini) Drafting usage docs
│ Read DEVELOPMENT.md
│   └ L1:220 (144 lines read)
└ Read Makefile
└ L1:260 (79 lines read)

Use this repository as the shared template and documentation baseline for chimera-lab.org projects. Day-to-day work is handled through `make`, while the CMR targets keep documentation, tags, and template state aligned.

```bash
make install
make test
make lint
make format
make check
make clean
make setup
```

```bash
make cmr-check
make cmr-template-diff
make cmr-template-update
make cmr-render
make cmr-pipeline
```

The CMR targets wrap the underlying `cmr` commands for documentation checks, template synchronization, and TOC/tag refreshes.

● skill(write)

I’m checking the repository’s purpose and existing docs so the Usage text matches the project accurately.

● Read README.md
└ L1:220 (220 lines read)

● Read DEVELOPMENT.md
└ L1:220 (144 lines read)

● Search (grep)
│ "\bUsage\b|installation|quick start|getting started|make " in \*.md
└ 9 lines found

This repository is used primarily as a **shared template, documentation baseline, and organization index** for chimera-lab.org projects rather than as a standalone application. The usual workflow is to clone the repository, install the Chimera CLI, and use the provided `make` targets for setup, validation, and maintenance tasks.

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

● skill(write)

I’m pulling the repository context first so the Usage copy matches how this project is actually used.

● Read README.md
└ L1:240 (124 lines read)

● Read DEVELOPMENT.md
└ L1:240 (144 lines read)

● Read CHANGELOG.md
└ L1:200 (26 lines read)

● Read AGENTS.md
└ L1:240 (150 lines read)

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

● skill(explain)

I’m pulling the repo’s documented usage so I can give you the exact way it’s intended to be used.

**Usage summary:** This repo is a **template / documentation-content repository**, not a standalone app. The documented way to use it is to clone it, set up the CMR CLI, and then use `make` targets for common contributor tasks.

### :keyboard: Documented commands/steps

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

#### :keyboard: Extra documented checks

```bash
pre-commit install
pre-commit run --all-files
cmr docs check
cmr docs fix -r toc -r header-emoji
```

#### :notebook: Notes

- The repository README describes it as a **repository template providing the standard structure, docs, and contribution workflow**.
- The usage docs point you to `make` as the recommended interface for routine development tasks.

#### :keyboard: Files used

- `README.md`
- `DEVELOPMENT.md`

**Developer**● Developer(gpt-5.4-mini) Find repo usage
│ Read README.md
│   └ 46 lines read
└ Read DEVELOPMENT.md
└ 144 lines read

**Usage:** this repo is mainly a **template/documentation repository**, not a standalone app to “run.” The intended workflow is to clone it, install the Chimera CLI, and use the provided `make` targets.

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

You can also use the documented checks directly:

```bash
pre-commit install
pre-commit run --all-files
cmr docs check
cmr docs fix -r toc -r header-emoji
```

Source: `README.md`, `DEVELOPMENT.md`.

## :books: References

- [:page_facing_up: CODE\_OF\_CONDUCT.md](CODE_OF_CONDUCT.md)
- [:page_facing_up: CONTRIBUTING.md](CONTRIBUTING.md)
- [:page_facing_up: SECURITY.md](SECURITY.md)
- [:page_facing_up: ./docs/STRUCTURE.md](./docs/STRUCTURE.md) - Project Structure
- [:page_facing_up: ./docs/ORGANIZATION.md](./docs/ORGANIZATION.md) - Managing entity

## :scroll: License

- Licensed under the terms specified in [:link: LICENSE](LICENSE). Review before distributing or reusing this template.

<!-- llm<tags:org.template;applied> -->

● Search (glob)
│ "\*\*/\*.md"
└ 11 files found

● Search (grep)
│ "tags:org.template|org.template|tags:" in \*\*/\*.md
└ 133 lines found

I found the tag references; now I’m pulling the repository’s own guidance for how `org.template` should be described so the section matches the existing docs.

● Read writer.agent.md
│ .github/agents/writer.agent.md
└ L1:220 (60 lines read)

● Read write.prompt.md
│ .github/prompts/write.prompt.md
└ L1:220 (32 lines read)

● Read templates.knowledge.md
│ docs/knowledge/templates.knowledge.md
└ L120:170 (51 lines read)

● Read cmr.knowledge.md
│ original.topic/chimera-lab-cli.app/docs/knowledge/cmr.knowledge.md
└ L779:860 (82 lines read)

● Read STRUCTURE.md
│ template.topic/topic.template/docs/STRUCTURE.md
└ L240:260 (21 lines read)

The repo guidance is specific enough now: `org.template` is the super-repository template and its tag should emphasize organization-wide inventories and `.chimera-lab` conventions. I’m delegating the final wording to the writer agent with that context.

- template
- org● Writer Drafting tag section
  │ Read README.md
  │   │ personal.topic/README.md
  │   └ L24:40 (7 lines read)
  └ Todo completed write-org-template-tags-body

● Read README.md
│ template.topic/org.template/README.md
└ L35:55 (12 lines read)

● Read README.md
│ template.topic/package.template/README.md
└ L35:55 (12 lines read)

● Read README.md
│ personal.topic/README.md
└ L20:35 (11 lines read)

● Read README.md
└ L360:380 (14 lines read)

- template

- org

- template

- org
