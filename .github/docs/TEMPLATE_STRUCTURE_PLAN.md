# Template Structure Planning

Complete specification for chimera-lab.org template architecture, documentation requirements, and validation rules.

## Overview

Templates are organized in a 3-level hierarchy:
- **Level 0**: `repository.template` (BASE - foundation for all)
- **Level 1**: 8 specialized templates (inherit from repository.template)
- **Level 2**: 4 specialized templates (inherit from Level 1)

Each template is a GitHub repository template stored in `template.topic/` and referenced via `.chimera-lab/.template` submodule in child repositories.

---

## Documentation Requirements by Template Type

### 0. repository.template (BASE)

**Purpose**: Foundation for all repositories in the organization.

**Required Files**:
- `README.md` - Explains that this is a template, how to use it
- `LICENSE` - GPLv3 or matching org license
- `CONTRIBUTING.md` - General contribution guidelines
- `CHANGELOG.md` - Version history and changes
- `CODE_OF_CONDUCT.md` - Community standards and behavior
- `.gitignore` - Standard patterns
- `.editorconfig` - Editor configuration for consistency

**Recommended Files**:
- `SECURITY.md` - Vulnerability reporting policy
- `SUPPORT.md` - How to get help and support
- `.github/ISSUE_TEMPLATE/` - Issue templates
- `.github/PULL_REQUEST_TEMPLATE.md` - PR template
- `.github/CODEOWNERS` - Code ownership
- `.github/workflows/` - CI/CD templates
- `.gitattributes` - Git attributes for line endings, etc.

**Optional Files**:
- `.github/FUNDING.yml` - Sponsorship information
- `AUTHORS.md` or `CONTRIBUTORS.md` - Contributors list
- `.github/dependabot.yml` - Dependency updates automation
- `docs/adr/` - Architecture Decision Records (ADR)

**Metadata**:
```
.chimera-lab/
├── meta.json (is_template: true, template: None, parent: template.topic)
├── settings.json (labels, milestones)
└── issues.json (issue template definitions)
```

**Validation**:
- cmr docs check must pass
- Must have valid markdown structure
- README must document template usage

**Example meta.json**:
```json
{
  "name": "repository.template",
  "description": "Foundation template for all chimera-lab repositories",
  "template": null,
  "parent": "template.topic",
  "level": 0,
  "is_template": true,
  "created_at": "2025-01-01",
  "version": "1.0.0"
}
```

---

### 1.1. topic.template

**Purpose**: Knowledge organization - groups related repositories and content.

**Inherits From**: `repository.template`

**Required Files**:
- `README.md` - Topic overview, navigation, organization structure
- `LICENSE` - Inherited from base
- `CONTRIBUTING.md` - How to contribute to topic
- `CHANGELOG.md` - Topic evolution and changes
- `CODE_OF_CONDUCT.md` - Community standards
- `.gitignore` - Standard patterns

**Recommended Files**:
- `SUPPORT.md` - How to get help for this topic
- `.github/ISSUE_TEMPLATE/` - organization.yml, documentation.yml
- `.github/PULL_REQUEST_TEMPLATE.md` - PR template
- `.editorconfig` - Editor configuration
- `.gitattributes` - Git attributes

**Optional Files**:
- `AUTHORS.md` - Topic curators and contributors
- `.github/CODEOWNERS` - Topic ownership
- `ROADMAP.md` - Topic evolution roadmap

**Topic-Specific**:
- README structure for organizing subtopics
- Navigation patterns for related repositories
- Metadata for topic classification

**Metadata**:
```json
{
  "name": "topic.template",
  "template": "repository.template",
  "parent": "template.topic",
  "level": 1,
  "is_template": true
}
```

**Validation**:
- Must include README with topic structure
- Should list expected subtopics or repositories
- Markdown validation passes

---

### 1.2. overview.template

**Purpose**: Study materials, documentation, learning resources.

**Inherits From**: `repository.template`

**Required Files**:
- `README.md` - Study guide overview
- `LICENSE` - License
- `CONTRIBUTING.md` - Documentation contribution guidelines
- `CHANGELOG.md` - Content updates and revisions
- `CODE_OF_CONDUCT.md` - Community standards
- `.gitignore` - Standard patterns

