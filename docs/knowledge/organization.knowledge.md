# Organization Knowledge

## :book: Table of Contents

- [Organization Knowledge](./#organization-knowledge)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:jigsaw: Components](./#jigsaw-components)
    - [`.topic` - Knowledge Topics](./#topic-knowledge-topics)
    - [`.project` - Dedicated Projects](./#project-dedicated-projects)
    - [`.app` - Applications](./#app-applications)
    - [`.package` - Packages/Libraries](./#package-packageslibraries)
    - [`.scaffold` - Scaffolds](./#scaffold-scaffolds)
    - [`.template` - Templates](./#template-templates)
  - [:page_facing_up: Files](./#page_facing_up-files)
    - [`settings.json` (Organization Level)](./#settingsjson-organization-level)
    - [`meta.json` (Organization)](./#metajson-organization)
    - [`meta.json` (Repository)](./#metajson-repository)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:keyboard: Usage](./#keyboard-usage)
    - [List Organizations](./#list-organizations)
    - [Navigate to Organization](./#navigate-to-organization)
    - [List Topics](./#list-topics)
    - [List Projects](./#list-projects)
  - [:world_map: Guides](./#world_map-guides)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:world_map: Guides](./#world_map-guides)
  - [:keyboard: Usage](./#keyboard-usage)
  - [:mag: Terminology](./#mag-terminology)
  - [:world_map: Guides](./#world_map-guides)

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

## :jigsaw: Components

### `.topic` - Knowledge Topics
Organizational unit for related knowledge/repositories.
- Can contain sub-topics
- Groups related concepts
- **Example**: `devops.topic`, `security.topic`

### `.project` - Dedicated Projects
Complete project with dedicated repository.
- Full application or service
- Independent lifecycle
- **Example**: `chimera-lab-blog.project`, `chimera-lab-chat.project`

### `.app` - Applications
Standalone application or tool.
- End-user facing
- Executable/deployable
- **Example**: `chimera-lab-cli.app`, `organizer.app`

### `.package` - Packages/Libraries
Reusable code packages.
- Importable libraries
- Shared across projects
- **Example**: `chimera-lab-laravel.package`

### `.scaffold` - Scaffolds
Boilerplate code generators.
- Project starters
- Code generation templates
- **Example**: `wordpress-plugin-abstraction.scaffold`

### `.template` - Templates
GitHub repository templates.
- Reusable repository structures
- Applied via GitHub template mechanism
- Stored as submodule in `.github/.template` of child repos
- **Example**: `laravel_app.template`, `repository.template`

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

## :page_facing_up: Files

### `settings.json` (Organization Level)
```json
{
  "planned": [...],
  "ignored": [...],
  "default_labels": [...],
  "default_milestones": [...]
}
```

### `meta.json` (Organization)
```json
{
  "organization": "chimera-lab",
  "description": "...",
  "projects": [...],
  "templates": [...],
  "docs": {...}
}
```

### `meta.json` (Repository)
```json
{
  "name": "repository-name",
  "template": "template.name",
  "parent": "parent-topic",
  "level": 2,
  "is_template": false
}
```

## :building_construction: Structure

Organization → Topic → Sub-Topic → Repository

**Level 0**: Organization root
**Level 1**: Top-level topics (`projects.topic`, `original.topic`)
**Level 2**: Sub-topics or projects within topics
**Level 3+**: Deeper nesting

## :keyboard: Usage

### List Organizations
```bash
cmr org list
```

### Navigate to Organization
```bash
cmr cwd org
```

### List Topics
```bash
cmr org topic
```

### List Projects
```bash
cmr org projects
```

## :world_map: Guides

- Each repository is a Git submodule
- Super-repository tracks submodule commits
- Use `cmr submodules update` for recursive updates

## :building_construction: Structure

Repositories inherit from templates:
1. Repository created from GitHub template
2. Template metadata stored in `.chimera-lab/meta.json`
3. `cmr templates update` applies template updates

## :world_map: Guides

Analyze organization structure:
```bash
cmr graph all --output graphml  # Complete organization graph
cmr graph network               # Project relationships
cmr graph templates             # Template usage
```

## :keyboard: Usage

- Organization-wide rules in `.chimera-lab/rules.json`
- Enforced via `cmr rules check`
- Auto-fix with `cmr rules fix`

## :mag: Terminology

- Organization-level terminology
- Linked across repositories
- Managed via `cmr terms` commands

## :world_map: Guides

1. **Consistent Naming**: Use suffix conventions (`.topic`, `.project`, etc.)
2. **Shallow Nesting**: Limit to 3-4 levels for maintainability
3. **Metadata**: Keep `.chimera-lab/meta.json` updated
4. **Documentation**: Maintain README.md in each repository
5. **Templates**: Use templates for consistency across similar projects
6. **Submodules**: Regular `cmr submodules update` to stay in sync
