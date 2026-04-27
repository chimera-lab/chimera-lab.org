# Templates Knowledge

## :book: Table of Contents

- [Templates Knowledge](./#templates-knowledge)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:wrench: Configuration](./#wrench-configuration)
  - [:keyboard: Usage](./#keyboard-usage)
    - [:keyboard: Via GitHub Web Interface](./#keyboard-via-github-web-interface)
    - [:keyboard: Via GitHub CLI](./#keyboard-via-github-cli)
    - [:keyboard: Via chimera-lab-cli](./#keyboard-via-chimera-lab-cli)
  - [:page_facing_up: Files](./#page_facing_up-files)
    - [:page_facing_up: In Template Repository](./#page_facing_up-in-template-repository)
    - [:page_facing_up: In Child Repository](./#page_facing_up-in-child-repository)
  - [:books: References](./#books-references)
  - [:jigsaw: Components](./#jigsaw-components)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Template Selection](./#world_map-template-selection)
    - [:world_map: Validation](./#world_map-validation)
    - [:world_map: Best Practices](./#world_map-best-practices)
  - [:control_knobs: Customization](./#control_knobs-customization)
    - [:control_knobs: Allowed Customizations](./#control_knobs-allowed-customizations)
    - [:control_knobs: Discouraged Changes](./#control_knobs-discouraged-changes)
  - [:link: See Also](./#link-see-also)

## :telescope: Overview

GitHub repository templates provide reusable structure for new repositories. In chimera-lab.org:

- Templates stored in `template.topic/`
- Applied via GitHub template mechanism
- Maintained as submodule in `.github/.template/` of child repos
- Enable consistent structure across similar repositories

## :building_construction: Structure

```text
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

## :wrench: Configuration

Each template repository contains:

```text
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

## :keyboard: Usage

### :keyboard: Via GitHub Web Interface

1. Navigate to template repository on GitHub
2. Click "Use this template"
3. Create new repository from template
4. Clone and add as submodule to organization

### :keyboard: Via GitHub CLI

Create with `gh repo create org/new-repo --template org/template-name.template --public`, then add as submodule.

### :keyboard: Via chimera-lab-cli

Use `cmr repo create --name new-repo --template app.template --topic devops.topic`.

## :page_facing_up: Files

### :page_facing_up: In Template Repository

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

### :page_facing_up: In Child Repository

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

## :books: References

Templates inherit from parent templates:

- `repository.template` provides base structure (README, LICENSE, .gitignore)
- Specialized templates extend base (add CI/CD, language-specific configs)
- Child repos can further customize without breaking template link

## :jigsaw: Components

| Template              | Purpose                 | Includes                                     |
| --------------------- | ----------------------- | -------------------------------------------- |
| `repository.template` | Base for all templates  | README, LICENSE, .gitignore, CONTRIBUTING.md |
| `topic.template`      | Organize related repos  | Topic README, navigation structure           |
| `overview.template`   | Study/learning material | Chapter structure, examples directory        |
| `project.template`    | Full project lifecycle  | CI/CD, issue templates, release workflow     |
| `app.template`        | End-user applications   | Build scripts, deployment configs, user docs |
| `package.template`    | Reusable libraries      | Package manifest, docs, testing setup        |
| `scaffold.template`   | Boilerplate generators  | Generator scripts, template files            |
| `org.template`        | Super-repository        | `.chimera-lab/` setup, submodule conventions |

## :world_map: Guides

### :world_map: Template Selection

| Repository Type  | Use Template        | When                              |
| ---------------- | ------------------- | --------------------------------- |
| Knowledge topic  | `topic.template`    | Organizing related repos/concepts |
| Study material   | `overview.template` | Documentation, tutorials, guides  |
| Full application | `app.template`      | End-user software                 |
| Library/package  | `package.template`  | Reusable code                     |
| Project          | `project.template`  | Dedicated development project     |
| Code generator   | `scaffold.template` | Boilerplate generation            |
| DIY project      | `diy.template`      | Hardware, home automation         |
| Organization     | `org.template`      | New super-repository              |

### :world_map: Validation

Validate with `cmr template validate --repo my-app.app` (if CLI available) or manually check that `.github/.template/` submodule exists, `meta.json` has the correct `template` field, and core template files are present.

### :world_map: Best Practices

1. **Always Use Templates**: Don't create repos from scratch
2. **Maintain Submodule**: Keep `.github/.template/` updated
3. **Document Customizations**: Note deviations from template
4. **Test Updates**: Validate template updates before bulk apply
5. **Coordinate Changes**: Use Project Manager for breaking changes
6. **Version Templates**: Tag template versions for tracking
7. **Minimize Divergence**: Keep close to template structure
8. **Update Regularly**: Sync with template updates quarterly

## :control_knobs: Customization

### :control_knobs: Allowed Customizations

- Add project-specific files
- Extend CI/CD workflows
- Add custom issue templates
- Enhance documentation
- Add language/framework-specific configs

### :control_knobs: Discouraged Changes

- Removing template-provided files
- Breaking template directory structure
- Modifying core template patterns
- Removing template submodule reference

## :link: See Also

Each template should document:

- Purpose and use cases
- Directory structure
- Required files
- Optional customizations
- Example repositories
- Update procedures

See individual template READMEs in `template.topic/`
