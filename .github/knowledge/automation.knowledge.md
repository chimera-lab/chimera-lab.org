# Automation Knowledge

Rules, templates, documentation automation, and workflow features of chimera-lab-cli.

## Rules System

### Purpose
Enforce consistency and standards across repositories in an organization.

### Rule Files

**Organization Level**: `${ORG_PATH}/.chimera-lab/rules.json`
```json
{
  "rules": [
    {
      "id": "readme-required",
      "description": "All repositories must have README.md",
      "severity": "error",
      "auto_fix": false
    },
    {
      "id": "meta-json-required",
      "description": "All repositories must have .chimera-lab/meta.json",
      "severity": "error",
      "auto_fix": true
    }
  ]
}
```

### Commands

```bash
# Check compliance with rules
cmr rules check

# Automatically fix rule violations (where auto_fix: true)
cmr rules fix
```

### Rule Types
- **File existence** (README.md, LICENSE, etc.)
- **Metadata completeness** (.chimera-lab/meta.json fields)
- **Naming conventions** (repository suffixes)
- **Documentation standards** (header format, required sections)
- **Git configuration** (.gitignore, .gitmodules)

## Template System

### Purpose
Maintain consistency across similar repositories through reusable templates.

### Template Structure

Templates are GitHub repository templates with suffix `.template`:
```
laravel_app.template/
├── .chimera-lab/
│   ├── meta.json          # Template metadata
│   └── template.json      # Template configuration
├── README.md              # Template README with version comment
├── [template files...]    # Files to be copied
└── .github/
    └── workflows/         # GitHub Actions
```

**Template as Submodule**:
- All repositories must include their template as a Git submodule at `.github/.template`
- This allows tracking template updates and applying changes
- Example: `git submodule add https://github.com/chimera-lab/app.template .github/.template`

### Template Metadata
```json
{
  "name": "laravel_app.template",
  "version": "1.2.0",
  "description": "Laravel application template",
  "is_template": true,
  "includes": [
    "README.md",
    ".gitignore",
    "composer.json",
    ".github/workflows/"
  ]
}
```

### Template Versioning

Templates use HTML comment versioning in README:
```html
<!--(version=a.b.c)-->
```

**Version Semantics**:
- `a` (major) - Changes require manual revision
- `b` (minor) - Changes can be automatically resolved
- `c` (patch) - Changes can be safely ignored

**Version Update Rules**:
- Any structural change to README → update version
- Template hierarchy changes → major version bump

### Template Application

**Create from Template**:
```bash
# Create new repository from template
cmr repo create my-website.laravel_app

# 1. Uses GitHub template mechanism
# 2. Applies default labels/milestones
# 3. Creates .chimera-lab/meta.json with template reference
```

**Update from Template**:
```bash
# Update existing repository to latest template
cmr templates update

# 1. Detects current template from meta.json
# 2. Fetches latest template version
# 3. Applies updates (respects local changes)
```

### Template Hierarchy

**Base Template**:
- `repository.template` - Root template for all repositories

**Specialized Templates** (inherit from repository.template):
- `topic.template` - Knowledge/study topics
- `overview.template` - Overview documentation
- `diy.template` - DIY projects
- `app.template` - Application projects
  - `laravel_app.template` - Laravel-specific apps (inherits from app.template)
- `project.template` - Dedicated project repositories
- `scaffold.template` - Code scaffolding tools
  - `docker_scaffold.template` - Docker scaffolds (inherits from scaffold.template)
- `org.template` - Organization super-repositories

**Template Inheritance**:
- Repositories track their template in `meta.json` → `template` field
- Template stored as submodule in `.github/.template`
- Templates can inherit from parent templates
- Update mechanism preserves local customizations
- Use `cmr templates update` to sync with latest template version

## Documentation Automation

### Purpose
Generate and maintain consistent documentation across repositories.

### Auto-Generated Content

**README Sections**:
- Table of Contents (generated from headers)
- Installation instructions (from template)
- Configuration (from `.chimera-lab/` files)
- API documentation (from code comments)

### Commands

```bash
# Validate documentation
cmr docs check

# Auto-fix documentation issues
cmr docs fix

# Common fixes:
# - Regenerate TOC
# - Fix header formatting
# - Update links
# - Add missing sections
```

### Documentation Rules

**Required Files**:
- All repositories must have `README.md`
- Template version comment at top: `<!--(version=a.b.c)-->`

**Required Sections**:
- :loudspeaker: Introduction
- :inbox_tray: Installation  
- :keyboard: Usage