**Recommended Files**:
- `SUPPORT.md` - How to get help or ask questions
- Chapter-based structure (chapters/, docs/)
- `examples/` - Code examples directory
- `REFERENCES.md` - Sources and further reading
- `.github/ISSUE_TEMPLATE/` - content.yml, improvement.yml
- `.editorconfig` - Editor configuration
- `.gitattributes` - Git attributes

**Optional Files**:
- `AUTHORS.md` - Content authors and contributors
- `GLOSSARY.md` - Terms and definitions
- `FAQ.md` - Frequently asked questions
- `.github/PULL_REQUEST_TEMPLATE.md` - PR template for content contributions

**Overview-Specific**:
- Chapter organization
- Examples directory structure
- Table of contents in README
- References and sources

**Metadata**:
```json
{
  "name": "overview.template",
  "template": "repository.template",
  "parent": "template.topic",
  "level": 1,
  "is_template": true
}
```

**Validation**:
- README documents learning structure
- Has logical chapter/section organization
- Examples are properly structured (if present)

---

### 1.3. diy.template

**Purpose**: DIY projects, hardware, maker content.

**Inherits From**: `repository.template`

**Required Files**:
- `README.md` - Project overview, materials list, instructions
- `LICENSE` - License
- `CONTRIBUTING.md` - Contribution guidelines
- `CHANGELOG.md` - Project versions and updates
- `CODE_OF_CONDUCT.md` - Community standards
- `BILL_OF_MATERIALS.md` - Components/materials list with sources
- `SAFETY.md` - Safety guidelines and warnings
- `.gitignore` - Standard patterns

**Recommended Files**:
- `ASSEMBLY.md` - Step-by-step assembly instructions
- `TROUBLESHOOTING.md` - Common issues and solutions
- `photos/` - Project photos directory
- `diagrams/` - Schematics and diagrams
- `SUPPORT.md` - How to get help
- `.github/ISSUE_TEMPLATE/` - build-issue.yml, improvement.yml
- `.editorconfig` - Editor configuration

**Optional Files**:
- `VARIANTS.md` - Alternative builds or modifications
- `SUPPLIERS.md` - Recommended component suppliers
- `TOOLS.md` - Required tools list
- `3d-models/` - 3D printable parts (if applicable)
- `AUTHORS.md` - Project creators and contributors

**DIY-Specific**:
- Parts list with sources
- Step-by-step instructions
- Photos/diagrams directory
- Assembly/setup guides
- Safety considerations

**Metadata**:
```json
{
  "name": "diy.template",
  "template": "repository.template",
  "parent": "template.topic",
  "level": 1,
  "is_template": true
}
```

**Validation**:
- README includes materials/BOM
- Instructions are clear and structured
- Safety information present (if applicable)

---

### 1.4. app.template

**Purpose**: Applications, standalone tools, end-user software.

**Inherits From**: `repository.template`

**Required Files**:
- `README.md` - App overview, features, installation, usage
- `LICENSE` - License
- `CONTRIBUTING.md` - Code contribution guidelines
- `CHANGELOG.md` - Release history and changes
- `SECURITY.md` - Vulnerability reporting policy
- `CODE_OF_CONDUCT.md` - Community standards
- `SUPPORT.md` - How to get help
- `.gitignore` - Language/framework specific patterns
- `.github/ISSUE_TEMPLATE/` - bug.yml, feature.yml, enhancement.yml, release.yml
- `.github/PULL_REQUEST_TEMPLATE.md` - PR template

**Recommended Files**:
- `docs/adr/` - Architecture Decision Records
- `ARCHITECTURE.md` - System architecture overview
- `.github/workflows/ci.yml` - Continuous Integration
- `.github/workflows/release.yml` - Release automation
- `.github/CODEOWNERS` - Code ownership
- `.editorconfig` - Editor settings
- `.gitattributes` - Git attributes
- `DEPLOYMENT.md` - Deployment instructions
- `TROUBLESHOOTING.md` - Common issues and solutions

**Optional Files**:
- `.github/FUNDING.yml` - Sponsorship information
- `.github/dependabot.yml` - Dependency updates
- `AUTHORS.md` - Application authors and maintainers
- `CONTRIBUTORS.md` - All contributors
- `API.md` - API documentation (if applicable)
- `CONFIGURATION.md` - Configuration guide

**App-Specific**:
- Installation instructions
- Configuration guide
- API documentation (if applicable)
- Development setup guide
- Release notes/changelog

