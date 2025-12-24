# System Knowledge

Organization architecture, structure, configuration, and core concepts for chimera-lab.org multi-repository system.

## Organization Structure

```
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

## Core Concepts

### Super-Repository Pattern
chimera-lab.org uses Git super-repository with submodules:
- Organization root tracks all sub-repositories
- Each topic/project is a Git submodule
- Centralized metadata and configuration
- Independent development in each submodule

### Topic-Based Organization
Knowledge and projects organized by topics:
- Topics can contain sub-topics recursively
- Topics group related repositories
- Clear hierarchy (Level 0: org → Level 1: topic → Level 2+: nested)

### Repository Types
Different suffixes for different purposes:
- `.topic` - Knowledge topics
- `.project` - Dedicated projects
- `.app` - Applications
- `.package` - Libraries
- `.scaffold` - Boilerplates
- `.template` - GitHub templates
- `.overview` - Study material
- `.diy` - DIY/hardware projects

### Template System
Reusable repository structures:
- Templates stored in `template.topic/`
- Applied via GitHub template mechanism
- Stored as submodule in `.github/.template/` of child repos
- Hierarchy: `repository.template` (base) → specialized templates

### Metadata System
Centralized configuration and metadata:
- Organization level: `.chimera-lab/` (labels, milestones, settings)
- Repository level: `.chimera-lab/meta.json` (repo metadata)
- Submodule tracking: `.gitmodules` (submodule references)

## Configuration Files

### Organization Level (`.chimera-lab/`)

**`config/labels.json`** - Default labels by category
- Categories: common, general, infrastructure, interface, embedded, study
- Applied to all repositories unless overridden
- Full reference: `.github/docs/reference/labels-org.json`

**`config/milestones.json`** - Default milestone stages
- 7-stage system: Ideating → Planning → Building → Presenting → Sharing → Polishing → Releasing
- Used when repository doesn't have custom milestones
- Full reference: `.github/docs/reference/milestones-default.json`

**`config/repo.json`** - Repository planning
```json
{
  "planned": ["future-project.project"],
  "ignored": ["deprecated.topic"]
}
```

**`domains/domains.json`** - Organization domain hierarchy
- Maps topics to subtopics and repositories
- Used for navigation and organization

### Repository Level (`.chimera-lab/meta.json`)

```json
{
  "name": "repository-name",
  "template": "template.name",
  "parent": "parent-topic",
  "level": 2,
  "is_template": false
}
```

## Agent System

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

## Management Tools

### chimera-lab-cli
CLI tool for organization management (located in `original.topic/chimera-lab-cli.app/`):
- Repository discovery and navigation
- Issue/milestone/label management
- Template application
- Documentation validation
- Graph generation
- Rule enforcement

See `original.topic/chimera-lab-cli.app/.github/knowledge/` for CLI-specific docs.

### Utility Scripts (`.chimera-lab/utils/`)
- `git_update_submodules.sh` - Update all submodules
- `git_commit_submodules.sh` - Commit all submodule changes
- `rebuild-repo-with-template.sh` - Apply template updates
- `bulk-rebuild-repo-with-template.sh` - Bulk template updates
- `github_create_labels.sh` - Bulk label creation
- `github_create_milestones.sh` - Bulk milestone creation
- `github_create_issues_milestones.sh` - Bulk issue creation

## Submodule Workflow

Each repository is a Git submodule:

```bash
# Clone organization with submodules
git clone --recursive <org-url>

# Update all submodules
git submodule update --remote --merge

# Add new submodule
git submodule add <repo-url> <path>

# Work in submodule
cd <submodule-path>
git checkout main
# make changes
git commit -am "changes"
git push

# Update super-repo reference
cd ../..
git add <submodule-path>
git commit -m "Update submodule reference"
git push
```

## Documentation Structure

**Organization-Level** (`.github/`):
- `README.md` - Organization overview
- `RULES.md` - Complete organization rules
- `agents/` - AI agent definitions
- `prompts/` - Workflow prompts
- `knowledge/` - AI-optimized reference
- `docs/` - Comprehensive documentation

**Repository-Level**:
- Each repo has own `.github/` or documentation structure
- Follows template conventions
- Maintains consistency with organization standards

## Best Practices

1. **Consistent Naming**: Always use suffix conventions
2. **Metadata Maintenance**: Keep `.chimera-lab/` files updated
3. **Documentation**: Maintain README.md in every repository
4. **Submodule Sync**: Regular `git submodule update`
5. **Template Usage**: Apply templates for consistency
6. **Shallow Hierarchy**: Limit nesting to 3-4 levels
7. **Agent Coordination**: Use agents for complex operations
8. **Rule Validation**: Regular `cmr rules check` if CLI available

## Repository Suffixes Reference

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

## Graph Generation

Visualize organization structure:
- Repository relationships
- Template usage
- Topic hierarchy
- Project dependencies

Stored in `.chimera-lab/repositories/*.graphml`

## Rules and Validation

Organization-wide rules enforced through:
- Naming conventions
- Metadata requirements
- Documentation standards
- Template compliance
- Submodule integrity

Documented in `.github/RULES.md`
