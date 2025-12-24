# Chimera Lab Organization

Multi-repository organization for knowledge, tools, and projects across multiple domains.

## About

**chimera-lab.org** is a structured multi-repository organization designed to manage knowledge, applications, and projects in a modular, reusable way. The organization uses:

- **Topic-based hierarchy** - Knowledge organized by domain
- **Standardized structure** - Templates for consistency
- **Super-repository pattern** - Git submodules for coordinated management  
- **Metadata-driven governance** - Centralized configuration
- **AI agent system** - Automation for coordination and management

### Core Philosophy

Maintain organizational structure while enabling:
- Clear separation of concerns
- Easy sharing and reuse
- Consistency across repositories
- Scalable growth
- Efficient coordination

---

## Quick Navigation

### Key Documentation

1. **[ORGANIZATION_STRUCTURE.md](./docs/ORGANIZATION_STRUCTURE.md)** - Complete overview of all topics and repositories
2. **[NAMING_CONVENTIONS.md](./docs/NAMING_CONVENTIONS.md)** - Repository naming rules and suffixes
3. **[ORGANIZATION_MANAGEMENT.md](./docs/ORGANIZATION_MANAGEMENT.md)** - Operational procedures and workflows
4. **[PROJECT_COORDINATION.md](./docs/PROJECT_COORDINATION.md)** - Multi-project coordination framework
5. **[RULES.md](./RULES.md)** - Organization rules and standards

### For Contributors