**Metadata**:
```json
{
  "name": "app.template",
  "template": "repository.template",
  "parent": "template.topic",
  "level": 1,
  "is_template": true
}
```

**Validation**:
- README includes installation + usage
- SECURITY.md present
- ICHANGELOG.md` - Release notes and version history
- `ROADMAP.md` - Project roadmap and milestones
- `SECURITY.md` - Security policy
- `CODE_OF_CONDUCT.md` - Inherited from base
- `SUPPORT.md` - Support channels and resources
- `GOVERNANCE.md` - Project governance (if multi-contributor)
- `.github/ISSUE_TEMPLATE/` - epic, story, task, bug templates
- `.github/PULL_REQUEST_TEMPLATE.md` - PR template

**Recommended Files**:
- `docs/adr/` - Architecture Decision Records
- `ARCHITECTURE.md` - System architecture overview
- `.github/workflows/` - CI/CD pipelines
- `.github/CODEOWNERS` - Code ownership by team
- `AUTHORS.md` - Project contributor
---

### 1.5. project.template

**Purpose**: Dedicated projects with full lifecycle (planning, development, deployment).

**Inherits From**: `repository.template`

**Required Files**:
- `README.md` - Project vision, goals, current status
- `LICENSE` - License
- `CONTRIBUTING.md` - Contribution and development guidelines
- `CHANGELOG.md` - Project milestones and changes
- `CODE_OF_CONDUCT.md` - Community standards
- `SECURITY.md` - Security policy (if relevant)
- `.gitignore` - Project-specific patterns
- `.github/ISSUE_TEMPLATE/` - epic.yml, story.yml, task.yml, bug.yml

**Recommended Files**:
- `ROADMAP.md` - Project timeline and major milestones
- `PROJECT_CHARTER.md` - Project scope, objectives, stakeholders
- `TEAM.md` - Team members and roles
- `docs/adr/` - Architecture Decision Records
- `.github/workflows/` - CI/CD workflows
- `.github/PULL_REQUEST_TEMPLATE.md` - PR template
- `.github/CODEOWNERS` - Code ownership
- `.editorconfig` - Editor configuration
- `.gitattributes` - Git attributes
- `SUPPORT.md` - Support and contact information

**Optional Files**:
- `GOVERNANCE.md` - Project governance structure
- `STAKEHOLDERS.md` - Stakeholder registry
- `BUDGET.md` - Budget and resources
- `MEETINGS.md` - Meeting notes and schedules
- `.github/FUNDING.yml` - Sponsorship links
- `AUTHORS.md` - Project authors
- `CONTRIBUTORS.md` - All contributors
- `STATUS.md` - Detailed project status dashboard

**Project-Specific**:
- Project governance
- Milestone planning
- Team structure (if multi-team)
- Release schedule
- Status board/tracking

**Metadata**:
```json
{
  "name": "project.template",
  "template": "repository.template",
  "parent": "template.topic",
  "level": 1,
  "is_template": true
}
```

**Validation**:
- ROADMAP.md or PROJECT_CHARTER.md exists
- Issue templates include epic/story/task types
- README clearly documents project status
- Governance structure defined (if multi-contributor)

---

### 1.6. package.template

**Purpose**: Reusable code libraries, packages, modules.

**Inherits From**: `repository.template`

**Required Files**:
- `README.md` - Package overview, installation, basic usage
- `LICENSE` - License (typically MIT or matching org)
- `CONTRIBUTING.md` - Development contribution guidelines
- `CHANGELOG.md` - Release history
- `SECURITY.md` - Security and vulnerability reporting policy
- `CODE_OF_CONDUCT.md` - Community standards
- `.gitignore` - Language/package manager specific
- `.github/ISSUE_TEMPLATE/` - bug.yml, feature.yml, enhancement.yml, release.yml
- Package manifest (e.g., `package.json`, `composer.json`, `setup.py`, `Cargo.toml`)

**Recommended Files**:
- `API.md` - Detailed API documentation
- `MIGRATION.md` - Breaking changes and migration guides
- `docs/adr/` - Architecture Decision Records
- `.github/workflows/test.yml` - Automated testing
- `.github/workflows/publish.yml` - Package publishing
- `.github/PULL_REQUEST_TEMPLATE.md` - PR template
- `.github/CODEOWNERS` - Code ownership
- `.editorconfig` - Editor settings
- `.gitattributes` - Git attributes
- `SUPPORT.md` - Support information
- `examples/` - Usage examples
- `UPGRADING.md` - Version upgrade guide

**Optional Files**:
- `.github/FUNDING.yml` - Sponsorship information
- `.github/dependabot.yml` - Dependency automation
- `AUTHORS.md` - Package authors
- `CONTRIBUTORS.md` - Contributors list
- `BENCHMARKS.md` - Performance benchmarks
- `COMPARISON.md` - Comparison with alternatives
- `FAQ.md` - Frequently asked questions
- `COMPATIBILITY.md` - Version compatibility matrix

**Package-Specific**:
- API documentation
- Version compatibility
- Installation guide
- Dependency management
- Examples directory

**Metadata**:
```json
{
  "name": "package.template",
  "template": "repository.template",
  "parent": "template.topic",
  "level": 1,
  "is_template": true
}
```

**Validation**:
- README documents installation method
- API documentation complete
- CHANGELOG tracks versions (Keep a Changelog format)
- All public functions documented
- Package manifest present and valid

---

### 1.7. scaffold.template

**Purpose**: Boilerplate generators, project starters, code templates.

**Inherits From**: `repository.template`

**Required Files**:
- `README.md` - Scaffold overview, installation, usage guide
- `LICENSE` - License
- `CONTRIBUTING.md` - Contribution guidelines
- `CHANGELOG.md` - Scaffold versions and updates
- `CODE_OF_CONDUCT.md` - Community standards
- `USAGE.md` - Detailed usage examples
- `STRUCTURE.md` - Generated project structure documentation
- `TEMPLATES.md` - Available templates and variants
- `.gitignore` - Standard patterns

**Recommended Files**:
- `CUSTOMIZATION.md` - How to customize generated projects
- `EXAMPLES.md` - Real-world usage examples
- `.github/ISSUE_TEMPLATE/` - bug.yml, feature.yml, improvement.yml
- `.github/workflows/test.yml` - Test scaffold generation
- `.editorconfig` - Editor configuration
- `.gitattributes` - Git attributes
- `FAQ.md` - Common questions
- `docs/` - Extended documentation

**Optional Files**:
- `COMPARISON.md` - Compare with similar scaffolds
- `MIGRATION.md` - Migrating from other scaffolds
- `AUTHORS.md` - Scaffold creators
- `.github/FUNDING.yml` - Sponsorship information
- `ROADMAP.md` - Future features

**Scaffold-Specific**:
- How to generate projects
- Configuration options
- Generated file structure explanation
- Best practices for using scaffold
- Customization guide

**Metadata**:
```json
{
  "name": "scaffold.template",
  "template": "repository.template",
  "parent": "template.topic",
  "level": 1,
  "is_template": true
}
```

**Validation**:
- README includes usage examples
- USAGE.md documents all scaffold options
- STRUCTURE.md explains generated layout
- Generator is functional
- TEMPLATES.md lists all available templates

---

### 1.8. org.template

**Purpose**: Organization-level repositories, governance, shared resources.

**Inherits From**: `repository.template`

**Required Files**:
- `README.md` - Organization overview, governance structure
- `LICENSE` - License
- `CONTRIBUTING.md` - Organizational contribution guidelines
- `CHANGELOG.md` - Organization evolution
- `GOVERNANCE.md` - Roles, decision-making, policies
- `CODE_OF_CONDUCT.md` - Community standards
- `SECURITY.md` - Organization-wide security policy
- `.gitignore` - Standard patterns

**Recommended Files**:
- `MEMBERSHIP.md` - How to become a member
- `ROLES.md` - Detailed role descriptions
- `DECISION_MAKING.md` - Decision process documentation
- `COMMUNICATION.md` - Communication channels and protocols
- `SUPPORT.md` - Support structure and resources
- `.github/FUNDING.yml` - Organization funding
- `.github/ISSUE_TEMPLATE/` - policy.yml, governance.yml, membership.yml
- `.editorconfig` - Editor configuration
- `.gitattributes` - Git attributes

**Optional Files**:
- `TEAM.md` - Team structure and members
- `RESOURCES.md` - Shared organization resources
- `BRANDING.md` - Brand guidelines
- `STYLE_GUIDE.md` - Organizational style guide
- `AUTHORS.md` - Organization founders
- `PARTNERS.md` - Partnership information
- `ROADMAP.md` - Organizational roadmap

**Org-Specific**:
- Governance structure and roles
- Decision-making processes
- Policy documentation
- Team structures
- Community guidelines
- Membership criteria

**Metadata**:
```json
{
  "name": "org.template",
  "template": "repository.template",
  "parent": "template.topic",
  "level": 1,
  "is_template": true
}
```

**Validation**:
- GOVERNANCE.md documents decision process
- CODE_OF_CONDUCT.md present
- README explains organizational structure
- Policies are clearly documented
- Membership process defined (if applicable)

---

### 2.1. typescript_app.template

**Purpose**: TypeScript/Node.js applications with web/CLI capabilities.

**Inherits From**: `app.template`

**Additional Required Files** (beyond app.template):
- `package.json` - Project metadata and dependencies
- `tsconfig.json` - TypeScript configuration
- `.eslintrc.json` or `eslint.config.js` - Linting configuration
- `src/` - Source code directory structure
- `dist/` or `build/` - Compiled output
- `.nvmrc` or `.node-version` - Node version specification

**Recommended Files**:
- `docs/adr/` - Architecture decisions
- `.github/workflows/test.yml` - CI pipeline
- `.github/workflows/release.yml` - Release automation
- `.editorconfig` - Editor consistency
- `ARCHITECTURE.md` - System design documentation
- `.prettierrc` - Code formatting rules
- `jest.config.js` or `vitest.config.ts` - Test configuration

**Optional Files**:
- `API.md` - API documentation (if backend)
- `PERFORMANCE.md` - Performance benchmarks
- `DEBUGGING.md` - Debugging guide
- `.vscode/` - VSCode workspace settings
- `docker-compose.yml` - Local development setup

**TypeScript-Specific**:
- Build configuration
- Linting and formatting rules
- Test setup (Jest, Vitest, etc.)
- TypeScript strict mode configuration
- Type definitions for dependencies

**Metadata**:
```json
{
  "name": "typescript_app.template",
  "template": "app.template",
  "parent": "template.topic",
  "level": 2,
  "is_template": true,
  "language": "TypeScript"
}
```

**Validation**:
- Inherits app.template validation
- TypeScript compiles successfully (tsc --noEmit passes)
- Linting passes (eslint)
- Package.json has proper structure
- All dependencies have type definitions

---

### 2.2. laravel_app.template

**Purpose**: PHP Laravel applications.

**Inherits From**: `app.template`

**Additional Required Files** (beyond app.template):
- `composer.json` - PHP dependencies
- `.env.example` - Environment template with all variables documented
- `config/` - Application configuration
- `app/` - Application code
- `routes/` - API/web routes
- `database/` - Migrations, seeds, factories
- `phpunit.xml` - Testing configuration
- `.php-cs-fixer.php` or `pint.json` - Code style configuration

**Recommended Files**:
- `docs/adr/` - Architecture decisions
- `DEPLOYMENT.md` - Deployment instructions
- `.github/workflows/tests.yml` - CI pipeline
- `ARCHITECTURE.md` - Application architecture
- `API_DOCUMENTATION.md` - API reference (if API app)
- `.editorconfig` - Editor consistency
- `storage/` - Application storage structure

**Optional Files**:
- `docker-compose.yml` - Local development with Docker
- `PERFORMANCE.md` - Performance optimization
- `MONITORING.md` - Application monitoring guide
- `.vscode/` - VSCode settings
- `docs/postman/` - API testing collections

**Laravel-Specific**:
- Composer configuration
- .env management
- Database migrations structure
- Route organization
- Middleware setup
- Model-View-Controller structure
- Service providers
- Artisan commands

**Metadata**:
```json
{
  "name": "laravel_app.template",
  "template": "app.template",
  "parent": "template.topic",
  "level": 2,
  "is_template": true,
  "language": "PHP",
  "framework": "Laravel"
}
```

**Validation**:
- Inherits app.template validation
- Composer dependencies install successfully
- Laravel Artisan commands work
- Environment variables documented in .env.example
- Database migrations run without errors
- PHPUnit tests pass

---

### 2.3. docker_scaffold.template

**Purpose**: Docker-based project scaffolding.

**Inherits From**: `scaffold.template`

**Additional Required Files** (beyond scaffold.template):
- `Dockerfile` - Container configuration
- `docker-compose.yml` - Multi-container orchestration (dev)
- `.dockerignore` - Docker build exclusions
- `docker/` - Supporting scripts and configs
- `Makefile` - Common commands (build, run, test)

**Recommended Files**:
- `docker-compose.prod.yml` - Production configuration
- `DEPLOYMENT.md` - Container deployment guide
- `MONITORING.md` - Monitoring and observability
- `.env.example` - Environment variables template
- `docs/docker/` - Docker-specific documentation
- `scripts/` - Utility scripts for docker operations

**Optional Files**:
- `docker-compose.test.yml` - Testing configuration
- `TROUBLESHOOTING.md` - Docker-specific troubleshooting
- `PERFORMANCE.md` - Container performance optimization
- `.github/workflows/docker-build.yml` - Docker image CI/CD
- `healthcheck.sh` - Container health check script

**Docker-Specific**:
- Multi-stage build examples
- Development vs production configurations
- Health checks
- Environment variables documentation
- Volume management
- Network configuration
- Container security best practices

**Metadata**:
```json
{
  "name": "docker_scaffold.template",
  "template": "scaffold.template",
  "parent": "template.topic",
  "level": 2,
  "is_template": true,
  "technology": "Docker"
}
```

**Validation**:
- Inherits scaffold.template validation
- Dockerfile builds successfully
- docker-compose.yml is valid
- Containers start and pass health checks
- Environment variables documented
- Volumes and networks properly configured

---

### 2.4. laravel_docker_scaffold.template

**Purpose**: Laravel applications with Docker containerization.

**Inherits From**: `scaffold.template` (or combines `laravel_app.template` + `docker_scaffold.template`)

**Combines**:
- Laravel application structure
- Docker containerization
- Multi-container setup (PHP, MySQL, Redis, Nginx, etc.)

**Additional Required Files** (beyond scaffold.template):
- All Laravel-specific files from `laravel_app.template`
- All Docker-specific files from `docker_scaffold.template`
- `docker-compose.yml` configured for Laravel stack
- `docker-compose.dev.yml` - Development overrides
- Database initialization scripts
- `Makefile` - Common Laravel + Docker commands
- `.env.docker` - Docker-specific environment template

**Recommended Files**:
- `DEPLOYMENT.md` - Full stack deployment guide
- `ARCHITECTURE.md` - System architecture with containers
- `MONITORING.md` - Logging and monitoring setup
- `docs/docker/` - Docker-specific documentation
- `.github/workflows/docker.yml` - Docker-based CI/CD
- `healthcheck.php` - Laravel health check endpoint

**Optional Files**:
- `docker-compose.prod.yml` - Production configuration
- `docker-compose.test.yml` - Testing environment
- `PERFORMANCE.md` - Performance tuning for containers
- `SCALING.md` - Horizontal scaling guide
- `backup-restore.sh` - Database backup/restore scripts

**Laravel + Docker Specific**:
- PHP-FPM configuration
- Nginx configuration for Laravel
- Supervisor configuration for queues
- Redis for caching/sessions
- MySQL/PostgreSQL setup
- Volume management for storage
- Queue worker containers
- Scheduler container

**Metadata**:
```json
{
  "name": "laravel_docker_scaffold.template",
  "template": "scaffold.template",
  "parent": "template.topic",
  "level": 2,
  "is_template": true,
  "framework": "Laravel",
  "technology": "Docker"
}
```

**Validation**:
- Inherits scaffold.template validation
- Inherits Laravel validation (Artisan commands, migrations)
- Docker compose brings up full Laravel stack
- Database migrations run successfully in container
- Queue workers functional
- All services healthy (PHP-FPM, Nginx, MySQL, Redis)

---

## .chimera-lab/ Structure

Every repository (template or not) has `.chimera-lab/` directory with:

### .chimera-lab/meta.json

```json
{
  "name": "repository-name",
  "description": "Brief description",
  "template": "template-name.template",    // Which template this repo uses
  "parent": "topic-name.topic",            // Parent topic/organization
  "level": 1,                              // Hierarchy level
  "is_template": false,                    // True if this is a template
  "created_at": "2025-01-01",
  "version": "1.0.0",
  "status": "active"                       // active, archived, deprecated
}
```

For templates:
```json
{
  "name": "app.template",
  "template": null,                        // Templates don't use other templates
  "parent": "template.topic",
  "level": 1,
  "is_template": true,
  "created_at": "2025-01-01"
}
```

### .chimera-lab/.template (Submodule)

Points to the template this repository uses:

```bash
# For child repositories
git submodule add https://github.com/chimera-lab/repository.template.git .chimera-lab/.template

