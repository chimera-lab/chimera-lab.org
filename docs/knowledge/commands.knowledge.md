# Commands Knowledge

## :book: Table of Contents

- [Commands Knowledge](./#commands-knowledge)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:jigsaw: Components](./#jigsaw-components)
    - [:jigsaw: `cwd` - Current Working Directory](./#jigsaw-cwd-current-working-directory)
    - [:jigsaw: `repo` - Repository Management](./#jigsaw-repo-repository-management)
      - [:jigsaw: `cmr repo issues`](./#jigsaw-cmr-repo-issues)
      - [:jigsaw: `cmr repo milestones`](./#jigsaw-cmr-repo-milestones)
      - [:jigsaw: `cmr repo labels [TYPES...]`](./#jigsaw-cmr-repo-labels-types)
    - [:jigsaw: `submodules` - Git Submodule Management](./#jigsaw-submodules-git-submodule-management)
      - [:jigsaw: `cmr submodules update`](./#jigsaw-cmr-submodules-update)
    - [:jigsaw: `cd` - Directory Navigation](./#jigsaw-cd-directory-navigation)
      - [:jigsaw: `cmr cd [REPOSITORY]`](./#jigsaw-cmr-cd-repository)
    - [:jigsaw: `docs` - Documentation Management](./#jigsaw-docs-documentation-management)
      - [:jigsaw: `cmr docs check [PATH]`](./#jigsaw-cmr-docs-check-path)
      - [:jigsaw: `cmr docs fix`](./#jigsaw-cmr-docs-fix)
    - [:jigsaw: `templates` - Template Management](./#jigsaw-templates-template-management)
      - [:jigsaw: `cmr templates update`](./#jigsaw-cmr-templates-update)
    - [:jigsaw: `rules` - Rule Enforcement](./#jigsaw-rules-rule-enforcement)
      - [:jigsaw: `cmr rules check`](./#jigsaw-cmr-rules-check)
      - [:jigsaw: `cmr rules fix`](./#jigsaw-cmr-rules-fix)
    - [:jigsaw: `graph` - Visualization and Analytics](./#jigsaw-graph-visualization-and-analytics)
    - [:jigsaw: `tree` - Tree View](./#jigsaw-tree-tree-view)
      - [:jigsaw: `cmr tree`](./#jigsaw-cmr-tree)
    - [:jigsaw: `terms` - Terminology Management](./#jigsaw-terms-terminology-management)
    - [:jigsaw: `workspace` - Workspace Management](./#jigsaw-workspace-workspace-management)
    - [:jigsaw: `project` - Project Management](./#jigsaw-project-project-management)
    - [:jigsaw: `org` - Organization Management](./#jigsaw-org-organization-management)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: JSON Configuration Files](./#world_map-json-configuration-files)
    - [:world_map: Path Resolution](./#world_map-path-resolution)
    - [:world_map: GitHub Integration](./#world_map-github-integration)
    - [:world_map: Output Styling](./#world_map-output-styling)

## :building_construction: Structure

```text
cmr [GROUP] [COMMAND] [OPTIONS] [ARGUMENTS]
```

All command groups support `--help` for detailed information.

## :jigsaw: Components

### :jigsaw: `cwd` - Current Working Directory

| Command | Description |
|---------|-------------|
| `cmr cwd org [PATH]` | Shows org root; walks up for `.chimera-lab/` (falls back to `CHIMERA_LAB_CLI_ORG_PATH`) |
| `cmr cwd repo [PATH]` | Shows repo root; identifies repository within organization |

### :jigsaw: `repo` - Repository Management

Manage repository issues, milestones, and labels.

#### :jigsaw: `cmr repo issues`
Creates/syncs issues from `./.chimera-lab/issues.json`
- Requires: `IssueCollection` JSON format
- Fields: `title`, `id`, `milestone`, `estimate_hours`, `is_created`

#### :jigsaw: `cmr repo milestones`
Creates/syncs milestones from JSON template.
- Sources: `${REPO_PATH}/.chimera-lab/milestones.json` or org-level

#### :jigsaw: `cmr repo labels [TYPES...]`
Creates/syncs labels from JSON template.
- Accepts multiple label types as arguments

### :jigsaw: `submodules` - Git Submodule Management

#### :jigsaw: `cmr submodules update`
Updates all submodules recursively.
- Includes reverse updates for nested super-repositories

### :jigsaw: `cd` - Directory Navigation

#### :jigsaw: `cmr cd [REPOSITORY]`
Changes to specified repository directory.
- Searches organization recursively
- Repository need not be in current directory

### :jigsaw: `docs` - Documentation Management

Validate and maintain documentation quality across repositories.

#### :jigsaw: `cmr docs check [PATH]`
Validates documentation quality and template compliance.

**Options**:
- `--strict` - Fail on warnings (exit code 1)
- `--check-external` - Validate external links (HTTP/HTTPS)

**Validates**: README existence & template version, template compliance, header emoji format, link prefix rules (`:globe_with_meridians:`, `:open_file_folder:`, `:file_folder:`, `:mag:`), docstring coverage, metadata structure, and topic template submodules.

**Output**: Rich table with severity, type, file, line, message. Exit code 1 on errors (or warnings with `--strict`).

#### :jigsaw: `cmr docs fix`
Automatically fixes documentation issues.

### :jigsaw: `templates` - Template Management

#### :jigsaw: `cmr templates update`
Updates repository to latest template version.
- Applies template inheritance and migrations

### :jigsaw: `rules` - Rule Enforcement

#### :jigsaw: `cmr rules check`
Validates repository against organization rules.

#### :jigsaw: `cmr rules fix`
Applies automatic fixes for rule compliance.

### :jigsaw: `graph` - Visualization and Analytics

Generate GraphML and visualizations.

| Subcommand | Description |
|---|---|
| `cmr graph level` | Hierarchical level of repository/project |
| `cmr graph all` | Complete graph: projects, repositories, templates |
| `cmr graph network` | Network graph of project/template connections |
| `cmr graph templates` | Template-repository relationships |
| `cmr graph commits` | Commit history visualization |
| `cmr graph tree` | Hierarchical tree of projects |
| `cmr graph terms` | Term relationships between projects |

**Output Formats**: `--output json|table|text|graphml`

### :jigsaw: `tree` - Tree View

#### :jigsaw: `cmr tree`
Displays repository/organization tree structure.

### :jigsaw: `terms` - Terminology Management

| Command | Description |
|---------|-------------|
| `cmr terms search [TERM]` | Searches for specific term |
| `cmr terms list` | Lists all defined terms |
| `cmr terms link [TERM]` | Returns term documentation link |

### :jigsaw: `workspace` - Workspace Management

| Command | Description |
|---------|-------------|
| `cmr workspace create [NAME]` | Creates new workspace; sets up paths, environment, VSCode |
| `cmr workspace delete [NAME]` | Removes existing workspace |
| `cmr workspace checkout [NAME]` | Activates workspace; adjusts paths, environment, app tabs |

### :jigsaw: `project` - Project Management

| Command | Description |
|---------|-------------|
| `cmr project issues` | Creates/syncs project-specific issues |
| `cmr project docs` | Validates/fixes project documentation |
| `cmr project plan` | Generates project planning based on milestones, templates, rules |

### :jigsaw: `org` - Organization Management

| Command | Description |
|---------|-------------|
| `cmr org list` | Lists all organizations under `CHIMERA_LAB_CLI_ORG_PATH` |
| `cmr org topic` | Manages organization topics |
| `cmr org terms` | Manages organization terms |
| `cmr org guides` | Manages organization guides |
| `cmr org projects` | Manages organization projects |

## :world_map: Guides

### :world_map: JSON Configuration Files
All JSON configs use Pydantic validation:
```json
{
  "items": [
    { "title": "...", "id": 1, "milestone": "v1.0.0" }
  ]
}
```

### :world_map: Path Resolution
1. Check current directory upward for `.chimera-lab/`
2. Fall back to `CHIMERA_LAB_CLI_ORG_PATH`
3. Use Walker class for recursive searches

### :world_map: GitHub Integration
- Requires `gh` CLI installed and authenticated
- API token via `CHIMERA_LAB_CLI_GITHUB_API`

### :world_map: Output Styling
- Uses Rich library for formatting
- Colors: `[red]`, `[green]`, `[yellow]`
- Tables, trees, progress bars supported
