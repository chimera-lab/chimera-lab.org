# Commands Knowledge

Comprehensive reference for all chimera-lab-cli commands and their usage patterns.

## Command Structure

```
cmr [GROUP] [COMMAND] [OPTIONS] [ARGUMENTS]
```

All command groups support `--help` for detailed information.

## Command Groups

### `cwd` - Current Working Directory

Display organization and repository paths.

#### `cmr cwd org [PATH]`
Shows organization root path.
- Walks up directory tree looking for `.chimera-lab/` marker
- Falls back to `CHIMERA_LAB_CLI_ORG_PATH` environment variable

#### `cmr cwd repo [PATH]`
Shows repository root path.
- Identifies repository within organization structure

### `repo` - Repository Management

Manage repository issues, milestones, and labels.

#### `cmr repo issues`
Creates/syncs issues from `./.chimera-lab/issues.json`
- Requires: `IssueCollection` JSON format
- Fields: `title`, `id`, `milestone`, `estimate_hours`, `is_created`

#### `cmr repo milestones`
Creates/syncs milestones from JSON template.
- Sources: `${REPO_PATH}/.chimera-lab/milestones.json` or org-level

#### `cmr repo labels [TYPES...]`
Creates/syncs labels from JSON template.
- Accepts multiple label types as arguments

### `submodules` - Git Submodule Management

#### `cmr submodules update`
Updates all submodules recursively.
- Includes reverse updates for nested super-repositories

### `cd` - Directory Navigation

#### `cmr cd [REPOSITORY]`
Changes to specified repository directory.
- Searches organization recursively
- Repository need not be in current directory

### `docs` - Documentation Management

Validate and maintain documentation quality across repositories.

#### `cmr docs check [PATH]`
Validates documentation quality and template compliance.

**Options**:
- `--strict` - Fail on warnings (exit code 1)
- `--check-external` - Validate external links (HTTP/HTTPS)

**Validation Rules**:

1. **README Validation**
   - README.md must exist in repository root
   - Must contain template version comment: `<!--(version=X.Y.Z)-->`
   - Minimum content length (50 characters)

2. **Template Compliance**
   - Compare against `.github/.template` files
   - All template files must exist in repository
   - All template headers must be present
   - Warn if content unchanged from template

3. **Header Format**
   - Headers must start with approved emoji prefixes:
     - `:loudspeaker:` Introduction
     - `:inbox_tray:` Installation
     - `:keyboard:` Usage
     - `:wrench:` Configuration
     - `:chains:` Dependencies
     - `:paperclip:` Appendix
     - `:book:` Documentation
     - `:hammer_and_wrench:` Development
     - `:busts_in_silhouette:` Contributing

4. **Link Prefix Rules**
   - External links: `:globe_with_meridians:` prefix
     - Example: `[:globe_with_meridians: Python Docs](https://docs.python.org)`
   - Chimera-lab repos: `:open_file_folder:` prefix
     - Example: `[:open_file_folder: chimera-lab/cli](https://github.com/chimera-lab/chimera-lab-cli)`
   - Other repos: `:file_folder:` prefix
     - Example: `[:file_folder: python/cpython](https://github.com/python/cpython)`
   - Term references: `:mag:` prefix
     - Example: `[:mag: Repository](https://github.com/chimera-lab/template.topic#repository)`
   - Internal anchors: Use header emoji
     - Example: `[:paperclip: Appendix](#paperclip-appendix)`

5. **Docstring Validation**
   - All public functions/classes must have docstrings
   - Private functions (starting with `_`) are skipped
   - Excludes: `.venv/`, `__pycache__/`, `src/`, `.git/`, `egg-info/`

6. **Metadata Validation**
   - `.chimera-lab/meta.json` should exist
   - Required fields: `repo`, `org`
   - Valid JSON structure

7. **Topic Template Submodules** (for `topic.template` repos)
   - Must have `## submodules` section
   - Each submodule must have corresponding header
   - Section should include intro from submodule README

**Output**:
- Rich formatted table with severity, type, file, line, message
- Relative paths from execution directory
- Summary: total errors and warnings
- Exit code 1 if errors found, or warnings with `--strict`

**Examples**:
```bash
# Check current directory
cmr docs check

# Check specific repository
cmr docs check /path/to/repo

# Strict mode (fail on warnings)
cmr docs check --strict

# Include external link validation
cmr docs check --check-external
```

#### `cmr docs fix`
Automatically fixes documentation issues.

### `templates` - Template Management

#### `cmr templates update`
Updates repository to latest template version.
- Applies template inheritance and migrations

### `rules` - Rule Enforcement

#### `cmr rules check`
Validates repository against organization rules.

#### `cmr rules fix`
Applies automatic fixes for rule compliance.

### `graph` - Visualization and Analytics

Generate GraphML and visualizations.

#### `cmr graph level`
Shows hierarchical level of repository/project.

#### `cmr graph all`
Complete graph of projects, repositories, templates.

#### `cmr graph network`
Network graph of project/template connections.

#### `cmr graph templates`
Template-repository relationships.

#### `cmr graph commits`
Commit history visualization.

#### `cmr graph tree`
Hierarchical tree of projects.

#### `cmr graph terms`
Term relationships between projects.

**Output Formats**:
- `--output json` → JSON data
- `--output table` → Rich table
- `--output text` → Plain text
- `--output graphml` → GraphML XML

### `tree` - Tree View

#### `cmr tree`
Displays repository/organization tree structure.

### `terms` - Terminology Management

#### `cmr terms search [TERM]`
Searches for specific term.

#### `cmr terms list`
Lists all defined terms.

#### `cmr terms link [TERM]`
Returns term documentation link.

### `workspace` - Workspace Management

#### `cmr workspace create [NAME]`
Creates new workspace configuration.
- Paths, environment variables, VSCode setup

#### `cmr workspace delete [NAME]`
Removes existing workspace.

#### `cmr workspace checkout [NAME]`
Activates workspace.
- Adjusts paths, environment, application/browser tabs

### `project` - Project Management

#### `cmr project issues`
Creates/syncs project-specific issues.

#### `cmr project docs`
Validates/fixes project documentation.

#### `cmr project plan`
Generates project planning.
- Based on milestones, templates, rules

### `org` - Organization Management

#### `cmr org list`
Lists all organizations under `CHIMERA_LAB_CLI_ORG_PATH`.

#### `cmr org topic`
Manages organization topics.

#### `cmr org terms`
Manages organization terms.

#### `cmr org guides`
Manages organization guides.

#### `cmr org projects`
Manages organization projects.

## Common Patterns

### JSON Configuration Files
All JSON configs use Pydantic validation:
```json
{
  "items": [
    { "title": "...", "id": 1, "milestone": "v1.0.0" }
  ]
}
```

### Path Resolution
1. Check current directory upward for `.chimera-lab/`
2. Fall back to `CHIMERA_LAB_CLI_ORG_PATH`
3. Use Walker class for recursive searches

### GitHub Integration
- Requires `gh` CLI installed and authenticated
- API token via `CHIMERA_LAB_CLI_GITHUB_API`

### Output Styling
- Uses Rich library for formatting
- Colors: `[red]`, `[green]`, `[yellow]`
- Tables, trees, progress bars supported