# For Level 1 templates
git submodule add https://github.com/chimera-lab/repository.template.git .chimera-lab/.template

# For Level 2 templates (e.g., typescript_app.template)
git submodule add https://github.com/chimera-lab/app.template.git .chimera-lab/.template
```

### .chimera-lab/settings.json

Default labels, milestones, and settings:

```json
{
  "labels": [
    {
      "name": "type:bug",
      "color": "d73a49",
      "description": "Bug reports"
    },
    {
      "name": "type:feature",
      "color": "a2eeef",
      "description": "New features"
    },
    {
      "name": "priority:high",
      "color": "ff6b6b",
      "description": "High priority"
    }
  ],
  "milestones": [
    {
      "title": "v1.0.0",
      "description": "Initial release",
      "due_date": "2025-12-31"
    }
  ]
}
```

### .chimera-lab/issues.json

Issue template definitions:

```json
{
  "templates": [
    {
      "name": "bug",
      "title_template": "[BUG] Short description",
      "body_template": "### Description\n...",
      "labels": ["type:bug"],
      "assignees": []
    },
    {
      "name": "feature",
      "title_template": "[FEATURE] Short description",
      "body_template": "### Description\n...",
      "labels": ["type:feature"]
    }
  ]
}
```

### .chimera-lab/milestones.json

Milestone definitions:

```json
{
  "milestones": [
    {
      "title": "v1.0.0",
      "description": "Initial release",
      "due_date": "2025-12-31",
      "state": "open"
    },
    {
      "title": "v1.1.0",
      "description": "First minor release",
      "due_date": "2026-03-31",
      "state": "open"
    }
  ]
}
```

---

## Inheritance and Updates

### Update Flow (Top-Down)

1. Update made to `repository.template`
2. All Level 1 templates updated via `cmr repo sync`
3. All Level 2 templates updated via `cmr repo sync`
4. All child repositories updated via `cmr repo sync`

### Update Command

```bash
# Update single repository
cmr repo sync /path/to/repo --execute

