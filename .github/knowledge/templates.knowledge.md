# Templates Knowledge

Template hierarchy, application, management, and usage patterns for chimera-lab.org repositories.

## Template Concept

GitHub repository templates provide reusable structure for new repositories. In chimera-lab.org:
- Templates stored in `template.topic/`
- Applied via GitHub template mechanism
- Maintained as submodule in `.github/.template/` of child repos
- Enable consistent structure across similar repositories

## Template Hierarchy

```
repository.template (base)          # Foundation for all repositories
├── topic.template                  # Knowledge topics
├── overview.template               # Study material overviews
├── diy.template                    # DIY/hardware projects
├── app.template                    # Applications
│   ├── typescript_app.template     # TypeScript apps
│   └── laravel_app.template        # Laravel apps
├── project.template                # Dedicated projects
├── package.template                # Libraries/packages
├── scaffold.template               # Boilerplate generators
│   └── docker_scaffold.template    # Docker scaffolds
└── org.template                    # Organization structure
```

## Template Structure

Each template repository contains:

```
template-name.template/
├── .github/                        # GitHub configuration
│   ├── README.md                   # Template documentation
│   ├── CONTRIBUTING.md             # Contribution guidelines
│   ├── ISSUE_TEMPLATE/             # Issue templates
│   └── workflows/                  # CI/CD workflows
├── .gitignore                      # Ignore patterns
├── LICENSE                         # License file
├── README.md                       # Repository README template
└── [template-specific files...]    # Structure specific to type
```

## Template Application

### Via GitHub Web Interface
1. Navigate to template repository on GitHub
2. Click "Use this template"
3. Create new repository from template
4. Clone and add as submodule to organization

### Via GitHub CLI
```bash
gh repo create org/new-repo --template org/template-name.template --public
cd path/to/organization
git submodule add https://github.com/org/new-repo.git location/new-repo.suffix
```

### Via chimera-lab-cli
```bash
cmr repo create --name new-repo --template app.template --topic devops.topic
```

## Template Metadata

### In Template Repository
Templates have `is_template: true` in `.chimera-lab/meta.json`:

```json
{
  "name": "app.template",
  "template": "repository.template",
  "parent": "template.topic",
  "level": 2,
  "is_template": true
}
```

### In Child Repository
Child repos reference their template:

```json
{
  "name": "my-app.app",
  "template": "app.template",
  "parent": "original.topic",
  "level": 2,
  "is_template": false
}
```

## Template Inheritance

Templates inherit from parent templates:
- `repository.template` provides base structure (README, LICENSE, .gitignore)
- Specialized templates extend base (add CI/CD, language-specific configs)
- Child repos can further customize without breaking template link

## Template Updates

### Workflow
1. Update template repository
2. Identify affected child repositories
3. Coordinate update schedule (via Project Manager)
4. Apply updates to each child (via Repository Manager)
5. Test and validate changes
6. Document update in changelog

### Using Utility Scripts
```bash
# Single repository
.chimera-lab/utils/rebuild-repo-with-template.sh <repo-name>

# Multiple repositories
.chimera-lab/utils/bulk-rebuild-repo-with-template.sh
```

### Via chimera-lab-cli
```bash
# List repos using template
cmr template repos --name app.template

# Update specific repo
cmr template update --repo my-app.app

# Update all repos using template
cmr template update --template app.template --all
```

## Template Types

### `repository.template` - Base Template
- Foundation for all other templates
- Provides: README.md, LICENSE, .gitignore, CONTRIBUTING.md
- All templates inherit from this

### `topic.template` - Knowledge Topics
- Structure for organizing related repositories
- Includes: Topic README, navigation structure
- Example: `devops.topic`, `security.topic`

### `overview.template` - Study Material
- Documentation and learning resources
- Includes: Chapter structure, examples directory
- Example: `docker.overview`, `kubernetes.overview`

### `project.template` - Dedicated Projects
- Full-featured projects with own lifecycle
- Includes: CI/CD pipelines, issue templates, release workflow
- Example: `chimera-lab-blog.project`

### `app.template` - Applications
- End-user facing applications
- Includes: Build scripts, deployment configs, user docs
- Example: `chimera-lab-cli.app`

### `package.template` - Libraries
- Reusable code packages
- Includes: Package manifest, documentation, testing setup
- Example: `chimera-lab-laravel.package`

### `scaffold.template` - Boilerplates
- Code generation templates
- Includes: Generator scripts, template files
- Example: `wordpress-plugin-abstraction.scaffold`

### `org.template` - Organizations
- Super-repository structure
- Includes: `.chimera-lab/` setup, submodule conventions
- Example: Applied to organization root

## Template Selection Guide

| Repository Type | Use Template | When |
|----------------|--------------|------|
| Knowledge topic | `topic.template` | Organizing related repos/concepts |
| Study material | `overview.template` | Documentation, tutorials, guides |
| Full application | `app.template` | End-user software |
| Library/package | `package.template` | Reusable code |
| Project | `project.template` | Dedicated development project |
| Code generator | `scaffold.template` | Boilerplate generation |
| DIY project | `diy.template` | Hardware, home automation |
| Organization | `org.template` | New super-repository |

## Template Customization

### Allowed Customizations
- Add project-specific files
- Extend CI/CD workflows
- Add custom issue templates
- Enhance documentation
- Add language/framework-specific configs

### Discouraged Changes
- Removing template-provided files
- Breaking template directory structure
- Modifying core template patterns
- Removing template submodule reference

## Template Validation

Check if repository follows template structure:
```bash
# Via CLI (if available)
cmr template validate --repo my-app.app

# Manual check
- [ ] `.github/.template/` submodule present
- [ ] `meta.json` has correct template field
- [ ] Core template files present
- [ ] README follows template structure
- [ ] LICENSE file present
```

## Template Documentation

Each template should document:
- Purpose and use cases
- Directory structure
- Required files
- Optional customizations
- Example repositories
- Update procedures

See individual template READMEs in `template.topic/`

## Best Practices

1. **Always Use Templates**: Don't create repos from scratch
2. **Maintain Submodule**: Keep `.github/.template/` updated
3. **Document Customizations**: Note deviations from template
4. **Test Updates**: Validate template updates before bulk apply
5. **Coordinate Changes**: Use Project Manager for breaking changes
6. **Version Templates**: Tag template versions for tracking
7. **Minimize Divergence**: Keep close to template structure
8. **Update Regularly**: Sync with template updates quarterly