**Header Emoji Requirements**:
All headers must include emoji prefix from approved list:
- :loudspeaker: Introduction
- :inbox_tray: Installation
- :keyboard: Usage
- :wrench: Configuration
- :chains: Dependencies
- :paperclip: Appendix
- :book: Chapter
- :hammer_and_wrench: Common problems
- :busts_in_silhouette: Contributing
- :medal_military: Credits
- :control_knobs: Customization
- :page_facing_up: Files
- :package: Material
- :notebook: Notes
- :telescope: Overview
- :books: References
- :clipboard: Requirements
- :link: See also
- :gear: Software
- :building_construction: Structure
- :newspaper: Sources
- :file_cabinet: Submodule
- :triangular_ruler: Technologies
- :mag: Terminology
- :memo: To-do list
- :toolbox: Tools
- :scroll: License
- :warning: Warnings

Full list in [ORGANIZATION_RULES.md](/.github/docs/ORGANIZATION_RULES.md)

**Link Prefix Requirements**:
- :globe_with_meridians: External links (e.g., Wikipedia)
- :open_file_folder: Chimera-lab repositories
- :file_folder: Other GitHub repositories
- :mag: Organization terms/glossary

**Child Markdown Documents**:
- Prefix with `README.` (e.g., `README.chapter1.md`, `README.appendix.md`)
- Used for splitting large documentation

**Other Rules**:
- Consistent header hierarchy (H1 → H2 → H3)
- Valid internal links
- Updated table of contents

### Project Documentation
```bash
# Project-specific documentation
cmr project docs

# Validates/fixes documentation in project context
```

## Graph Generation

### Purpose
Visualize repository relationships, hierarchies, and dependencies.

### Graph Types

**All Repositories**:
```bash
cmr graph all --output graphml
# Complete organization graph with all repos
```

**Network Graph**:
```bash
cmr graph network
# Shows connections between projects and templates
```

**Template Graph**:
```bash
cmr graph templates
# Template usage and relationships
```

**Commit Graph**:
```bash
cmr graph commits
# Commit history visualization
```

**Tree Graph**:
```bash
cmr graph tree
# Hierarchical tree structure
```

**Terms Graph**:
```bash
cmr graph terms
# Term relationships across projects
```

### Output Formats
- `--output json` → JSON data for programmatic use
- `--output graphml` → GraphML XML for visualization tools (yEd, Gephi)
- `--output table` → Rich terminal table
- `--output text` → Plain text

### GraphML Structure
```xml
<graphml>
  <key id="template" attr.name="template" for="node"/>
  <key id="level" attr.name="level" for="node"/>
  <key id="node_label" attr.name="node_label" for="node"/>
  <graph>
    <node id="repo-name">
      <data key="template">app.template</data>
      <data key="level">2</data>
    </node>
    <edge source="parent-topic" target="repo-name"/>
  </graph>
</graphml>
```

## Workspace Management

### Purpose
Manage development environments with preconfigured paths, tabs, and settings.

### Workspace Structure
```json
{
  "name": "chimera-blog-dev",
  "paths": [
    "/path/to/chimera-lab-blog.project",
    "/path/to/chimera-lab-laravel.package"
  ],
  "env": {
    "CHIMERA_LAB_CLI_ORG_PATH": "/path/to/org"
  },
  "vscode": {
    "folders": [...],
    "settings": {...}
  },
  "browser_tabs": [
    "http://localhost:8000",
    "https://github.com/chimera-lab/chimera-lab-blog"
  ]
}
```

### Commands

```bash
# Create workspace
cmr workspace create chimera-blog-dev

# Delete workspace
cmr workspace delete chimera-blog-dev

# Activate workspace (opens VSCode, browser tabs, sets env)
cmr workspace checkout chimera-blog-dev
```

## Project Planning

### Purpose
Generate project plans from milestones, templates, and rules.

### Commands

```bash
# Generate project plan
cmr project plan

# Analyzes:
# - Milestones in .chimera-lab/milestones.json
# - Issues in .chimera-lab/issues.json
# - Template requirements
# - Organization rules

# Outputs:
# - Task breakdown
# - Timeline estimate
# - Dependency graph
```

## Submodule Automation

### Purpose
Keep submodules synchronized across organization.

### Commands

```bash
# Update all submodules recursively
cmr submodules update

# 1. Updates each submodule to latest commit
# 2. Handles nested super-repositories
# 3. Resolves conflicts automatically where possible
```

### Reverse Updates
For nested super-repositories, updates propagate both directions:
- Child → Parent (submodule commit reference)
- Parent → Child (pull latest changes)

## Best Practices

1. **Rules**: Define organization-wide rules early
2. **Templates**: Use templates for all similar projects
3. **Documentation**: Run `cmr docs check` before commits
4. **Updates**: Regularly `cmr templates update` to stay current
5. **Graphs**: Generate graphs periodically for visualization
6. **Workspaces**: Create workspaces for complex multi-repo projects
7. **Planning**: Use `cmr project plan` at milestone start
8. **Submodules**: Run `cmr submodules update` after pulls
