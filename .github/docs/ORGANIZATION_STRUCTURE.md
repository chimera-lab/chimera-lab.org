# Organization Structure

Complete overview of the chimera-lab.org organization structure, including topics, repositories, and coordination patterns.

## Organization Overview

**chimera-lab.org** is a multi-repository organization designed to manage knowledge, tools, and projects across multiple domains. The organization uses a topic-based hierarchical structure with standardized naming conventions and templates.

### Key Characteristics

- **Multi-repository management**: 50+ repositories organized hierarchically
- **Topic-based organization**: Knowledge grouped by domain
- **Template system**: Standardized repository structures
- **Super-repository pattern**: Git submodules for coordinated management
- **Metadata-driven**: Centralized configuration and consistency

---

## Top-Level Topics

The organization is divided into these primary knowledge domains:

### administration.topic
**Purpose**: Administrative tools and Linux/Windows system administration knowledge

**Contents**:
- `administration-tools.topic/` - Ansible, SSH administration
- `linux-administration.topic/` - Linux disk management, Supervisor
- `windows-administration.topic/` - Windows administration

**Use Case**: For system administrators, DevOps engineers, infrastructure teams

**Key Repositories**:
- `ansible.overview` - Ansible automation guide
- `openssh.overview` - SSH administration guide
- `supervisor.overview` - Process management guide

---

### art.topic
**Purpose**: Creative and visual assets for the organization

**Contents**:
- `logo/` - Organization logos in multiple styles
  - `base/` - Base logo variant
  - `cartoon/` - Cartoon logo variant
  - `novem/` - Novem style variant
  - `shade/` - Shaded variant

**Use Case**: Branding, visual identity, logo usage

---

### artificial-intelligence.topic
**Purpose**: AI/ML tools and frameworks

**Contents**:
- `open-ai.overview/` - OpenAI API guide and examples
  - `completitions.py` - Text completion examples
  - `embeddings.py` - Embedding examples
  - `image.py` - Image generation examples
  - `docs/` - Documentation
  - `imgs/` - Example images

**Use Case**: AI/ML engineers, data scientists, automation developers

---

### automation.topic
**Purpose**: Automation frameworks and tools

**Contents**: (Currently empty or minimal)

**Use Case**: DevOps, CI/CD, workflow automation

---

### contributions.topic
**Purpose**: Contribution guidelines and coordination

**Contents**: (Expected: contribution guidelines, review process, standards)

**Use Case**: All contributors, code reviewers

---

### devops.topic
**Purpose**: DevOps, infrastructure, and deployment

**Contents**:
- `docker.topic/` - Docker and containerization
  - `docker-scaffold.topic/` - Docker boilerplate templates
  - `docker.overview/` - Docker learning materials
- Infrastructure tools and practices

**Key Repositories**:
- `chimera-lab-docker-stack.project` - Docker environment setup
- `docker.overview` - Docker guide and tutorials

**Use Case**: DevOps engineers, infrastructure teams, container specialists

---

### finance.topic
**Purpose**: Financial tools and tracking

**Contents**:
- `budget.js` - Budget tracking tool
- `index.html` - Finance dashboard
- `cryptocurrency.topic/` - Cryptocurrency and digital assets
  - `crypto/` - Crypto tools and guides

**Use Case**: Financial analysts, budget tracking, crypto enthusiasts

---

### ideas.topic
**Purpose**: Project ideas and proposals

**Contents**:
- `desktop_sorter.md` - Desktop organization tool idea
- `emojijoiner.md` - Emoji tool idea
- `homepage_builder.md` - Homepage builder idea
- `onesite.md` - One-site platform idea

**Use Case**: Innovation, planning, proposal development

---

### legal.topic
**Purpose**: Legal documents and policies

**Contents**:
- `README.md` - Legal documentation index
- `en/` - English language legal documents
  - `LEGAL.md` - Legal notice
  - `PRIVACY.md` - Privacy policy
  - `TERMS.md` - Terms of service
