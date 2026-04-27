# :file_folder: Organization

## :book: Table of Contents

- [:file_folder: Organization](./#file_folder-organization)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Knowledge & Research](./#building_construction-knowledge-research)
    - [:building_construction: Implementation](./#building_construction-implementation)
    - [:building_construction: Templates & Tools](./#building_construction-templates-tools)
    - [:building_construction: Template Inheritance](./#building_construction-template-inheritance)
  - [:toolbox: Tools](./#toolbox-tools)
    - [:toolbox: `cmr`](./#toolbox-cmr)
  - [:books: References](./#books-references)

## :telescope: Overview

<!-- <llm prompt="Organization.Overview" applied> -->

chimera-lab.org is the organization-level super-repository for chimera-lab, acting as the central index for shared governance, documentation, and topic-based collections managed as Git submodules. Topic directories such as `arts.topic`, `humanities.topic`, `natural-sciences.topic`, and `projects.topic` group repositories by domain, while the organization’s semantic suffix conventions keep repositories categorized consistently by purpose.

This repository also serves as the common documentation and structure baseline for the organization. Root policy files define governance and contribution expectations, `docs/` holds deeper guidance on organization and structure, and the CMR CLI supports validation, template synchronization, and ongoing repository management workflows

<!-- </llm> -->

## :building_construction: Structure

```text
repository-name.suffix/
├── .chimera-lab/           # Repository metadata
│   ├── meta.json           # Description, tags, template
│   └── settings.json       # Configuration
├── .github/                # GitHub workflows
│   ├── agents/             # AI agent definitions
│   └── prompts/            # Prompt templates
├── docs/                   # Documentation and knowledge
│   └── knowledge/          # Knowledge base
├── README.md               # Main documentation
├── CHANGELOG.md            # Version history
├── CONTRIBUTING.md         # Contribution guidelines
├── CODE_OF_CONDUCT.md      # Community guidelines
├── SECURITY.md             # Security policy
└── LICENSE                 # License terms
```

Repositories are categorized by suffix:

### :building_construction: Knowledge & Research

- **`.topic`** - Knowledge areas, research, documentation collections
- **`.overview`** - High-level summaries and guides

### :building_construction: Implementation

- **`.project`** - Concrete implementations with deliverables
- **`.app`** - Standalone applications (web, mobile, desktop, CLI)
- **`.package`** - Reusable libraries/packages

### :building_construction: Templates & Tools

- **`.scaffold`** - Project templates and generators
- **`.template`** - Reusable document/code templates

### :building_construction: Template Inheritance

Templates are GitHub repositories that provide reusable structures. Repositories inherit from templates through a hierarchical chain.

**Template Hierarchy**:

```text
repository.template (base)
├── topic.template
├── overview.template
├── diy.template
├── app.template
│   └── laravel_app.template
├── project.template
├── scaffold.template
│   └── docker_scaffold.template
└── org.template
```

**How Templates Work**:

1. **Template Selection**: Repositories specify their template in `.chimera-lab/meta.json`
2. **Template Storage**: Template added as Git submodule at `.github/.template`
3. **Inheritance Chain**: Templates inherit from parent templates
   - Example: `laravel_app.template` → `app.template` → `repository.template`
4. **Updates**: Changes propagate down the hierarchy
   - Modify at the highest level that needs the change
   - Use `cmr repo template update` to sync with latest version

**Example Configuration** (`.chimera-lab/meta.json`):

```json
{
  "repo": {
    "template": "app.template"
  },
  "remote_template": {
    "repo": "chimera-lab.org/app.template",
    "branch": "main"
  }
}
```

## :toolbox: Tools

### :toolbox: `cmr`

The CMR CLI (`cmr`) automates chimera-lab.org repositories managing documentation validation, milestones, issues, labels, and git operations for submodules and templates. It unifies discovery, GitHub resources, and template workflows.

## :books: References

- [:page_facing_up: STRUCTURE.md](STRUCTURE.md)
- [:page_facing_up: ../README.md](../README.md)
- [:page_facing_up: knowledge/cmr.knowledge.md](knowledge/cmr.knowledge.md)
