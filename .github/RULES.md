# Chimera-LAB Organization Rules

Comprehensive rules and conventions for chimera-lab.org multi-repository organization structure, documentation, and management.

- [Chimera-LAB Organization Rules](#chimera-lab-organization-rules)
  - [Organization Structure](#organization-structure)
    - [Super-Repository Pattern](#super-repository-pattern)
    - [Topic-Based Organization](#topic-based-organization)
    - [Submodules](#submodules)
  - [Repository Naming](#repository-naming)
    - [Required Suffixes](#required-suffixes)
    - [Naming Conventions](#naming-conventions)
  - [Repository Structure](#repository-structure)
    - [Required Files](#required-files)
    - [Metadata Files (.chimera-lab/)](#metadata-files-chimera-lab)
    - [Template Submodule](#template-submodule)
  - [Documentation Standards](#documentation-standards)
    - [README.md Requirements](#readmemd-requirements)
    - [Document Headers](#document-headers)
    - [Link Prefixes](#link-prefixes)
  - [Project Management](#project-management)
    - [Project Stages](#project-stages)
    - [Issues](#issues)
    - [Milestones](#milestones)
    - [Labels](#labels)
  - [Git Workflow](#git-workflow)
    - [Commits](#commits)
    - [Branches](#branchs)
    - [Submodule Updates](#submodule-updates)
  - [Templates](#templates)
    - [Template Hierarchy](#template-hierarchy)
    - [Template Application](#template-application)
    - [Template Versioning](#template-versioning)
  - [Validation](#validation)
    - [Structure Validation](#structure-validation)
    - [Metadata Validation](#metadata-validation)

## Organization Structure

### Super-Repository Pattern

chimera-lab.org uses super-repository pattern:
- Organization root is a Git repository tracking all sub-repositories
- Each topic/project is a Git submodule
- Centralized metadata in `.chimera-lab/`
- Coordinated updates via submodule references

### Topic-Based Organization

Content organized in topic hierarchy:
- Top-level topics group related knowledge/projects
- Sub-topics provide deeper categorization
- Repositories nested within appropriate topics
- Maximum recommended depth: 3-4 levels

**Example Structure**:
```
devops.topic/
├── docker.topic/
│   ├── docker.overview/
│   └── docker-scaffold.topic/
└── kubernetes.overview/
```

### Submodules

**Requirements**:
- Every topic/project must be a Git submodule
- Submodule URL must be HTTPS or SSH GitHub URL
- Submodule path must match directory structure
- `.gitmodules` file maintained in organization root

**Management**:
```bash
# Update all submodules
git submodule update --remote --merge

# Add new submodule
git submodule add <repo-url> <path>
```

## Repository Naming

### Required Suffixes

Every repository MUST use one of these suffixes:

| Suffix | Purpose | Example |
|--------|---------|---------|
| `.topic` | Knowledge topic/organization unit | `devops.topic` |
| `.project` | Dedicated development project | `chimera-lab-blog.project` |
| `.app` | Standalone application | `chimera-lab-cli.app` |
| `.package` | Reusable library/package | `chimera-lab-laravel.package` |
| `.scaffold` | Boilerplate generator | `wordpress-plugin-abstraction.scaffold` |
| `.template` | GitHub repository template | `app.template` |
| `.overview` | Study material/overview | `docker.overview` |
| `.diy` | DIY/hardware project | `network-storage.diy` |

### Naming Conventions

- Use lowercase-with-hyphens format
- Name must be descriptive and concise
- Suffix must match repository purpose
- No special characters except hyphens
- No spaces in names

**Valid**: `chimera-lab-cli.app`, `docker.overview`, `devops.topic`  
**Invalid**: `ChimeraLabCLI.app`, `docker_overview`, `devops topic`

## Repository Structure

### Required Files

Every repository MUST contain:

```
repository-name.suffix/
├── .chimera-lab/
│   └── meta.json                 # REQUIRED
├── .github/
│   └── .template/                # REQUIRED (Git submodule)
├── .gitignore                    # REQUIRED
├── LICENSE                       # REQUIRED
└── README.md                     # REQUIRED
```

### Metadata Files (.chimera-lab/)

**`meta.json`** (REQUIRED):
```json
{
  "name": "repository-name.suffix",
  "template": "template-name.template",
  "parent": "parent-topic",
  "level": 2,
  "is_template": false
}
```

**Fields**:
- `name` - Repository name with suffix
- `template` - Template used (from template.topic/)
- `parent` - Parent topic directory
- `level` - Hierarchical depth (0=org, 1=top-topic, 2+=nested)
- `is_template` - Boolean indicating if this is a template

**Optional Files**:
- `issues.json` - Issue definitions
- `milestones.json` - Milestone definitions
- `labels.json` - Label definitions

### Template Submodule

Every repository MUST include template as submodule:

```bash
# Template stored in .github/.template/
.github/.template/  → Git submodule pointing to template repository
```

**Purpose**:
- Track template version used
- Enable template updates
- Maintain consistency with template structure

## Documentation Standards

### README.md Requirements

Every README.md MUST:
- Include template version comment: `<!--(version=a.b.c)-->`
- Follow template structure from applied template
- Use emoji prefixes for headers (see [Document Headers](#document-headers))
- Include TOC for documents >100 lines
- Maintain link conventions (see [Link Prefixes](#link-prefixes))

**Template Version**:
```markdown
<!--(version=1.2.3)-->
# Repository Name

```

**Version Semantics**:
- `a` (major) - Changes require manual revision
- `b` (minor) - Changes can be automatically resolved  
- `c` (patch) - Changes can be safely ignored

### Document Headers

Document headers MUST have emoji prefixes:

| Emoji | Header | Usage |
|-------|--------|-------|
| :paperclip: | Appendix | Supplemental notes, references |
| :book: | Chapter | Content chapters or sections |
| :hammer_and_wrench: | Common problems | Known issues and troubleshooting |
| :wrench: | Configuration | Setup and configuration |
| :busts_in_silhouette: | Contributing | Contribution guidelines |
| :medal_military: | Credits | Acknowledgments and credits |
| :control_knobs: | Customization | Customization options |
| :chains: | Dependencies | Project dependencies |
| :page_facing_up: | Files | File descriptions |
| :inbox_tray: | Installation | Installation instructions |
| :loudspeaker: | Introduction | Introduction section |
| :package: | Material | Learning materials |
| :notebook: | Notes | Additional notes |
| :telescope: | Overview | Overview or summary |
| :books: | References | External references |
| :clipboard: | Requirements | Prerequisites and requirements |
| :link: | See also | Related content |
| :gear: | Software | Software information |
| :building_construction: | Structure | Project structure |
| :newspaper: | Sources | Information sources |
| :file_cabinet: | Submodule | Submodule information |
| :triangular_ruler: | Technologies | Technologies used |
| :mag: | Terminology | Terms and definitions |
| :memo: | To-do list | Task lists |
| :toolbox: | Tools | Tools and utilities |
| :keyboard: | Usage | Usage instructions |
| :scroll: | License | License information |
| :warning: | Warnings | Important warnings |

### Link Prefixes

Links MUST use appropriate prefixes:

| Prefix | Type | Usage |
|--------|------|-------|
| :globe_with_meridians: | External link | Links outside chimera-lab |
| :file_cabinet: | Chimera LAB repository | Internal chimera-lab repos |
| :file_folder: | Other repository | Non-chimera-lab repos |
| :mag: | Term/glossary | Terminology references |

**Example**:
```markdown
- [:globe_with_meridians: Docker Documentation](https://docs.docker.com)
- [:file_cabinet: chimera-lab-cli.app](https://github.com/chimera-lab/chimera-lab-cli.app)
- [:mag: Containerization](#terminology)
```

## Project Management

### Project Stages

Projects follow 7-stage milestone system:

| Stage | Goal | Exit Criteria |
|-------|------|---------------|
| **1 - Ideating** | Generate ideas | Clear problem + viable solution idea? |
| **2 - Planning** | Define direction | Basic roadmap with tasks/estimates? |
| **3 - Building** | Create MVP | Main features working without crashes? |
| **4 - Presenting** | Make it usable | Someone can demo with guidance? |
| **5 - Sharing** | Show to world | Published with feedback mechanism? |
| **6 - Polishing** | Refine | Clean code, modular, stable infra? |
| **7 - Releasing** | Launch as product | Ready for public use + support? |

### Issues

**Organization-level issues** tracked in organization root  
**Project-specific issues** tracked in respective repositories

**Issue Requirements**:
- Clear title describing issue
- Detailed description
- Appropriate labels applied
- Milestone assigned (if applicable)
- Linked to related issues

### Milestones

Default milestones stored in `.chimera-lab/config/milestones.json`

Repositories may override with custom milestones in `.chimera-lab/milestones.json`

### Labels

Labels organized by category. Default labels in `.chimera-lab/config/labels.json`

**Categories**:
- **Common** - Standard GitHub labels
- **General** - Application logic, performance, testing
- **Infrastructure** - DevOps, containers, CI/CD
- **Interface** - UI/UX, desktop, mobile, CLI
- **Embedded** - Hardware, firmware, OS-level
- **Study** - Terminology, guides, chapters

Full label list available in `.github/docs/reference/labels-org.json`

## Git Workflow

### Commits

**Conventional Commits** format:
```
type(scope): description

[optional body]
[optional footer]
```

**Types**:
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation
- `style` - Formatting
- `refactor` - Code refactoring
- `test` - Tests
- `chore` - Maintenance

**Scopes**: Repository-specific (e.g., `docs`, `ci`, `api`)

**Examples**:
```
feat(templates): add Laravel app template
docs(readme): update installation instructions
chore(submodules): update all submodule references
```

### Branchs

**Branch Naming**:
- `main` - Primary branch
- `feature/<name>` - Feature branches
- `bugfix/<name>` - Bug fix branches
- `docs/<name>` - Documentation branches
- `hotfix/<name>` - Urgent fixes

### Submodule Updates

**Workflow**:
1. Work in submodule repository
2. Commit and push changes in submodule
3. Return to organization root
4. Update submodule reference: `git add <submodule-path>`
5. Commit: `git commit -m "chore(submodules): update <repo-name>"`
6. Push organization changes

**Bulk Updates**:
```bash
# Update all submodules
.chimera-lab/utils/git_update_submodules.sh

# Commit all submodule changes
.chimera-lab/utils/git_commit_submodules.sh
```

## Templates

### Template Hierarchy

Templates inherit from base `repository.template`:

```
repository.template (base)
├── topic.template
├── overview.template
├── diy.template
├── app.template
│   ├── typescript_app.template
│   └── laravel_app.template
├── project.template
├── package.template
├── scaffold.template
│   └── docker_scaffold.template
└── org.template
```

Full list: See `template.topic/` or `.github/knowledge/templates.knowledge.md`

### Template Application

**Via GitHub**:
1. Use "Use this template" button on template repository
2. Create new repository from template
3. Add as submodule to organization
4. Add template as submodule to `.github/.template/`

**Via CLI** (if chimera-lab-cli available):
```bash
cmr repo create --name new-repo.suffix --template template-name.template --topic parent.topic
```

### Template Versioning

Templates use semantic versioning: `MAJOR.MINOR.PATCH`

**In template README.md**:
```markdown
<!--(version=1.2.3)-->
```

**Update Process**:
1. Update template repository
2. Identify affected repositories
3. Apply updates using utility scripts or CLI
4. Test and validate
5. Update documentation

## Validation

### Structure Validation

Organization structure validation checks:
- [ ] All directories have correct suffix
- [ ] All repositories are Git submodules
- [ ] `.chimera-lab/meta.json` present in all repos
- [ ] `.github/.template/` submodule present
- [ ] Required files present (README.md, LICENSE, .gitignore)
- [ ] Topic hierarchy logical (max 3-4 levels)

**Validation Tools**:
```bash
# Via CLI (if available)
cmr validate structure
cmr rules check
```

### Metadata Validation

Metadata validation checks:
- [ ] `.chimera-lab/config/*.json` valid JSON
- [ ] Repository meta.json fields complete
- [ ] Template references valid
- [ ] Parent-child relationships correct
- [ ] Hierarchical levels accurate

**Validation**:
```bash
# Check JSON syntax
jq empty .chimera-lab/config/labels.json
jq empty .chimera-lab/config/milestones.json
jq empty .chimera-lab/config/repo.json

# Via CLI (if available)
cmr validate metadata
```

---

## Enforcement

These rules are:
- **REQUIRED** - Must be followed for all repositories
- **Enforced** - Via automated validation when possible
- **Coordinated** - By organization-manager AI agent
- **Documented** - In organization knowledge base

Exceptions require organization-level approval and documentation.

## References

- [ORGANIZATION_STRUCTURE.md](/.github/docs/ORGANIZATION_STRUCTURE.md) - Repository conventions
- [ORGANIZATION_MANAGEMENT.md](/.github/docs/ORGANIZATION_MANAGEMENT.md) - Management workflows
- [NAMING_CONVENTIONS.md](/.github/docs/NAMING_CONVENTIONS.md) - Detailed naming guide
- [templates.knowledge.md](/.github/knowledge/templates.knowledge.md) - Template management
- [organization.knowledge.md](/.github/knowledge/organization.knowledge.md) - Organization concepts

- External link names shoud be prefixed with `:globe_with_meridians:` :globe_with_meridians:.
  - Example: `:globe_with_meridians: [Wikipedia](https://www.wikipedia.org/)` [:globe_with_meridians: Wikipedia](https://www.wikipedia.org/)

- Link associated to Organization repositories shoud have their name prefixed with `:open_file_folder:` :open_file_folder:.
  - Example chimera-lab: `[:open_file_folder: Chimera-lab](https://github.com/chimera-lab/chimera-lab)` [:open_file_folder: chimera-lab/chimera-lab](https://github.com/chimera-lab/chimera-lab)
  - Example others: `[:file_folder: github/docs](https://github.com/github/docs)` [:file_folder: github/docs](https://github.com/github/docs)

- Links related to Organization Terms should have their name prefixed with `:mag:` :mag:.
  - Example: `[:mag: Term](https://github.com/chimera-lab/template.topic?tab=readme-ov-file#repository)` [:mag: Term](https://github.com/chimera-lab/template.topic?tab=readme-ov-file#repository)

- Links related to the document should have their name prefixed with their icon as documented in  [Document Headers](#document-headers).
  - Example: `[:paperclip: Appendix](#paperclip-appendix)` [:paperclip: Appendix](#paperclip-appendix)
  - Example: `[:notebook: Notes](#notebook-notes)` [:notebook: Notes](#notebook-notes)