- `pt/` - Portuguese language legal documents
  - `COMPLAINT.md` - Complaint process
  - `CONTACT.md` - Contact information
  - `COOKIES.md` - Cookie policy
  - `COPYRIGHT.md` - Copyright notice
  - `LAW.md` - Law information
  - `LEGAL.md` - Legal notice (PT)

**Use Case**: Legal compliance, privacy, terms documentation

---

### network.topic
**Purpose**: Networking, protocols, and security

**Contents**:
- `network-protocols.topic/` - Network protocol documentation
- `network-security.topic/` - Network security and hardening

**Use Case**: Network engineers, security professionals

---

### operating-systems.topic
**Purpose**: Operating system knowledge and tools

**Contents**:
- `desktop-operating-systems.topic/` - Desktop OS (Windows, macOS, Linux)
- `operating-system-components.topic/` - OS internals and components

**Use Case**: System administrators, OS developers, IT professionals

---

### original.topic
**Purpose**: Original projects and early implementations

**Contents**:
- `chimera-lab-cli.app` - Main CLI management tool
- `chimera-lab-laravel.package` - Laravel utilities package
- `organizer.project` - Organization tool
- `php-to-plantuml_vscode.app` - VS Code extension
- `wordpress-plugin-abstraction.scaffold` - WordPress boilerplate

**Use Case**: Original implementations, legacy projects, starting reference

---

### partnership.topic
**Purpose**: Partnership agreements and collaborations

**Contents**: (For partnership documents and agreements)

**Use Case**: Business development, partnerships

---

### personal.topic
**Purpose**: Personal projects and experiments

**Contents**: (For personal initiatives)

**Use Case**: Individual contributors, personal development

---

### projects.topic
**Purpose**: Main project portfolio and implementations

**Contents**: (15+ projects)
- `chimera-lab-advertisement.project` - Advertisement system
- `chimera-lab-blog.project` - Blog application
- `chimera-lab-store.project` - E-commerce store
- `chimera-lab-archives.project` - Content archives
- `chimera-lab-chat.project` - Chat application
- `chimera-lab-cli-website.project` - CLI documentation site
- `chimera-lab-cli.project` - CLI tool project
- `chimera-lab-compliance.project` - Compliance tracking
- `chimera-lab-docker-stack.project` - Docker infrastructure
- `chimera-lab-enterprise.project` - Enterprise solutions
- `chimera-lab-infra.project` - Infrastructure as code
- `chimera-lab-organization.project` - Organization management
- `chimera-lab-website.project` - Main website
- `chimera-lab-workspace.project` - Workspace management
- `chimera-lab.project` - Primary project

**Use Case**: Production applications, main products

---

### reports/
**Purpose**: Organization-wide reports and metrics

**Contents**:
- `service-readiness.md` - Service readiness report

**Use Case**: Monitoring, metrics, dashboards

---

### security.topic
**Purpose**: Security practices, tools, and knowledge

**Contents**:
- `network-security.topic/` - Network security
- Security best practices and standards

**Use Case**: Security engineers, architects, compliance

---

### template.topic
**Purpose**: Repository templates for consistent structure

**Contents**: (11+ templates)
- `app.template` - Application template
- `diy.template` - DIY project template
- `docker_scaffold.template` - Docker boilerplate
- `laravel_app.template` - Laravel application
- `laravel_docker_scaffold.template` - Laravel + Docker
- `org.template` - Organization template
- `overview.template` - Overview/learning template
- `package.template` - Library/package template
- `project.template` - Project template
- `repository.template` - Base repository template (inherited by all)
- `scaffold.template` - Boilerplate generator template
- `topic.template` - Topic template
- `typescript_app.template` - TypeScript application

**Use Case**: Repository creation, consistency, standardization

---

## Repository Type Summary

### By Suffix

**`.topic`** (Knowledge organization):
- `devops.topic`, `security.topic`, `network.topic`, etc.
- Contains: Sub-topics, projects, overviews
- Structure: Hierarchical organization of related content

