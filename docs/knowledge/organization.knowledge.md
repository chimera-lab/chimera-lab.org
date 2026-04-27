---
name: organization
description: Chimera Lab organization structure, repository types, topic hierarchy, and metadata conventions
---

# Organization Knowledge

## :book: Table of Contents

- [Organization Knowledge](./#organization-knowledge)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
    - [:building_construction: Hierarchy](./#building_construction-hierarchy)
    - [:building_construction: Template Inheritance](./#building_construction-template-inheritance)
  - [:jigsaw: Components](./#jigsaw-components)
    - [:jigsaw: `.topic` - Knowledge Topics](./#jigsaw-topic-knowledge-topics)
    - [:jigsaw: `.project` - Dedicated Projects](./#jigsaw-project-dedicated-projects)
    - [:jigsaw: `.app` - Applications](./#jigsaw-app-applications)
    - [:jigsaw: `.package` - Packages/Libraries](./#jigsaw-package-packageslibraries)
    - [:jigsaw: `.scaffold` - Scaffolds](./#jigsaw-scaffold-scaffolds)
    - [:jigsaw: `.template` - Templates](./#jigsaw-template-templates)
  - [:page_facing_up: Files](./#page_facing_up-files)
  - [:keyboard: Usage](./#keyboard-usage)
    - [:keyboard: List Organizations](./#keyboard-list-organizations)
    - [:keyboard: Navigate to Organization](./#keyboard-navigate-to-organization)
    - [:keyboard: List Topics](./#keyboard-list-topics)
    - [:keyboard: List Projects](./#keyboard-list-projects)
    - [:keyboard: Rules](./#keyboard-rules)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Submodule Management](./#world_map-submodule-management)
    - [:world_map: Graph Analysis](./#world_map-graph-analysis)
    - [:world_map: Best Practices](./#world_map-best-practices)
  - [:mag: Terminology](./#mag-terminology)

## :telescope: Overview

A **Chimera Lab Organization** is a super-repository containing:

- Multiple projects as Git submodules
- Shared templates and configurations
- Centralized documentation and rules
- Topic-based knowledge organization

## :building_construction: Structure

```text
chimera-lab.org/                    # Organization root
├── .chimera-lab/                   # Organization metadata
│   ├── settings.json               # Default labels, milestones
│   └── meta.json                   # Organization metadata
├── .git/                           # Git super-repository
├── .gitmodules                     # Submodule definitions
├── administration.topic/           # Admin knowledge area
│   ├── administration-tools.topic/
│   ├── linux-administration.topic/
│   └── windows-administration.topic/
├── projects.topic/                 # Projects collection
│   ├── chimera-lab-blog.project/
│   ├── chimera-lab-store.project/
│   └── chimera-lab-chat.project/
├── original.topic/                 # Original/source code
│   ├── chimera-lab-cli.app/
│   ├── chimera-lab-laravel.package/
│   └── organizer.project/
├── template.topic/                 # Repository templates
└── reports/                        # Generated reports
```

### :building_construction: Hierarchy

Organization → Topic → Sub-Topic → Repository

**Level 0**: Organization root
**Level 1**: Top-level topics (`projects.topic`, `original.topic`)
**Level 2**: Sub-topics or projects within topics
**Level 3+**: Deeper nesting

### :building_construction: Template Inheritance

Repositories inherit from templates:

1. Repository created from GitHub template
2. Template metadata stored in `.chimera-lab/meta.json`
3. `cmr templates update` applies template updates

## :jigsaw: Components

### :jigsaw: `.topic` - Knowledge Topics

Organizational unit for related knowledge/repositories.

- Can contain sub-topics
- Groups related concepts
- **Example**: `devops.topic`, `security.topic`

### :jigsaw: `.project` - Dedicated Projects

Complete project with dedicated repository.

- Full application or service
- Independent lifecycle
- **Example**: `chimera-lab-blog.project`, `chimera-lab-chat.project`

### :jigsaw: `.app` - Applications

Standalone application or tool.

- End-user facing
- Executable/deployable
- **Example**: `chimera-lab-cli.app`, `organizer.app`

### :jigsaw: `.package` - Packages/Libraries

Reusable code packages.

- Importable libraries
- Shared across projects
- **Example**: `chimera-lab-laravel.package`

### :jigsaw: `.scaffold` - Scaffolds

Boilerplate code generators.

- Project starters
- Code generation templates
- **Example**: `wordpress-plugin-abstraction.scaffold`

### :jigsaw: `.template` - Templates

GitHub repository templates.

- Reusable repository structures
- Applied via GitHub template mechanism
- Stored as submodule in `.github/.template` of child repos
- **Example**: `laravel_app.template`, `repository.template`

## :page_facing_up: Files

| File | Scope | Key Fields |
|---|---|---|
| `settings.json` | Organization | `planned`, `ignored`, `default_labels`, `default_milestones` |
| `meta.json` | Organization | `organization`, `description`, `projects`, `templates`, `docs` |
| `meta.json` | Repository | `name`, `template`, `parent`, `level`, `is_template` |

## :keyboard: Usage

### :keyboard: List Organizations

```bash
cmr org list
```

### :keyboard: Navigate to Organization

```bash
cmr cwd org
```

### :keyboard: List Topics

```bash
cmr org topic
```

### :keyboard: List Projects

```bash
cmr org projects
```

### :keyboard: Rules

- Organization-wide rules in `.chimera-lab/rules.json`
- Enforced via `cmr rules check`
- Auto-fix with `cmr rules fix`

## :world_map: Guides

### :world_map: Submodule Management

- Each repository is a Git submodule
- Super-repository tracks submodule commits
- Use `cmr submodules update` for recursive updates

### :world_map: Graph Analysis

Analyze organization structure:

```bash
cmr graph all --output graphml  # Complete organization graph
cmr graph network               # Project relationships
cmr graph templates             # Template usage
```

### :world_map: Best Practices

1. **Consistent Naming**: Use suffix conventions (`.topic`, `.project`, etc.)
2. **Shallow Nesting**: Limit to 3-4 levels for maintainability
3. **Metadata**: Keep `.chimera-lab/meta.json` updated
4. **Documentation**: Maintain README.md in each repository
5. **Templates**: Use templates for consistency across similar projects
6. **Submodules**: Regular `cmr submodules update` to stay in sync

## :mag: Terminology

- Organization-level terminology
- Linked across repositories
- Managed via `cmr terms` commands
