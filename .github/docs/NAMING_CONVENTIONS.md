# Naming Conventions

Complete guide for repository naming, suffixes, hierarchy, and conventions for chimera-lab.org organization.

## Repository Suffixes

Every repository **MUST** use one of the following suffixes. The suffix indicates the repository's purpose and constraints.

### `.topic` - Knowledge Topics

**Purpose**: Organizational unit for related knowledge, projects, or sub-topics

**Characteristics**:
- Can contain sub-topics recursively
- Groups related repositories or knowledge
- No implementation code (or minimal)
- Contains documentation and coordination
- May contain submodules for related projects

**Naming**:
```
<area>-<sub-area>.topic
```

**Examples**:
- `administration.topic` - Administrative knowledge
- `devops.topic` - DevOps and infrastructure
- `devops.topic/docker.topic/` - Nested topic
- `security.topic/network-security.topic/` - Network security topic

**Directory Structure**:
```
<name>.topic/
├── README.md                 # Topic overview
├── .github/                  # Configuration
├── <sub-topic>.topic/        # Optional: nested topics
├── <project>.project/        # Optional: projects
└── <overview>.overview/      # Optional: learning material
```

**When to Use**:
- ✅ Organizing related knowledge areas
- ✅ Grouping multiple projects
- ✅ Creating topic hierarchies
- ❌ Not for single implementations
- ❌ Not for individual applications

---

### `.project` - Dedicated Projects

**Purpose**: Complete project with dedicated repository and lifecycle

**Characteristics**:
- Full application or service
- Independent development lifecycle
- Own issue tracking and milestones
- May contain multiple components
- Long-term maintenance

**Naming**:
```
<organization>-<name>.project
```

**Examples**:
- `chimera-lab-blog.project` - Blog application
- `chimera-lab-store.project` - Store application
- `chimera-lab-chat.project` - Chat application

**Directory Structure**:
```
<name>.project/
├── README.md
├── .github/
│   ├── workflows/           # CI/CD pipelines
│   └── .template/           # Applied template (submodule)
├── .chimera-lab/
│   ├── meta.json
│   ├── issues.json
│   └── milestones.json
├── src/                      # Source code
├── docs/                     # Documentation
├── tests/                    # Tests
└── [project-specific...]
```

**When to Use**:
- ✅ Full applications or services
- ✅ Long-term projects
- ✅ Projects with dedicated team
- ✅ Projects requiring version management
- ❌ Not for libraries (use `.package`)
- ❌ Not for single tools (use `.app`)

---

### `.app` - Applications/Tools

**Purpose**: Standalone application, command-line tool, or end-user facing software

**Characteristics**:
- Executable or deployed application
- End-user facing tool
- Single primary purpose
- Can be simpler than projects
- May be used internally or publicly

**Naming**:
```
<organization>-<name>.app
```

**Examples**:
- `chimera-lab-cli.app` - CLI management tool
- `organizer.app` - Organization tool
- `build-helper.app` - Build utility

**Directory Structure**:
```
<name>.app/
├── README.md
├── .github/
│   ├── .template/           # Applied template
│   └── workflows/
├── src/                      # Source code
├── build/                    # Build configuration
├── docs/                     # User documentation
└── [app-specific...]
```

**When to Use**:
- ✅ Standalone applications
- ✅ Command-line tools
- ✅ End-user software
- ✅ Utility applications
- ❌ Not for libraries (use `.package`)
- ❌ Not for long-term projects (use `.project`)

---

### `.package` - Libraries/Packages

**Purpose**: Reusable library or package for use by other projects

**Characteristics**:
- Importable code library
- Shared across multiple projects
- Versioned for compatibility
- Not an executable
- Focused on code reuse

**Naming**:
```
<organization>-<language>-<name>.package
```

**Examples**:
- `chimera-lab-laravel.package` - Laravel package
- `chimera-lab-python-utils.package` - Python utilities
- `chimera-lab-js-helpers.package` - JavaScript helpers

**Directory Structure**:
```
<name>.package/
├── README.md
├── .github/
│   ├── .template/
│   └── workflows/
├── .chimera-lab/
│   └── meta.json
├── src/                      # Source code
├── tests/                    # Tests
├── docs/                     # API documentation
├── composer.json             # (PHP) or package.json (JS) or setup.py (Python)
└── [package-specific...]
```

**When to Use**:
- ✅ Reusable libraries
- ✅ Code shared across projects
- ✅ Frameworks or utilities
- ❌ Not for applications (use `.app`)
- ❌ Not for projects (use `.project`)

---

### `.scaffold` - Scaffolds/Boilerplates

**Purpose**: Boilerplate code generator or template for project initialization

**Characteristics**:
- Code generation template
- Used to bootstrap new projects
- Contains structure and configuration
- Not for direct use (generator input)
- Can include scripts for setup

