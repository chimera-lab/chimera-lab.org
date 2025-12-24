# Organization Knowledge

Structure, conventions, and management of chimera-lab organizations.

## Organization Concept

A **Chimera Lab Organization** is a super-repository containing:
- Multiple projects as Git submodules
- Shared templates and configurations
- Centralized documentation and rules
- Topic-based knowledge organization

## Directory Structure

```
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

## Repository Types

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
```
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

Full list in [ORGANIZATION_RULES.md](/.github/docs/ORGANIZATION_RULES.md#list-of-templates)

## Metadata Files

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

## Hierarchical Levels

Organization → Topic → Sub-Topic → Repository

**Level 0**: Organization root
**Level 1**: Top-level topics (`projects.topic`, `original.topic`)
**Level 2**: Sub-topics or projects within topics
**Level 3+**: Deeper nesting

## Commands for Organizations

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

## Submodule Management

- Each repository is a Git submodule
- Super-repository tracks submodule commits
- Use `cmr submodules update` for recursive updates

## Template Inheritance

Repositories inherit from templates:
1. Repository created from GitHub template
2. Template metadata stored in `.chimera-lab/meta.json`
3. `cmr templates update` applies template updates

## Graph Generation

Analyze organization structure:
```bash
cmr graph all --output graphml  # Complete organization graph
cmr graph network               # Project relationships
cmr graph templates             # Template usage
```

## Rules and Validation

- Organization-wide rules in `.chimera-lab/rules.json`
- Enforced via `cmr rules check`
- Auto-fix with `cmr rules fix`

## Terms and Glossary

- Organization-level terminology
- Linked across repositories
- Managed via `cmr terms` commands

## Best Practices

1. **Consistent Naming**: Use suffix conventions (`.topic`, `.project`, etc.)
2. **Shallow Nesting**: Limit to 3-4 levels for maintainability
3. **Metadata**: Keep `.chimera-lab/meta.json` updated
4. **Documentation**: Maintain README.md in each repository
5. **Templates**: Use templates for consistency across similar projects
6. **Submodules**: Regular `cmr submodules update` to stay in sync
