# System Knowledge

## :book: Table of Contents

- [System Knowledge](./#system-knowledge)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:telescope: Overview](./#telescope-overview)
    - [:telescope: Super-Repository Pattern](./#telescope-super-repository-pattern)
    - [:telescope: Topic-Based Organization](./#telescope-topic-based-organization)
    - [:telescope: Repository Types](./#telescope-repository-types)
    - [:telescope: Template System](./#telescope-template-system)
    - [:telescope: Metadata System](./#telescope-metadata-system)
  - [:wrench: Configuration](./#wrench-configuration)
    - [:wrench: Organization Level (`.chimera-lab/`)](./#wrench-organization-level-chimera-lab)
    - [:wrench: Repository Level (`.chimera-lab/meta.json`)](./#wrench-repository-level-chimera-labmetajson)
  - [:jigsaw: Components](./#jigsaw-components)
  - [:toolbox: Tools](./#toolbox-tools)
    - [:toolbox: chimera-lab-cli](./#toolbox-chimera-lab-cli)
    - [:toolbox: Utility Scripts (`.chimera-lab/utils/`)](./#toolbox-utility-scripts-chimera-labutils)
  - [:world_map: Guides](./#world_map-guides)
  - [:books: References](./#books-references)

## :building_construction: Structure

```text
chimera-lab.org/                    # Organization root (super-repository)
├── .chimera-lab/                   # Organization metadata
│   ├── config/                     # Configuration files
│   │   ├── labels.json             # Default labels by category
│   │   ├── milestones.json         # Default milestone stages
│   │   └── repo.json               # Planned/ignored repositories
│   ├── domains/                    # Domain structure
│   │   └── domains.json            # Topic-to-repo mapping
│   ├── repositories/               # Repository metadata cache
│   │   ├── repos.graphml           # Repository graph
│   │   └── templates.graphml       # Template relationships
│   └── utils/                      # Utility scripts
├── .git/                           # Git super-repository
├── .gitmodules                     # Submodule definitions
├── .github/                        # Organization-level docs and agents
│   ├── README.md                   # Organization overview
│   ├── RULES.md                    # Organization rules and conventions
│   ├── agents/                     # AI agent definitions
│   ├── prompts/                    # Prompt templates
│   ├── knowledge/                  # Knowledge base (this file)
│   ├── docs/                       # Technical documentation
│   ├── labels.json                 # Label definitions
│   ├── domains.puml                # PlantUML diagrams
│   └── network.puml                # Network diagrams
├── administration.topic/           # Admin knowledge area
│   ├── administration-tools.topic/
│   ├── linux-administration.topic/
│   └── windows-administration.topic/
├── projects.topic/                 # Projects collection
│   ├── chimera-lab-blog.project/
│   ├── chimera-lab-store.project/
│   └── chimera-lab-chat.project/
├── original.topic/                 # Original/source code
│   ├── chimera-lab-cli.app/        # CLI tool for managing org
│   ├── chimera-lab-laravel.package/
│   └── organizer.project/
├── template.topic/                 # Repository templates
│   ├── app.template/
│   ├── project.template/
│   └── repository.template/
└── reports/                        # Generated reports
```

## :telescope: Overview

### :telescope: Super-Repository Pattern
chimera-lab.org uses Git super-repository with submodules:
- Organization root tracks all sub-repositories
- Each topic/project is a Git submodule
- Centralized metadata and configuration
- Independent development in each submodule

### :telescope: Topic-Based Organization
Knowledge and projects organized by topics:
- Topics can contain sub-topics recursively
- Topics group related repositories
- Clear hierarchy (Level 0: org → Level 1: topic → Level 2+: nested)

### :telescope: Repository Types
Different suffixes for different purposes:
- `.topic` - Knowledge topics
- `.project` - Dedicated projects
- `.app` - Applications
- `.package` - Libraries
- `.scaffold` - Boilerplates
- `.template` - GitHub templates
- `.overview` - Study material
- `.diy` - DIY/hardware projects

### :telescope: Template System
Reusable repository structures:
- Templates stored in `template.topic/`
- Applied via GitHub template mechanism
- Stored as submodule in `.github/.template/` of child repos
- Hierarchy: `repository.template` (base) → specialized templates

### :telescope: Metadata System
Centralized configuration and metadata:
- Organization level: `.chimera-lab/` (labels, milestones, settings)
- Repository level: `.chimera-lab/meta.json` (repo metadata)
- Submodule tracking: `.gitmodules` (submodule references)

## :wrench: Configuration

### :wrench: Organization Level (`.chimera-lab/`)

**`config/labels.json`** - Default labels by category
- Categories: common, general, infrastructure, interface, embedded, study
- Applied to all repositories unless overridden

**`config/milestones.json`** - Default milestone stages
- 7-stage system: Ideating → Planning → Building → Presenting → Sharing → Polishing → Releasing
- Used when repository doesn't have custom milestones

**`config/repo.json`** - Repository planning
```json
{
  "planned": ["future-project.project"],
  "ignored": ["deprecated.topic"]
}
```

**`domains/domains.json`** - Maps topics to subtopics and repositories; used for navigation and organization.

### :wrench: Repository Level (`.chimera-lab/meta.json`)

```json
{
  "name": "repository-name",
  "template": "template.name",
  "parent": "parent-topic",
  "level": 2,
  "is_template": false
}
```

## :jigsaw: Components

Organization uses AI agents for coordination:
- **organization-manager** - Oversees structure, templates, consistency
- **project-manager** - Coordinates projects and documentation
- **repository-manager** - Git/GitHub operations automation
- **technical-writer** - Documentation creation and maintenance
- **python-architect** - Python project architecture
- **cli-developer** - Feature implementation for tools
- **prompt-engineer** - Agent and prompt management

Agents reference:
- `knowledge/` - AI-optimized reference (concise)
- `docs/` - Human documentation (comprehensive)
- `prompts/` - Task-specific workflows

## :toolbox: Tools

### :toolbox: chimera-lab-cli
CLI tool for organization management (located in `original.topic/chimera-lab-cli.app/`):
- Repository discovery and navigation
- Issue/milestone/label management
- Template application
- Documentation validation
- Graph generation
- Rule enforcement

See `original.topic/chimera-lab-cli.app/docs/knowledge/` for CLI-specific docs.

### :toolbox: Utility Scripts (`.chimera-lab/utils/`)
- `git_update_submodules.sh` - Update all submodules
- `git_commit_submodules.sh` - Commit all submodule changes
- `rebuild-repo-with-template.sh` - Apply template updates
- `bulk-rebuild-repo-with-template.sh` - Bulk template updates
- `github_create_labels.sh` - Bulk label creation
- `github_create_milestones.sh` - Bulk milestone creation
- `github_create_issues_milestones.sh` - Bulk issue creation

## :world_map: Guides

Clone with `git clone --recursive <org-url>`. Update: `git submodule update --remote --merge`. Add: `git submodule add <url> <path>`. Push submodule changes first, then commit super-repo reference. Visualize with `cmr graph all` (projects/repos/templates), `cmr org tree` (hierarchy), or GraphML files in `.chimera-lab/repositories/`. Organization rules enforced via naming conventions, metadata requirements, documentation standards, template compliance, and submodule integrity. See `CONTRIBUTING.md` for file placement rules.

## :books: References

| Suffix | Purpose | Example |
|--------|---------|---------|
| `.topic` | Knowledge/study topic | `devops.topic` |
| `.project` | Dedicated project | `chimera-lab-blog.project` |
| `.app` | Application | `chimera-lab-cli.app` |
| `.package` | Library/package | `chimera-lab-laravel.package` |
| `.scaffold` | Boilerplate generator | `wordpress-plugin-abstraction.scaffold` |
| `.template` | GitHub template | `laravel_app.template` |
| `.overview` | Study material/overview | `docker.overview` |
| `.diy` | DIY/hardware project | `network-storage.diy` |