**Naming**:
```
<framework>-<purpose>.scaffold
```

**Examples**:
- `wordpress-plugin-abstraction.scaffold` - WordPress plugin template
- `laravel-app-scaffold.scaffold` - Laravel app boilerplate
- `docker-compose.scaffold` - Docker compose template

**Directory Structure**:
```
<name>.scaffold/
├── README.md
├── .github/
│   ├── .template/
│   └── generator.sh (optional)
├── template/                 # Template files
│   ├── src/
│   ├── config/
│   └── [structure...]
├── scripts/                  # Generation scripts
└── [scaffold-specific...]
```

**When to Use**:
- ✅ Project starters
- ✅ Boilerplate generators
- ✅ Code generation templates
- ✅ Reusable project structures
- ❌ Not for finished projects

---

### `.template` - GitHub Templates

**Purpose**: GitHub repository template for creating new repositories

**Characteristics**:
- Reusable repository structure
- Applied via GitHub "Use this template"
- Contains base structure for category
- Stored as submodule in `.github/.template/`
- Used across multiple repositories

**Naming**:
```
<category>.template
```

**Examples**:
- `repository.template` - Base for all repos
- `topic.template` - For topic repositories
- `app.template` - For application repositories
- `laravel_app.template` - Laravel-specific app template
- `docker_scaffold.template` - Docker scaffold template

**Directory Structure**:
```
<name>.template/
├── README.md                 # Template usage instructions
├── .github/                  # Default GitHub config
│   ├── CONTRIBUTING.md
│   ├── ISSUE_TEMPLATE/
│   └── workflows/
├── .gitignore
├── LICENSE
├── [base-structure...]       # Structure for all children
```

**Hierarchy**:
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

**When to Use**:
- ✅ Creating new repositories
- ✅ Ensuring consistency
- ✅ Standardizing structure
- ✅ Every repository should use a template

---

### `.overview` - Study Material/Overviews

**Purpose**: Educational content, documentation, and learning materials

**Characteristics**:
- Study material and tutorials
- Documentation and guides
- No implementation code (or minimal examples)
- Focused on explanation
- Versioned like other repos

**Naming**:
```
<topic>.overview
```

**Examples**:
- `docker.overview` - Docker learning material
- `kubernetes.overview` - Kubernetes guide
- `networking.overview` - Network concepts

**Directory Structure**:
```
<name>.overview/
├── README.md                 # Main content or TOC
├── .github/
│   ├── .template/
│   └── [guides]/            # Chapter guides
├── chapters/                 # Content chapters
│   ├── 01-introduction.md
│   ├── 02-basics.md
│   └── [...]/
├── examples/                 # Code examples
├── images/                   # Diagrams and screenshots
└── appendix/                 # References and notes
```

**When to Use**:
- ✅ Learning materials
- ✅ Documentation
- ✅ Technical guides
- ✅ Tutorials and walkthroughs
- ❌ Not for implementation (use `.app`, `.project`, `.package`)

---

### `.diy` - DIY/Hardware Projects

**Purpose**: Do-It-Yourself projects, hardware experiments, and home automation

**Characteristics**:
- Hardware or physical components
- DIY/maker projects
- Home automation setup
- Experimental or hobbyist focus
- May contain code, docs, and schematics

**Naming**:
```
<name>.diy
```

**Examples**:
- `network-storage.diy` - DIY NAS project
- `music-server.diy` - Home music server
- `solar-system.diy` - Solar power setup

**Directory Structure**:
```
<name>.diy/
├── README.md
├── .github/
│   └── .template/
├── docs/
│   ├── hardware.md          # Components and specs
│   ├── setup.md             # Assembly instructions
│   └── configuration.md     # Setup guide
├── code/                     # Software (if any)
├── schematics/               # Circuit diagrams
└── [project-specific...]
```

**When to Use**:
- ✅ Hardware projects
- ✅ DIY experiments
- ✅ Home automation
- ✅ Maker projects
- ❌ Not for pure software

---

## Naming Format

### General Rules

1. **Lowercase with hyphens**: `my-repository-name`
2. **No spaces**: `❌ my repository` → `✅ my-repository`
3. **No special characters**: `❌ my@repo!` → `✅ my-repo`
4. **Descriptive**: Should indicate purpose clearly
5. **Consistent organization prefix**: Usually `chimera-lab-` or project-specific

### Format Patterns

**Organization-created**:
```
chimera-lab-<name>.<suffix>
```

Examples:
- `chimera-lab-cli.app`
- `chimera-lab-blog.project`
- `chimera-lab-laravel.package`

**Community/External**:
```
<tool>-<purpose>.<suffix>
```

Examples:
- `wordpress-plugin-abstraction.scaffold`
- `docker-compose.scaffold`
- `laravel-docker-scaffold.scaffold`