**`.project`** (Dedicated projects):
- `chimera-lab-blog.project`, `chimera-lab-chat.project`, etc.
- Contains: Full application code, tests, documentation
- Structure: Standard project layout with CI/CD

**`.app`** (Applications/tools):
- `chimera-lab-cli.app`, `php-to-plantuml_vscode.app`
- Contains: Executable or deployed application
- Structure: Application-specific with build config

**`.package`** (Libraries):
- `chimera-lab-laravel.package`
- Contains: Reusable code library
- Structure: Package with version management

**`.scaffold`** (Boilerplates):
- `wordpress-plugin-abstraction.scaffold`, `docker-compose.scaffold`
- Contains: Template for project generation
- Structure: Boilerplate directory structure

**`.template`** (GitHub templates):
- All files in `template.topic/`
- Contains: Base repository structure
- Structure: Template inheritance hierarchy

**`.overview`** (Learning material):
- `docker.overview`, `kubernetes.overview`
- Contains: Educational content and guides
- Structure: Documentation with examples

**`.diy`** (DIY projects):
- Hardware and maker projects
- Contains: Code, schematics, setup guides
- Structure: Documentation-heavy with code components

---

## Directory Structure

### Root Organization Level

```
chimera-lab.org/
├── administration.topic/        # Administrative tools and knowledge
├── art.topic/                   # Creative assets
├── artificial-intelligence.topic/ # AI/ML resources
├── automation.topic/            # Automation frameworks
├── contributions.topic/         # Contribution guidelines
├── devops.topic/                # DevOps and infrastructure
├── finance.topic/               # Financial tools
├── ideas.topic/                 # Project ideas
├── legal.topic/                 # Legal documents
├── network.topic/               # Networking and security
├── operating-systems.topic/     # OS knowledge
├── original.topic/              # Original implementations
├── partnership.topic/           # Partnerships
├── personal.topic/              # Personal projects
├── projects.topic/              # Main projects
├── reports/                     # Organization reports
├── security.topic/              # Security resources
├── template.topic/              # Repository templates
├── .github/                     # Organization configuration
│   ├── agents/                  # AI agent definitions
│   ├── knowledge/               # Knowledge base
│   ├── prompts/                 # Task prompts
│   ├── docs/                    # Organization documentation
│   ├── workflows/               # GitHub Actions
│   ├── labels.json              # Label definitions
│   └── RULES.md                 # Organization rules
└── README.md                    # Organization overview
```

### Topic Internal Structure

```
<topic-name>.topic/
├── README.md                    # Topic overview
├── .github/                     # Topic configuration
│   ├── .template/               # Applied GitHub template (submodule)
│   └── workflows/               # Topic-level workflows
├── .chimera-lab/                # Metadata
│   └── meta.json                # Topic metadata
├── <sub-topic>.topic/           # Nested sub-topics (optional)
├── <project>.project/           # Contained projects
├── <app>.app/                   # Contained applications
├── <overview>.overview/         # Learning materials
└── [other repositories]/
```

### Project Internal Structure

```
<project>.project/
├── README.md                    # Project overview
├── .github/
│   ├── .template/               # Applied template (submodule)
│   ├── workflows/               # CI/CD pipelines
│   ├── CONTRIBUTING.md
│   └── [issue/PR templates]
├── .chimera-lab/
│   ├── meta.json                # Project metadata
│   ├── issues.json              # Issue categories
│   └── milestones.json          # Release milestones
├── src/                         # Source code
├── tests/                       # Tests
├── docs/                        # Documentation
├── [language-config]            # package.json, requirements.txt, etc.
└── [project-specific]/
```

---

## Naming Conventions

### Repository Naming Pattern

**Format**: `<identifier>.<suffix>`

**Identifier**:
- Organization prefix: `chimera-lab-` (for official organization projects)
- Generic name: `<tool>-<purpose>` (for community or external tools)
- Domain specific: `<domain>` (for topics, overviews, DIY)

