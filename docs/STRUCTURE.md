# :file_folder: Repository Structure

## :book: Table of Contents

- [:file_folder: Repository Structure](./#file_folder-repository-structure)
  - [:book: Table of Contents](./#book-table-of-contents)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Root Level](./#building_construction-root-level)
    - [:building_construction: `.chimera-lab/` Directory](./#building_construction-chimera-lab-directory)
    - [:building_construction: `.github/` Directory](./#building_construction-github-directory)
    - [:building_construction: Documentation Hierarchy](./#building_construction-documentation-hierarchy)
    - [:building_construction: Configuration Hierarchy](./#building_construction-configuration-hierarchy)
  - [:books: References](./#books-references)

## :telescope: Overview

This document describes the detailed structure and organization of repository files and directories.

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

GitHub workflows and documentation:

```text
.github/
├── agents/                 # AI agent definitions
│   ├── *.agent.md          # Agent files
│   └── README.md           # Agents overview
├── knowledge/              # Knowledge base documents
│   ├── *.knowledge.md      # Knowledge files
│   └── README.md           # Knowledge overview
├── docs/                   # Detailed documentation
│   ├── ARCHITECTURE.md     # Technical architecture
│   ├── DEVELOPMENT.md      # Development workflow
│   ├── ORGANIZATION.md     # Organization structure
│   └── STRUCTURE.md        # This file
├── prompts/                # Prompt templates
│   └── *.prompt.md         # Prompt files
└── workflows/              # GitHub Actions (if applicable)
    └── *.yml               # Workflow definitions
```

### :building_construction: Documentation Hierarchy

```text
README.md (entry point)
├── .github/knowledge/*.knowledge.md (concepts)
└── .github/docs/*.md (detailed guides)
    ├── ARCHITECTURE.md
    ├── DEVELOPMENT.md
    └── ORGANIZATION.md
```

### :building_construction: Configuration Hierarchy

```text
.chimera-lab/meta.json (metadata)
└── .chimera-lab/settings.json (configuration)
    └── custom_variables (template overrides)
```

## :books: References

- [:page_facing_up: ORGANIZATION.md](ORGANIZATION.md)
- [:page_facing_up: ../../README.md](../../README.md)