**Study/Knowledge**:
```
<topic>.<suffix>
```

Examples:
- `docker.overview`
- `kubernetes.overview`
- `devops.topic`

---

## Hierarchy and Nesting

### Recommended Hierarchy

```
Level 0: chimera-lab.org (organization root)
Level 1: <category>.topic (top-level topics)
Level 2: <subcategory>.topic (sub-topics)
Level 3: <name>.<suffix> (repositories)
```

**Example**: 
```
chimera-lab.org/
├── devops.topic/
│   ├── docker.topic/
│   │   ├── docker.overview/
│   │   ├── docker-scaffold.topic/
│   │   │   └── laravel-docker.scaffold/
│   │   └── docker-compose.scaffold/
│   └── kubernetes.overview/
└── security.topic/
    ├── network-security.topic/
    │   └── firewalls.topic/
    └── authentication.overview/
```

### Maximum Nesting

**Recommended**: 3-4 levels maximum
**Absolute limit**: 5 levels

Deeper nesting becomes:
- Hard to navigate
- Difficult to maintain
- Complex submodule references
- Poor user experience

**If nesting > 3 levels**: Consider splitting into separate organization.

---

## Valid and Invalid Examples

### Valid Names ✅

```
administration.topic          ✅ Lowercase, descriptive
linux-administration.topic    ✅ Hyphen-separated
chimera-lab-cli.app          ✅ Organization prefix
docker.overview              ✅ Study material
network-storage.diy          ✅ DIY project
chimera-lab-laravel.package  ✅ Package with language
laravel-app.template         ✅ Template
```

### Invalid Names ❌

```
ChimeraLabCLI.app            ❌ Camel case (use lowercase)
chimera_lab_cli.app          ❌ Underscores (use hyphens)
chimera-lab-cli.tool         ❌ Invalid suffix (.app, .project, etc. required)
chimera-lab cli.app          ❌ Spaces in name
chimera-lab-cli!.app         ❌ Special characters
chimera-lab-cli.APP          ❌ Uppercase suffix
```

---

## Anti-Patterns to Avoid

### Don't:
1. **Mix formats**: `chimera_lab-cli.app` (choose - or _)
2. **Use capitals**: `ChimeraLab-CLI.app`
3. **Abbreviate excessively**: `c-lab-cli.app` (use full names)
4. **Generic names**: `app1.app`, `tool.app` (be specific)
5. **Nested too deeply**: Avoid > 4 levels
6. **Inconsistent prefixes**: Don't mix `chimera-lab-`, `clab-`, `cl-`
7. **Wrong suffix**: Choose appropriate suffix for purpose
8. **Rename existing repos**: Once named, keep stable

### Do:
1. **Use consistent format**: All lowercase with hyphens
2. **Choose appropriate suffix**: Reflects repository purpose
3. **Include organization**: `chimera-lab-` prefix for org repos
4. **Keep shallow hierarchy**: 3 levels preferred, max 4
5. **Be descriptive**: Name clearly indicates purpose
6. **Follow conventions**: Match existing repository patterns
7. **Plan naming**: Think before creating repository
8. **Document purpose**: Update README with clear purpose

---

## Changing Names

### Renaming Repositories

**Avoid if possible** - repository renames are complex:
- Breaks submodule references
- Requires organization-wide updates
- Affects URLs and documentation

**If necessary**:
1. Create new repository with correct name
2. Migrate content from old to new
3. Update submodule references in organization
4. Create redirect/archive note in old repo
5. Update all documentation

**Better approach**: Plan names carefully before creation.

---

## Summary Table

| Suffix | Purpose | Example | Files | Nesting |
|--------|---------|---------|-------|---------|
| `.topic` | Knowledge area | `devops.topic` | Docs, configs | Can nest |
| `.project` | Project | `chimera-lab-blog.project` | Code, docs, tests | No nesting |
| `.app` | Application | `chimera-lab-cli.app` | Code, docs | No nesting |
| `.package` | Library | `chimera-lab-laravel.package` | Code, docs, tests | No nesting |
| `.scaffold` | Boilerplate | `laravel-app.scaffold` | Template, scripts | No nesting |
| `.template` | GitHub template | `app.template` | Base structure | Hierarchy |
| `.overview` | Study material | `docker.overview` | Docs, examples | No nesting |
| `.diy` | DIY project | `network-storage.diy` | Code, docs, schematics | No nesting |

---

## References

- [ORGANIZATION_MANAGEMENT.md](./ORGANIZATION_MANAGEMENT.md) - Organization workflows
- [RULES.md](../.github/RULES.md) - Organization rules
- [organization.knowledge.md](../.github/knowledge/organization.knowledge.md) - Organization concepts
- [repository.knowledge.md](../.github/knowledge/repository.knowledge.md) - Repository details