# Update all repos using template
cmr template update app.template --all --execute

# Update templates in cascading order
cmr template update --cascade --execute
```

---

## CLI Validation Rules

### cmr docs check

Validates:
- README.md exists and has proper structure
- Required markdown files present
- Links are valid (internal and external)
- Markdown syntax is correct
- Headings follow hierarchy
- Code blocks have language specified

### cmr repo setup

Actions:
- Detects template from git origin or `.chimera-lab/.template`
- Saves template reference to `.chimera-lab/meta.json`
- Validates markdown structure against template
- Checks all required files exist
- Reports missing files and validation errors

### cmr repo sync

Actions:
- Compares repo structure with template
- Lists files to be added/updated/removed
- --execute applies changes
- --overwrite forces updates even if files exist
- Preserves local customizations

---

## Implementation Order

1. **repository.template** (BASE) - foundation for all
2. **topic.template** - most common template type
3. **overview.template** - common for learning materials
4. **app.template** - common for applications
5. **diy.template** - specific use case
6. **project.template** - specific use case
7. **package.template** - specific use case
8. **scaffold.template** - specific use case
9. **org.template** - specific use case
10. **typescript_app.template** - inherits from app.template
11. **laravel_app.template** - inherits from app.template
12. **docker_scaffold.template** - inherits from scaffold.template
13. **laravel_docker_scaffold.template** - inherits from scaffold.template

---

## Success Criteria

✅ All templates have required documentation files  
✅ All templates have valid .chimera-lab/ structure  
✅ All templates pass `cmr docs check`  
✅ All templates pass `cmr repo setup`  
✅ Issue templates are defined and customized per type  
✅ Inheritance hierarchy is properly configured  
✅ Submodules are correctly established  
✅ CLI can validate all templates successfully  
✅ Documentation is complete and accurate  

