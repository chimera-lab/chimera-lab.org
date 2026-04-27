# :file_folder: Architecture

## :book: Table of Contents

- [:file_folder: Architecture](./#file_folder-architecture)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:triangular_ruler: Technologies](./#triangular_ruler-technologies)
  - [:books: References](./#books-references)

## :telescope: Overview

<!-- llm<Architecture.Overview;applied> -->

I’m pulling just enough repository context to draft the overview in the project’s own language. Then I’ll return only the section body.

● Read README.md
└ L1:220 (220 lines read)

● Read AGENTS.md
└ L1:260 (150 lines read)

● skill(write)

● List directory docs
└ 6 files found

I found the repo’s high-level purpose; I’m checking the architecture-specific docs so the section fits the existing documentation set rather than just the README.

● Read ARCHITECTURE.md
│ docs/ARCHITECTURE.md
└ L1:220 (147 lines read)

● Read ORGANIZATION.md
│ docs/ORGANIZATION.md
└ L1:220 (220 lines read)

● Read STRUCTURE.md
│ docs/STRUCTURE.md
└ L1:220 (220 lines read)

This repository serves as the organization-level super-repository and template baseline for chimera-lab. Root-level governance and contribution documents define shared operating rules, `docs/` provides the canonical guidance and diagrams, `.github/` contains automation assets such as workflows, prompts, skills, and agent definitions, and the `.topic` directories organize subject-area collections and related repositories.

The architecture is designed around clear separation of concerns and template-driven consistency. Policy remains at the root, documentation stays in `docs/`, automation is isolated in `.github/`, and domain organization is handled through topic collections and templates. The agent-oriented documentation model further links prompts, agents, skills, knowledge, and reference documents through explicit relationships, making shared standards easier to maintain, propagate, and reuse across chimera-lab repositories.

● skill(write)

● Read README.md
└ L1:220 (220 lines read)

● Read AGENTS.md
└ L1:260 (150 lines read)

● Search (grep)
│ "Architecture.Overview|# .\*Architecture|## .*Architecture|Architecture" in
│ \*\*/*.{md,puml,yml,yaml}
└ 8 lines found

I found the repository’s architecture template and core reference docs; next I’m having the writer agent draft a section that matches this repo rather than a generic template.

● Read ARCHITECTURE.md
│ template.topic/topic.template/docs/ARCHITECTURE.md
└ L1:220 (102 lines read)

● Read agents-relation.puml
│ docs/diagrams/agents-relation.puml
└ L1:220 (166 lines read)

● Read GOVERNANCE.md
└ L1:200 (53 lines read)

This repository is the organization-level super-repository and template baseline for chimera-lab. At the top level, governance and contributor documents define the common operating rules, `docs/` holds the canonical guidance and diagrams, `.github/` contains automation assets such as workflows, prompts, skills, and agent definitions, and the topic-based directories organize subject-area collections and related repositories. Together, these parts make the repository both a central reference point and a reusable structural model for the wider organization.

The architecture emphasizes clear separation of concerns: policy at the root, detailed documentation in `docs/`, automation in `.github/`, and domain organization through the `.topic` collections and templates. The agent-oriented documentation model adds another layer of consistency by connecting prompts, agents, skills, knowledge, and reference documents through explicit relationships. This design supports maintainability by keeping shared standards centralized, making template-driven updates easier to propagate, and helping repositories across chimera-lab remain structurally consistent and easier to manage.● Writer Draft architecture prose
│ Search (glob)
│   │ "\*\*/\*" in .github
│   └ 55 files found
└ Todo completed draft-architecture-overview

This repository serves as the organization-level super-repository and template baseline for chimera-lab. Root-level governance and contribution documents define shared operating rules, `docs/` provides the canonical guidance and diagrams, `.github/` contains automation assets such as workflows, prompts, skills, and agent definitions, and the `.topic` directories organize subject-area collections and related repositories. Together, these layers make the repository both a central reference point and a reusable structural model for the wider organization.

The architecture is designed around clear separation of concerns and template-driven consistency. Policy remains at the root, documentation stays in `docs/`, automation is isolated in `.github/`, and domain organization is handled through topic collections and templates. The agent-oriented documentation model further links prompts, agents, skills, knowledge, and reference documents through explicit relationships, making shared standards easier to maintain, propagate, and reuse across chimera-lab repositories.

## :building_construction: Structure

<!-- llm<Architecture.Structure;applied> -->

● skill(write)

● Search (glob)
│ ".github/agents/\*.md"
└ 12 files found

● Search (glob)
│ ".github/prompts/\*.md"
└ 23 files found

● Search (glob)
│ "\*\*/*architecture*"
└ 1 file found

● Search (grep)
│ "Architecture.Structure|Architecture|Structure" in \*\*/\*.md
└ 13 files found

I’m locating the repository’s documentation pattern for architecture sections so the section matches existing structure and terminology.

● Read writer.agent.md
│ .github/agents/writer.agent.md
└ L1:220 (60 lines read)

● Read write.prompt.md
│ .github/prompts/write.prompt.md
└ L1:220 (32 lines read)

● Search (grep)
│ "^## .\*Architecture.Structure|^### .\*Architecture.Structure|^#
│ .*Architecture.Structure" in \*\*/*.md
└ No matches found

● Search (grep)
│ "Architecture.Structure" in \*\*/\*.md
└ 73 lines found

● Search (grep)
│ "^## .\*Structure|^### .*Structure" in \*\*/*.md
└ 8 lines found

I found the exact placeholder and I’m reading the nearby architecture and structure docs to mirror this repo’s template language rather than guessing.

● Read ARCHITECTURE.md
│ docs/ARCHITECTURE.md
└ L1:140 (140 lines read)

● Read STRUCTURE.md
│ docs/STRUCTURE.md
└ L180:250 (71 lines read)

● Read README.md
└ L1:220 (220 lines read)

● Read AGENTS.md
└ L1:220 (150 lines read)

I’ve got the repository’s exact placeholder and supporting docs. I’m delegating a final pass to the writer subagent so the wording stays aligned with the repo’s own architecture language.

This repository is organized as the chimera-lab.org super-repository: a central structure that combines shared governance, canonical documentation, GitHub automation assets, and topic-based collections managed as Git submodules. Root-level documents provide the authoritative organization-wide policies and entry points, while `docs/` contains the deeper architecture, organization, roadmap, structure, diagrams, and knowledge content that explain how the repository and wider organization operate.

Subject and work domains are grouped through root-level `.topic` directories such as `arts.topic/`, `projects.topic/`, and `template.topic/`, giving the repository a scalable way to index related collections and templates. Supporting automation lives under `.github/`, including workflows, prompts, skills, and agent definitions, while narrative guidance and governance remain in root documents and `docs/` to preserve clear separation between documentation and automation.

The structure also follows the repository’s layered agent and documentation model: prompts route to agents, agents use skills, skills reference knowledge, and knowledge points back to documentation without skipping layers. This keeps responsibilities explicit, supports consistent maintenance across repositories, and makes the super-repository both a central reference point and a control surface for the chimera-lab.org documentation and agent ecosystem.● Writer Draft architecture section
│ Read STRUCTURE.md
│   │ docs/STRUCTURE.md
│   └ L1:260 (260 lines read)
└ Read ARCHITECTURE.md
│ docs/ARCHITECTURE.md
└ L1:260 (147 lines read)

This repository is organized as the chimera-lab.org super-repository: a central structure that combines shared governance, canonical documentation, GitHub automation assets, and topic-based collections managed as Git submodules. Root-level documents provide the authoritative organization-wide policies and entry points, while `docs/` contains the deeper architecture, organization, roadmap, structure, diagrams, and knowledge content that explain how the repository and wider organization operate.

Subject and work domains are grouped through root-level `.topic` directories such as `arts.topic/`, `projects.topic/`, and `template.topic/`, giving the repository a scalable way to index related collections and templates. Supporting automation lives under `.github/`, including workflows, prompts, skills, and agent definitions, while narrative guidance and governance remain in root documents and `docs/` to preserve clear separation between documentation and automation.

The structure also follows the repository’s layered agent and documentation model: prompts route to agents, agents use skills, skills reference knowledge, and knowledge points back to documentation without skipping layers. This keeps responsibilities explicit, supports consistent maintenance across repositories, and makes the super-repository both a central reference point and a control surface for the chimera-lab.org documentation and agent ecosystem.

● skill(write)

● Read README.md
└ L1:220 (220 lines read)

● Read AGENTS.md
└ L1:260 (150 lines read)

● Search (grep)
│ "Architecture.Structure|architecture|Structure" in \*.md
└ 12 files found

I found the repository’s architectural pattern in the agent and README docs; now I’m checking for any template-specific wording so the section matches the project’s documentation style.

● Read agents-relation.puml
│ docs/diagrams/agents-relation.puml
└ L1:220 (166 lines read)

● Read DEVELOPMENT.md
└ L1:220 (144 lines read)

● Search (grep)
│ "Architecture.Structure|## .\*Structure|### .*Structure|Layer separation
│ pattern|submodules" in docs/\*\*/*.md
└ 35 lines found

● Search (grep)
│ "Architecture.Structure|## .*Structure|### .*Structure" in
│ \*\*/*.template/\*\*/*.md
└ 8 lines found

I found the exact target placeholder in `docs/ARCHITECTURE.md` plus matching wording in `ORGANIZATION` and knowledge docs. I’m pulling those sections together to keep the final text aligned with the repo’s established architecture language.

● Read ARCHITECTURE.md
│ docs/ARCHITECTURE.md
└ L1:120 (25 lines read)

● Read ORGANIZATION.md
│ docs/ORGANIZATION.md
└ L174:240 (66 lines read)

● Read repository.knowledge.md
│ docs/knowledge/repository.knowledge.md
└ L1:120 (60 lines read)

● Read organization.knowledge.md
│ docs/knowledge/organization.knowledge.md
└ L43:110 (68 lines read)

● Read STRUCTURE.md
│ docs/STRUCTURE.md
└ L193:260 (68 lines read)

This repository is organized as the chimera-lab.org super-repository: a central top-level structure that combines shared governance, organization-wide documentation, GitHub automation assets, and topic-based collections managed as Git submodules. The root holds canonical project documents, while `docs/` contains the deeper architecture, organization, roadmap, structure, diagram, and knowledge material that defines how the organization operates.

Its subject and work domains are grouped through root-level `.topic` directories such as `arts.topic/`, `projects.topic/`, and `template.topic/`, which provide a scalable hierarchy for related repositories and collections. Supporting automation and operational assets live under `.github/`, while repository policy and contributor-facing standards remain at the root or in `docs/`, keeping implementation, governance, and automation concerns clearly separated.

The repository also reflects the organization’s layered agent architecture where prompts route work to agents, agents use skills, skills reference knowledge, and knowledge points back to documentation without skipping layers. In structural terms, this makes the repository both a super-repository for coordinated content and a documentation-backed control surface for the Chimera agent and tooling ecosystem.● Writer Drafting architecture section
│ Read agents-relation.puml
│   │ docs/diagrams/agents-relation.puml
│   └ 166 lines read
└ Todo completed draft-architecture-structure

This repository is organized as the chimera-lab.org super-repository: a central top-level structure that combines shared governance, organization-wide documentation, GitHub automation assets, and topic-based collections managed as Git submodules. The root holds canonical project documents, while `docs/` contains the deeper architecture, organization, roadmap, structure, diagram, and knowledge material that defines how the organization operates.

Its subject and work domains are grouped through root-level `.topic` directories such as `arts.topic/`, `projects.topic/`, and `template.topic/`, which provide a scalable hierarchy for related repositories and collections. Supporting automation and operational assets live under `.github/`, while repository policy and contributor-facing standards remain at the root or in `docs/`, keeping implementation, governance, and automation concerns clearly separated.

The repository also reflects the organization’s layered agent architecture where prompts route work to agents, agents use skills, skills reference knowledge, and knowledge points back to documentation without skipping layers. In structural terms, this makes the repository both a super-repository for coordinated content and a documentation-backed control surface for the Chimera agent and tooling ecosystem.

## :triangular_ruler: Technologies

<!-- llm<Architecture.Technologies;applied> -->

● skill(write)

I’m pulling the repository context first so the section reflects the actual stack and layout instead of generic wording.

This repository is documentation-centric rather than application-centric. Its technology stack centers on Markdown content, repository metadata, and automation for template-driven maintenance.

- **Markdown** for the primary documentation, knowledge files, and repository guidance.
- **Git** with **submodules** for organizing the organization-level super-repository and topic collections.
- **.chimera-lab** JSON metadata for template selection, repository settings, labels, and validation rules.
- **GitHub Actions** for CI and pre-commit automation.
- **GNU Make** for common repository tasks such as setup, validation, and cleanup.
- **pre-commit** with **mdformat**, **Prettier**, and standard hook checks to keep docs and config files consistent.
- **EditorConfig** to enforce shared whitespace, line-ending, and indentation rules.

The repository uses configuration-heavy formats such as **JSON**, **YAML**, and **TOML** alongside Markdown, with the **CMR CLI (`cmr`)** providing documentation validation and template management workflows.● Writer(gpt-5.4-mini) Draft technologies section
│ Read README.md
│   └ L1:120 (120 lines read)
└ Read .editorconfig
└ 37 lines read

I have a draft from the writer path; I’m checking the specific files it relies on so the final section only mentions technologies that are actually present here.

● Search (glob)
│ "{README.md,Makefile,.gitmodules,.editorconfig,.pre-commit-config.yaml,.gith
│ ub/workflows/*,.chimera-lab/\*\*/*,\*\*/\*.{toml,yaml,yml,json}}"
└ 10 files found

● Search (grep)
│ "\bcmr\b|mdformat|prettier|pre-commit|GitHub
│ Actions|submodule|EditorConfig|.chimera-lab" in
│ {README.md,Makefile,.pre-commit-config.yaml,.editorconfig,.gitmodules,.githu
│ b/workflows/*,\*\*/*.md,\*\*/\*.{json,toml,yaml,yml}}
└ 7 lines found

● Read README.md
└ L1:220 (220 lines read)

● Read .gitmodules
└ L1:220 (39 lines read)

● Read Makefile
└ L1:220 (79 lines read)

● Read .pre-commit-config.yaml
└ L1:220 (32 lines read)

● Read .editorconfig
└ L1:220 (37 lines read)

● Read DEVELOPMENT.md
└ L1:220 (144 lines read)

● Search (glob)
│ ".chimera-lab/\*\*/\*"
└ 70 files found

● Search (glob)
│ ".github/workflows/\*"
└ 2 files found

● Read settings.json
│ .chimera-lab/settings.json
└ L1:220 (220 lines read)

● Read ci.yml
│ .github/workflows/ci.yml
└ L1:240 (56 lines read)

● Read pre-commit.yml
│ .github/workflows/pre-commit.yml
└ L1:220 (30 lines read)

● Read meta.json
│ .chimera-lab/meta.json
└ L1:220 (30 lines read)

This repository is **documentation- and configuration-centric** rather than a conventional application runtime. Its architecture combines Markdown-first content, Git-managed topic submodules, and automation that keeps templates, validation, and repository standards consistent across `chimera-lab.org`.

- **Markdown** is the primary medium for documentation, knowledge files, prompts, and agent definitions.

- **Git submodules** organize the super-repository by linking topic collections and the shared repository template.

- **CMR CLI (`cmr`)**, installed via **Node.js/npm**, handles documentation checks, tag and TOC rendering, and template synchronization.

- **GNU Make** provides the common automation entry points for setup, validation, rendering, and template maintenance.

- **GitHub Actions** runs CI and pre-commit workflows from `.github/workflows/`.

- **pre-commit** enforces repository hygiene, including **mdformat** for Markdown and **Prettier** for YAML.

- **EditorConfig** plus repository metadata in **JSON**, **YAML**, and **TOML** define shared formatting, validation patterns, labels, and template settings.

- This repository is documentation- and governance-first rather than application-first: its primary technologies are Git with submodules for the root `.topic` collections, Markdown for canonical content, and JSON metadata under `.chimera-lab/`.

- Operational tooling is centered on the Chimera CLI (`cmr`, installed via npm as `@chimera-lab/cli`) and GNU Make, which provide the standard interface for documentation validation and repair (`cmr docs check`, `cmr docs fix`) and template synchronization (`cmr repo template diff`, `cmr repo template update`).

- Automation is organized through GitHub-native assets in `.github/`, including GitHub Actions workflows and agent/prompt/skill definitions, with `pre-commit` used for local repository checks.

- Architectural and organizational relationships are modeled with PlantUML (`.puml`) diagrams, reinforcing the repository’s role as a super-repository and template baseline for chimera-lab.org.● Technical-writer Draft technologies section
  │ Todo completed architecture-technologies-section
  └ Memory stored documentation
  └ Use CMR CLI and Make targets for doc validation and template sync: cmr docs
  chec…

- **Content and structure:** Markdown is the primary source format, with repository-wide metadata and configuration stored in JSON under `.chimera-lab/`.

- **Repository management:** Git underpins the super-repository, with `.topic` submodules used to organize the broader chimera-lab.org knowledge structure.

- **Documentation tooling:** GNU Make and the Chimera CLI (`cmr`, distributed as `@chimera-lab/cli`) provide the main automation surface for validation, repair, and template synchronization.

- **Automation and governance:** GitHub-native workflows in `.github/`, along with `pre-commit`, support repository checks, policy enforcement, and contributor operations.

- **Architecture modeling:** PlantUML diagrams are used to describe structural relationships such as agent, prompt, skill, and knowledge-module interactions.

## :books: References

- [:page_facing_up: ../README.md](../README.md)
