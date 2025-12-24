# Repository Knowledge

Management of individual repositories, issues, milestones, and labels within chimera-lab organizations.

## Repository Structure

Each repository within a chimera-lab organization should have:

```
repository-name.suffix/
├── .chimera-lab/              # Repository metadata
│   ├── meta.json              # Repository info (template, parent, level)
│   ├── issues.json            # Issue definitions (optional)
│   ├── milestones.json        # Milestone definitions (optional)
│   └── labels.json            # Label definitions (optional)
├── .github/                   # GitHub configuration
│   └── .template/             # Template as Git submodule (REQUIRED)
├── .git/                      # Git repository
├── README.md                  # Documentation with <!--(version=a.b.c)-->
└── [project files...]         # Actual project content
```

## Repository Metadata (`meta.json`)

```json
{
  "name": "chimera-lab-cli.app",
  "template": "app.template",
  "parent": "original.topic",
  "level": 2,
  "is_template": false,
  "is_planned": false
}
```

### Fields

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Repository name with suffix |
| `template` | string | Template this repo is based on |
| `parent` | string | Parent topic/directory |
| `level` | int | Hierarchical depth in organization |
| `is_template` | bool | Is this repository a template? |
| `is_planned` | bool | Planned but not yet created |

## Issues Management

### Issue Definition (`issues.json`)

```json
{
  "items": [
    {
      "title": "Implement new command for graph visualization",
      "id": null,
      "milestone": "v1.0.0",
      "estimate_hours": 8,
      "is_created": false
    }
  ]
}
```

### Issue Model Fields

| Field | Type | Description |
|-------|------|-------------|
| `title` | string | Issue title |
| `id` | int \| null | GitHub issue number (null if not created) |
| `milestone` | string \| null | Associated milestone |
| `estimate_hours` | int \| null | Time estimate |
| `is_created` | bool | Has been created on GitHub |

### Commands
```bash
# Create issues from JSON
cmr repo issues

# Requires: ./.chimera-lab/issues.json
```

## Milestones Management

### Milestone Stages System

Chimera-lab uses a standardized 7-stage milestone system:

| Stage | Title | Goal | Exit Criteria |
|-------|-------|------|---------------|
| 1 | Ideating | Generate ideas | Clear problem + viable solution idea? |
| 2 | Planning | Define direction | Basic roadmap with tasks/estimates? |
| 3 | Building | Create MVP | Main features working without crashes? |
| 4 | Presenting | Make it usable | Someone can demo with guidance? |
| 5 | Sharing | Show to world | Published with feedback mechanism? |
| 6 | Polishing | Refine | Clean code, modular, stable infra? |
| 7 | Releasing | Launch as product | Ready for public use + support? |

### Milestone Definition (`milestones.json`)

```json
{
  "items": [
    {
      "title": "1 - Ideating",
      "description": "Generate ideas - Is there a clear problem and a viable solution idea?",
      "due_on": null,
      "state": "open"
    },
    {
      "title": "v1.0.0",
      "description": "Initial release",
      "due_on": "2025-12-31",
      "state": "open"
    }
  ]
}
```

Default stages available in [milestones-default.json](/.github/docs/reference/milestones-default.json)

### Commands
```bash
# Create milestones from JSON
cmr repo milestones

# Sources (in order):
# 1. ${REPO_PATH}/.chimera-lab/milestones.json
# 2. ${ORG_PATH}/.chimera-lab/milestones.json (fallback)
```

## Labels Management

### Label Categories System

Labels organized by categories for different repository types:

**Categories**:
- `common` - Standard GitHub labels (bug, documentation, enhancement, etc.)
- `general` - Application logic (logic, performance, testing, security, logging, etc.)
- `infrastructure` - DevOps labels (containerization, orchestration, cicd, monitoring, etc.)
- `interface` - UI/UX labels (ui, ux, desktop, mobile, cli)
- `embedded` - Hardware labels (hardware, firmware, operating-system)
- `study` - Knowledge labels (terminology, guides, chapters, problems, appendix, etc.)

### Label Definition (`labels.json`)

```json
{
  "items": [
    {
      "name": "bug",
      "color": "d73a4a",
      "description": "Something isn't working"
    },
    {
      "name": "cli",
      "color": "e99695",
      "description": "Command-line interface applications"
    }
  ]
}
```

**Organization Labels**:
Full label reference by category in [labels-org.json](/.github/docs/reference/labels-org.json)

**Usage by Repository Type**:
- `.app` repositories → common + general + interface (cli/desktop/mobile)
- `.project` repositories → common + general + infrastructure
- `.topic` repositories → common + study
- `.scaffold` repositories → common + infrastructure

### Commands
```bash
# Create labels from JSON
cmr repo labels priority status type

# Arguments: label types to create
```

## Repository Discovery

### Walker Pattern
The `Walker` class navigates repository hierarchies:

```python
# Find repository root
repo_path = Walker.get_repo_path()

# Find organization root
org_path = Walker.get_org_path()

# List all repositories with metadata
repos = Walker.get_repos(level=1)
```

### Discovery Algorithm
1. Start from current directory
2. Walk up directory tree
3. Look for `.chimera-lab/` marker
4. Fall back to `CHIMERA_LAB_CLI_ORG_PATH` environment variable

## Repository Models (Pydantic)

### `RepoModel`
```python
class RepoModel:
    name: str              # Repository name
    template: str          # Template identifier
    path: str              # Absolute filesystem path
    level: int             # Hierarchical depth
    parent: str            # Parent repository name
    is_template: bool      # Is this a template?
    is_planned: bool       # Planned but not created
```

### `IssueModel`
```python
class IssueModel:
    title: str
    id: Optional[int]
    milestone: Optional[str]
    estimate_hours: Optional[int]
    is_created: bool
```

### Collections
- `IssueCollection` → List of `IssueModel`
- `LabelCollection` → List of `LabelModel`
- `MilestoneCollection` → List of `MilestoneModel`

## GitHub Integration

### Requirements
- GitHub CLI (`gh`) installed and authenticated
- Repository must be on GitHub
- `CHIMERA_LAB_CLI_GITHUB_API` environment variable (optional)

### Operations
- Create issues via GitHub API
- Create milestones via GitHub API
- Create/sync labels via GitHub API

## Template Application

### Creating from Template
```bash
# Create new repository from template
cmr repo create website.laravel_app

# Uses: laravel_app.template
# Applies: Default labels and milestones
```

### Updating Template
```bash
# Update repository to latest template version
cmr templates update
```

## Repository Validation

### Documentation Check
```bash
cmr docs check  # Validate documentation consistency
cmr docs fix    # Auto-fix documentation issues
```

### Rules Check
```bash
cmr rules check  # Validate against organization rules
cmr rules fix    # Auto-fix rule violations
```

## Submodule Relationships

- Repositories can contain other repositories as submodules
- Tracked in `.gitmodules`
- Use `cmr submodules update` for recursive updates
- Parent-child relationships tracked in metadata

## Best Practices

1. **Always include `.chimera-lab/meta.json`** in repositories
2. **Use JSON files for bulk issue/milestone/label creation**
3. **Keep repository suffixes consistent** (`.app`, `.project`, etc.)
4. **Update templates regularly** via `cmr templates update`
5. **Validate before commit** with `cmr docs check` and `cmr rules check`
6. **Use milestones** for version planning
7. **Tag issues with labels** for better organization
