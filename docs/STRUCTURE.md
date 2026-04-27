# :file_folder: Repository Structure

## :book: Table of Contents

- [:file_folder: Repository Structure](./#file_folder-repository-structure)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Root Level](./#building_construction-root-level)
    - [:building_construction: `.chimera-lab/` Directory](./#building_construction-chimera-lab-directory)
    - [:building_construction: `.github/` Directory](./#building_construction-github-directory)
    - [:building_construction: `docs/` Directory](./#building_construction-docs-directory)
    - [:building_construction: Documentation Hierarchy](./#building_construction-documentation-hierarchy)
    - [:building_construction: Configuration Hierarchy](./#building_construction-configuration-hierarchy)
  - [:books: References](./#books-references)

## :telescope: Overview

<!-- llm<Structure.Overview;applied> -->

This repository uses a layered layout that separates governance, automation, documentation, and topic collections. Root-level files provide the main entry point and shared project policies, `.chimera-lab/` stores repository metadata and template configuration, `.github/` contains agent, prompt, and workflow automation assets, and `docs/` holds extended documentation, diagrams, and knowledge files.

At the top level, the repository also groups organization content into subject-based `.topic` directories such as `arts.topic`, `humanities.topic`, `natural-sciences.topic`, and `projects.topic`, which are managed as submodules. This structure keeps the repository predictable, supports organization-wide consistency, and makes it easier to navigate shared standards, reference material, and related topic areas.● Writer Draft structure overview
  │ List directory .chimera-lab
  │   └ 3 files found
  └ Todo completed draft-structure-overview

I’m checking a couple of repo details so the section stays aligned with the actual layout.

● Read README.md
  └ L1:220 (220 lines read)

● Read AGENTS.md
  └ L1:260 (150 lines read)

✗ List top-level tracked and hidden entries (shell)
  │ git --no-pager ls-tree --name-only HEAD | sed -n '1,120p' && printf
  │ '\n--hidden--\n' && find . -maxdepth 1 -mindepth 1 -name '.*' -printf '%f\n'
  │ | sort
  └ Permission denied and could not request permission from user

This repository is the organization-level super-repository and template for chimera-lab.org, providing a shared baseline for governance, documentation, and repository management. Its structure combines root-level policy and reference files with extended guidance in `docs/` and automation assets in `.github/` so standards and workflows remain centralized and consistent.

At the top level, subject-based `.topic` directories group related domains such as arts, humanities, natural sciences, social sciences, and projects, with each topic managed as a submodule. This layout keeps the repository predictable, makes navigation easier, and supports consistent maintenance across the organization.

● Read AGENTS.md
  └ 150 lines read

● Search (grep)
  │ "Structure|Overview" in **/*.md
  └ 10 lines found

I found the repository’s overview templates; I’m pulling the structure-specific pattern so the section matches the project’s existing documentation style.

● Read README.md
  │ template.topic/overview.template/README.md
  └ L1:120 (46 lines read)

● Search (glob)
  │ "**/STRUCTURE.md"
  └ 74 files found

● Search (grep)
  │ "Structure\.Overview|STRUCTURE\.md|## .*Structure|### .*Overview" in **/*.md
  └ 10 lines found

I’ve narrowed it to the project’s canonical `docs/STRUCTURE.md`; next I’m extracting the repository-specific layout and wording pattern for the overview paragraph.

● Read STRUCTURE.md
  │ docs/STRUCTURE.md
  └ L1:220 (219 lines read)

● Read STRUCTURE.md
  │ template.topic/repository.template/docs/STRUCTURE.md
  └ L1:220 (219 lines read)

● Read STRUCTURE.md
  │ template.topic/topic.template/docs/STRUCTURE.md
  └ L1:220 (219 lines read)

This repository defines the standard chimera-lab.org documentation and governance layout. `README.md` serves as the main entry point, root-level files provide core project policies and contributor guidance, `.chimera-lab/` stores repository metadata and configuration, `.github/` contains GitHub automation assets such as agents, prompts, and workflows, and `docs/` holds extended guides, diagrams, and knowledge files. The structure follows organization-wide conventions so repositories remain consistent, easier to navigate, and simpler to maintain.

I’m pulling the repository’s top-level docs and layout so the section matches the project’s actual structure and terminology.

● Read README.md
  └ L1:220 (124 lines read)

● Read AGENTS.md
  └ L1:260 (150 lines read)

● List directory .
  └ 31 files found

I found the repository’s layout and top-level description; now I’m checking the structure document so the overview aligns with the existing section scheme.

● Read STRUCTURE.md
  │ docs/STRUCTURE.md
  └ L1:260 (218 lines read)

● Read DEVELOPMENT.md
  └ L1:220 (144 lines read)

● Read ORGANIZATION.md
  │ docs/ORGANIZATION.md
  └ L1:220 (212 lines read)

This repository provides the standard chimera-lab.org layout for documentation, governance, and contribution workflows. `README.md` is the primary entry point, while root-level files define common project policies and contributor guidance. Supporting repository metadata and configuration live in `.chimera-lab/`, GitHub-specific automation assets such as agents, prompts, and workflows belong in `.github/`, and extended guides, diagrams, and knowledge files are organized under `docs/`. This structure keeps repositories consistent across the organization and makes navigation, maintenance, and template-driven updates predictable.

● skill(write)

I’m pulling a bit of repository context so the section matches the existing documentation structure and terminology.

● Read README.md
  └ L1:220 (124 lines read)

● Search (glob)
  │ "**/*.{md,knowledge.md}" in docs
  └ 18 files found

● Search (grep)
  │ "Structure" in **/*.md
  └ 8 lines found

I found the repo’s structure docs; I’m reading the canonical structure pages now so the section aligns with existing language instead of inventing new terminology.

● Read STRUCTURE.md
  │ docs/STRUCTURE.md
  └ L1:260 (180 lines read)

● Read ORGANIZATION.md
  │ docs/ORGANIZATION.md
  └ L1:220 (111 lines read)

● Read repository.knowledge.md
  │ docs/knowledge/repository.knowledge.md
  └ L1:220 (60 lines read)

I’ve got the canonical structure docs. I’m handing the final wording to the writing subagent so the section comes back as repository-native markdown, not an ad hoc summary.

This repository is the standard template and documentation baseline for chimera-lab.org projects. It defines the expected repository layout, core project documents, and contribution workflow, with `README.md` as the main entry point and deeper guides under `docs/`. Root-level files provide the common governance and contributor materials, `.chimera-lab/` stores repository metadata and configuration, `.github/` is reserved for GitHub automation assets such as agents, prompts, and workflows, and `docs/` contains narrative documentation, diagrams, and `docs/knowledge/` knowledge files. The structure follows organization-wide naming and layout conventions so repositories remain consistent and easier to navigate.● Writer Write structure overview
  │ Read README.md
  │   └ 124 lines read
  └ Todo completed write-structure-overview

This repository is the standard template and documentation baseline for chimera-lab.org projects. It defines the expected repository layout, core project documents, and contribution workflow, with `README.md` as the main entry point and deeper guides under `docs/`. Root-level files provide the common governance and contributor materials, `.chimera-lab/` stores repository metadata and configuration, `.github/` is reserved for GitHub automation assets such as agents, prompts, and workflows, and `docs/` contains narrative documentation, diagrams, and `docs/knowledge/` knowledge files. The structure follows organization-wide naming and layout conventions so repositories remain consistent and easier to navigate.

I’m locating the relevant structure documentation and delegating the lookup so I can return the exact overview cleanly.

● Todo added Find structure overview

● Search (glob)
  │ ".github/agents/*.md"
  └ 12 files found

● Search (grep)
  │ "Structure|Overview" in *.md
  └ 9 lines found

I found the likely sources. Next I’m reading the agent/prompt context and handing the lookup to the right subagent so the answer is grounded in the repo’s own structure docs.

● Read chimera.agent.md
  │ .github/agents/chimera.agent.md
  └ L1:220 (69 lines read)

● Read developer.agent.md
  │ .github/agents/developer.agent.md
  └ L1:220 (48 lines read)

● Read README.md
  │ template.topic/overview.template/README.md
  └ L1:220 (46 lines read)

● Search (glob)
  │ ".github/prompts/*.md"
  └ 23 files found

I’ve confirmed this is a documentation lookup, not an implementation task. I’m sending it to the `developer` subagent with the repo’s prompt conventions so I can give you the repo-native overview, not a guess.

● Read explain.prompt.md
  │ .github/prompts/explain.prompt.md
  └ L1:220 (30 lines read)

● Read STRUCTURE.md
  │ docs/STRUCTURE.md
  └ L1:260 (108 lines read)

`Structure.Overview` describes the repository’s standard layout and how its top-level directories are meant to be used.

Key points:
- Root files cover core repo docs like `README.md`, `CHANGELOG.md`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, and `LICENSE`.
- `.chimera-lab/` stores repository metadata and configuration.
- `.github/` is reserved for GitHub automation, agents, prompts, and workflows only.
- `docs/` contains narrative documentation, guides, standards, and knowledge files.
- The docs hierarchy separates the README entry point from deeper guides in `docs/` and concepts in `docs/knowledge/`.

Source: `/home/lab/Desktop/chimera-lab.org/docs/STRUCTURE.md`

**developer**● Developer(gpt-5.4-mini) Summarizing structure
  │ Read explain.prompt.md
  │   │ .github/prompts/explain.prompt.md
  │   └ 30 lines read
  └ Read STRUCTURE.md
      │ docs/STRUCTURE.md
      └ L1:120 (108 lines read)

✔ Todo completed structure-overview

**Structure.Overview** describes the repository’s standard layout and the role of each top-level area.

Key points:
1. Root files hold the core project docs: `README.md`, `CHANGELOG.md`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, and `LICENSE`.
2. `.chimera-lab/` contains repository metadata and configuration.
3. `.github/` is reserved for automation assets like agents, prompts, and workflows.
4. `docs/` contains narrative documentation, guides, and knowledge content.
5. The documentation hierarchy uses `README.md` as the entry point, with deeper guides and concepts under `docs/`.

**Source:** `docs/STRUCTURE.md`

## :building_construction: Structure

### :building_construction: Root Level

```text
repository/
├── .chimera-lab/           # Repository metadata and configuration
├── .github/                # GitHub-specific files
├── docs/                   # Additional documentation (project-specific)
├── src/                    # Source code (if applicable)
├── tests/                  # Test files (if applicable)
├── README.md               # Main documentation
├── CHANGELOG.md            # Version history
├── CONTRIBUTING.md         # Contribution guidelines
├── CODE_OF_CONDUCT.md      # Community guidelines
├── SECURITY.md             # Security policy
└── LICENSE                 # License terms
```

### :building_construction: `.chimera-lab/` Directory

Configuration and metadata:

```text
.chimera-lab/
├── meta.json               # Repository metadata
│   ├── description         # Short description
│   ├── tags                # Category tags
│   ├── template            # Template name
│   └── remote_template     # Template repository info
└── settings.json           # Configuration
    ├── custom_variables    # Template variables
    └── validation_rules    # Documentation rules
```

### :building_construction: `.github/` Directory

GitHub workflows and automation. `.github/` is reserved for GitHub automation and workflow artifacts only — keep narrative guides and standards in `docs/` instead.

```text
.github/
├── agents/                 # AI agent definitions
│   ├── *.agent.md          # Agent files
│   └── README.md           # Agents overview
├── prompts/                # Prompt templates
│   └── *.prompt.md         # Prompt files
└── workflows/              # GitHub Actions (if applicable)
    └── *.yml               # Workflow definitions
```

### :building_construction: `docs/` Directory

Documentation and knowledge base:

```text
docs/
├── ARCHITECTURE.md         # Technical architecture
├── ORGANIZATION.md         # Organization structure
├── ROADMAP.md              # Project roadmap
├── STRUCTURE.md            # Repository structure (this file)
├── diagrams/               # Diagrams and visual assets
└── knowledge/              # Knowledge base
    └── *.knowledge.md      # Knowledge files
```

### :building_construction: Documentation Hierarchy

```text
README.md (entry point)
├── docs/knowledge/*.knowledge.md (concepts)
└── docs/*.md (detailed guides)
    ├── ARCHITECTURE.md
    ├── ORGANIZATION.md
    ├── ROADMAP.md
    └── STRUCTURE.md
```

### :building_construction: Configuration Hierarchy

```text
.chimera-lab/meta.json (metadata)
└── .chimera-lab/settings.json (configuration)
    └── custom_variables (template overrides)
```

## :books: References

- [:page_facing_up: ORGANIZATION.md](ORGANIZATION.md)
- [:page_facing_up: ../README.md](../README.md)