**Suffix** (required):
- `.app` - Application/tool
- `.project` - Dedicated project
- `.package` - Library/reusable code
- `.scaffold` - Boilerplate/generator
- `.template` - GitHub template
- `.topic` - Knowledge organization
- `.overview` - Learning material
- `.diy` - DIY/hardware project

### Examples

**Organization Projects**:
- `chimera-lab-cli.app` - CLI application
- `chimera-lab-blog.project` - Blog project
- `chimera-lab-laravel.package` - Laravel library

**Community/External**:
- `docker-compose.scaffold` - Docker boilerplate
- `laravel-app.template` - Laravel template

**Learning**:
- `docker.overview` - Docker guide
- `kubernetes.overview` - Kubernetes tutorial

**Topics**:
- `devops.topic` - DevOps domain
- `security.topic` - Security domain

---

## Repository Standards

### Essential Files

Every repository must include:

- **README.md** - Project overview and usage
- **LICENSE** - MIT or appropriate license
- **.gitignore** - Version control exclusions
- **.github/workflows/** - CI/CD pipelines
- **.github/CONTRIBUTING.md** - Contribution guidelines
- **.chimera-lab/meta.json** - Repository metadata

### Metadata Structure

```json
{
  "name": "repository-name",
  "type": "app|project|package|etc",
  "description": "What this repository does",
  "language": "primary-language",
  "templates_applied": ["repository.template", "app.template"]
}
```

### GitHub Configuration

- **Branch protection**: Enforce reviews, passing checks
- **Issue templates**: Bug reports, feature requests
- **PR templates**: Standard format for contributions
- **Workflows**: Automated testing and linting
- **Labels**: Issue categorization

---

## Template Hierarchy

All repositories inherit from `repository.template` and specialize based on type:

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

Each template adds type-specific structure and workflows.

---

## Coordination Patterns

### Cross-Repository Features

Features spanning multiple repositories:

1. Create master feature issue in central project
2. Create issue in each affected repository
3. Link issues for tracking
4. Update master issue with progress
5. Coordinate releases

**Example**: "OAuth support across applications"
- Master issue: central coordination
- Sub-issues: one per application
- Timeline: staggered or coordinated depending on dependencies

### Release Coordination

For major releases involving multiple repositories:

1. Plan release timeline (Q1, Q2, etc.)
2. Identify dependencies between repos
3. Coordinate release order
4. Tag releases simultaneously or sequentially
5. Update documentation

### Dependency Management

Document dependencies in each repository:

```
# dependencies.md

## External Dependencies
- chimera-lab-auth.package v2.0+ (authentication)
- chimera-lab-laravel.package v1.0+ (utilities)

## Services
- Redis v6.0+
- PostgreSQL v12+
```

---

## Maintenance

### Regular Tasks

**Daily**:
- Monitor CI/CD pipelines
- Review new issues
- Respond to PRs

**Weekly**:
- Review cross-repo progress
- Update milestones
- Identify blockers

**Monthly**:
- Release planning
- Dependency updates
- Documentation review

**Quarterly**:
- Roadmap review
- Architecture assessment
- Strategy planning

### Validation

Regularly validate:

- ✅ Repository structure matches template
- ✅ Metadata consistent and complete
- ✅ Documentation current
- ✅ Dependencies up to date
- ✅ Workflows functioning

---

## References

- [NAMING_CONVENTIONS.md](./NAMING_CONVENTIONS.md) - Complete naming guide
- [ORGANIZATION_MANAGEMENT.md](./ORGANIZATION_MANAGEMENT.md) - Operational procedures
- [PROJECT_COORDINATION.md](./PROJECT_COORDINATION.md) - Multi-project coordination
- [RULES.md](../.github/RULES.md) - Organization rules
- [templates.knowledge.md](../docs/knowledge/templates.knowledge.md) - Template system
- [organization.knowledge.md](../docs/knowledge/organization.knowledge.md) - Organization concepts