- **Getting Started**: Review [NAMING_CONVENTIONS.md](./docs/NAMING_CONVENTIONS.md) to understand repository types
- **Creating Repositories**: See [ORGANIZATION_MANAGEMENT.md](./docs/ORGANIZATION_MANAGEMENT.md#adding-repositories)
- **Using Templates**: Check [templates.knowledge.md](./knowledge/templates.knowledge.md)
- **Understanding Structure**: Read [ORGANIZATION_STRUCTURE.md](./docs/ORGANIZATION_STRUCTURE.md)

### For Project Managers

- **Feature Tracking**: [PROJECT_COORDINATION.md](./docs/PROJECT_COORDINATION.md) - Cross-repository features
- **Dependency Management**: [PROJECT_COORDINATION.md - Dependency Management](./docs/PROJECT_COORDINATION.md#dependency-management)
- **Release Coordination**: [PROJECT_COORDINATION.md - Release Coordination](./docs/PROJECT_COORDINATION.md#release-coordination)
- **Communication**: [PROJECT_COORDINATION.md - Communication Patterns](./docs/PROJECT_COORDINATION.md#communication-patterns)

### For Repository Managers

- **Template Management**: [create-template.prompt.md](./prompts/create-template.prompt.md), [apply-template.prompt.md](./prompts/apply-template.prompt.md), [update-template.prompt.md](./prompts/update-template.prompt.md)
- **Metadata Configuration**: [METADATA_CONFIGURATION.md](./docs/METADATA_CONFIGURATION.md)
- **Label Management**: [labels.json](./labels.json)
- **Submodule Workflow**: [ORGANIZATION_MANAGEMENT.md - Submodule Operations](./docs/ORGANIZATION_MANAGEMENT.md#submodule-workflow)

---

## Organization Structure

### Top-Level Topics

| Topic | Purpose | Examples |
|-------|---------|----------|
| **administration** | Admin tools and Linux/Windows management | Ansible, SSH, Supervisor |
| **art** | Creative assets and designs | Logos, artworks |
| **artificial-intelligence** | AI/ML resources and tools | OpenAI guides, embeddings |
| **automation** | Automation frameworks | CI/CD, workflows |
| **devops** | Infrastructure and DevOps | Docker, Kubernetes, deployment |
| **finance** | Financial tracking | Budget tools, crypto |
| **ideas** | Project proposals | Brainstorming, planning |
| **legal** | Legal documents and policies | Privacy, terms, licenses |
| **network** | Networking and protocols | Security, IoT, protocols |
| **operating-systems** | OS knowledge | Linux, Windows, components |
| **original** | Original implementations | CLI tool, original projects |
| **projects** | Main project portfolio | Blog, chat, store, website |
| **security** | Security practices | Network security, tools |
| **template** | Repository templates | Base, app, project, etc. |

### Repository Types

```
.topic     →  Knowledge organization (hierarchical)
.project   →  Dedicated projects (full applications)
.app       →  Applications/tools (executables)
.package   →  Libraries/packages (reusable code)
.scaffold  →  Boilerplates (code generators)
.template  →  GitHub templates (standardized structure)
.overview  →  Learning material (educational content)
.diy       →  DIY/hardware projects
```

Full guide: [NAMING_CONVENTIONS.md](./docs/NAMING_CONVENTIONS.md)

---

## Agent System

The organization uses AI agents for automation and coordination:

| Agent | Purpose | Responsibilities |
|-------|---------|------------------|
| **organization-manager** | Multi-repo orchestration | Structure integrity, templates, coordination |
| **project-manager** | Project lifecycle | Feature tracking, documentation, cross-repo coordination |
| **repository-manager** | Git/GitHub automation | Submodules, templates, metadata, labels |
| **python-architect** | Architecture design | Organization-wide patterns, consistency |
| **cli-developer** | Implementation | Python projects, CLI tools |
| **technical-writer** | Documentation | Organization docs, knowledge base |
| **prompt-engineer** | Prompt management | Agent coordination, task execution |

Agents are defined in [.github/agents/](./agents/)

### Prompts

Task-specific prompts for coordination:

- **work.prompt.md** - Start new organization work
- **plan-execution.prompt.md** - Plan multi-repo work
- **commit.prompt.md** - Super-repository commit conventions
- **create-template.prompt.md** - Create new template
- **apply-template.prompt.md** - Apply template to repository
- **update-template.prompt.md** - Update existing template
- **validate-template.prompt.md** - Validate repository structure

Located in [.github/prompts/](./prompts/)

---

## Knowledge Base

Concise, AI-optimized reference documentation:

| File | Purpose | Audience |
|------|---------|----------|
| **system.knowledge.md** | Organization architecture | AI agents, developers |
| **organization.knowledge.md** | Structure and concepts | AI agents, contributors |
| **templates.knowledge.md** | Template system | AI agents, template managers |
| **repository.knowledge.md** | Repository standards | AI agents, repository teams |
| **automation.knowledge.md** | Rules and automation | AI agents, architects |

Located in [.github/knowledge/](./knowledge/)

---

## Operational Workflows

### Creating a New Repository

1. **Plan** - Decide type (suffix) and location (topic)
2. **Select Template** - Choose appropriate base template
3. **Create** - Use GitHub "Use this template"
4. **Apply** - Follow [apply-template.prompt.md](./prompts/apply-template.prompt.md)
5. **Add Submodule** - If in topic, add to parent's submodules
6. **Document** - Update organization documentation

Details: [ORGANIZATION_MANAGEMENT.md](./docs/ORGANIZATION_MANAGEMENT.md#adding-repositories)

### Working Across Repositories

1. **Identify Dependencies** - What repos are affected?
2. **Create Master Issue** - Central tracking for feature
3. **Link Issues** - Create sub-issue in each affected repo
4. **Coordinate Timeline** - Plan release sequence
5. **Track Progress** - Update master issue regularly
6. **Release** - Coordinate releases

Details: [PROJECT_COORDINATION.md](./docs/PROJECT_COORDINATION.md#cross-repository-features)

### Updating Templates

1. **Update** - Make changes to template repository
2. **Version** - Increment version number
3. **Apply** - Roll out to affected repositories
4. **Document** - Update knowledge base and docs
5. **Notify** - Announce changes

Details: [update-template.prompt.md](./prompts/update-template.prompt.md)

---

## Rules and Standards

### Naming Convention

**Format**: `<identifier>.<suffix>`

**Examples**:
- `chimera-lab-cli.app` - CLI application
- `chimera-lab-blog.project` - Blog project
- `devops.topic` - DevOps knowledge
- `docker.overview` - Docker learning material

Full guide: [NAMING_CONVENTIONS.md](./docs/NAMING_CONVENTIONS.md)

### Repository Requirements

Every repository must include:

- ✅ **README.md** - Project overview
- ✅ **LICENSE** - MIT or appropriate
- ✅ **.gitignore** - Version control exclusions
- ✅ **.github/CONTRIBUTING.md** - How to contribute
- ✅ **.github/workflows/** - CI/CD pipelines
- ✅ **.chimera-lab/meta.json** - Repository metadata

### Metadata Structure

```json
{
  "name": "repository-name",
  "type": "app|project|package|etc",
  "description": "What this does",
  "language": "primary-language",
  "templates_applied": ["repository.template", "app.template"]
}
```

Full details: [METADATA_CONFIGURATION.md](./docs/METADATA_CONFIGURATION.md)

### Issues and Labels

Organization maintains centralized labels: [labels.json](./.github/labels.json)

Categories:
- **type:** - Issue type (bug, feature, docs, etc.)
- **priority:** - Priority level
- **scope:** - Affected scope (single-repo, cross-repo, org-wide)
- **status:** - Current status
- **effort:** - Effort estimate
- **area:** - Domain-specific

---

## Collaboration

### For Contributors

1. **Understand Structure** - Read [ORGANIZATION_STRUCTURE.md](./docs/ORGANIZATION_STRUCTURE.md)
2. **Check Naming Rules** - Follow [NAMING_CONVENTIONS.md](./docs/NAMING_CONVENTIONS.md)
3. **Review RULES** - Check [RULES.md](./RULES.md) for standards
4. **Find Your Project** - See [ORGANIZATION_STRUCTURE.md](./docs/ORGANIZATION_STRUCTURE.md)
5. **Submit PR** - Include clear description and reference issues

### For Project Leads

1. **Plan Timeline** - Use [PROJECT_COORDINATION.md](./docs/PROJECT_COORDINATION.md)
2. **Track Progress** - Create cross-repo issues if needed
3. **Coordinate Releases** - Plan release timeline
4. **Communicate** - Use GitHub issues and discussions
5. **Update Docs** - Keep documentation current

### For Architects

1. **Review Structure** - Ensure consistency
2. **Plan Templates** - Create type-specific templates
3. **Approve Changes** - Review architectural decisions
4. **Guide Growth** - Plan organization scaling
5. **Set Standards** - Define best practices

---

## Technology Stack

- **Git/GitHub** - Version control and collaboration
- **GitHub Actions** - CI/CD pipelines
- **GitHub Discussions** - Community communication
- **Markdown** - Documentation format
- **JSON** - Metadata and configuration
- **YAML** - Workflow definitions

### Languages/Frameworks

- **Python** - CLI tools, scripts, utilities
- **PHP/Laravel** - Web applications
- **TypeScript/JavaScript** - Frontend and full-stack
- **Docker** - Containerization and infrastructure
- **Ansible** - Infrastructure as code

---

## Maintenance

### Regular Tasks

**Weekly**:
- Review new issues and PRs
- Update cross-repo progress
- Check CI/CD status

**Monthly**:
- Review milestones and releases
- Update dependencies
- Analyze metrics

**Quarterly**:
- Plan next quarter
- Review roadmap
- Architecture review

### Validation

Regularly validate with [validate-template.prompt.md](./prompts/validate-template.prompt.md):

```bash
# Check repository structure
# Verify metadata consistency
# Validate documentation
# Test workflows
```

---

## Resources

### Documentation
- [Complete Organization Structure](./docs/ORGANIZATION_STRUCTURE.md) - All topics and repos
- [Naming Conventions Guide](./docs/NAMING_CONVENTIONS.md) - Suffix definitions and rules
- [Organization Management](./docs/ORGANIZATION_MANAGEMENT.md) - Operational procedures
- [Project Coordination](./docs/PROJECT_COORDINATION.md) - Multi-repo coordination
- [Metadata Configuration](./docs/METADATA_CONFIGURATION.md) - Metadata system
- [Organization Rules](./RULES.md) - Rules and standards

### Knowledge Base
- [System Knowledge](./knowledge/system.knowledge.md) - Architecture overview
- [Organization Knowledge](./knowledge/organization.knowledge.md) - Concepts
- [Templates Knowledge](./knowledge/templates.knowledge.md) - Template system
- [Repository Knowledge](./knowledge/repository.knowledge.md) - Repository standards
- [Automation Knowledge](./knowledge/automation.knowledge.md) - Rules and automation

### Agents
- [Organization Manager](./agents/organization-manager.agent.md) - Multi-repo orchestration
- [Project Manager](./agents/project-manager.agent.md) - Project lifecycle
- [Repository Manager](./agents/repository-manager.agent.md) - Git automation
- [Technical Writer](./agents/technical-writer.agent.md) - Documentation
- [Python Architect](./agents/python-architect.agent.md) - Architecture
- [CLI Developer](./agents/cli-developer.agent.md) - Development
- [Prompt Engineer](./agents/prompt-engineer.agent.md) - Prompt management

### Prompts
- [Work Prompt](./prompts/work.prompt.md) - Start work
- [Plan Execution](./prompts/plan-execution.prompt.md) - Plan tasks
- [Commit Prompt](./prompts/commit.prompt.md) - Git commits
- [Create Template](./prompts/create-template.prompt.md) - Create template
- [Apply Template](./prompts/apply-template.prompt.md) - Apply template
- [Update Template](./prompts/update-template.prompt.md) - Update template
- [Validate Template](./prompts/validate-template.prompt.md) - Validate structure

---

## Getting Help

### Questions?

- **About organization structure** → See [ORGANIZATION_STRUCTURE.md](./docs/ORGANIZATION_STRUCTURE.md)
- **About naming repositories** → Check [NAMING_CONVENTIONS.md](./docs/NAMING_CONVENTIONS.md)
- **About creating repositories** → Review [ORGANIZATION_MANAGEMENT.md](./docs/ORGANIZATION_MANAGEMENT.md)
- **About multi-repo coordination** → Read [PROJECT_COORDINATION.md](./docs/PROJECT_COORDINATION.md)
- **About rules** → Consult [RULES.md](./RULES.md)

### Issues and Feedback

- **Report issue** - Create GitHub issue with clear description
- **Request feature** - Use "Feature Request" issue template
- **Suggest improvement** - Start GitHub discussion

---

## License

All repositories in chimera-lab.org are licensed under their respective licenses (typically MIT).  
See [legal.topic](../legal.topic/) for complete legal documentation.

---

## Contact

- **Email**: contact@chimera-lab.org
- **Website**: https://chimera-lab.org
- **Repository**: https://github.com/chimera-lab/chimera-lab.org

---

**Last Updated**: January 2024  
**Version**: 1.0.0

See [.chimera-lab/meta.json](./.chimera-lab/meta.json) for organization metadata.
