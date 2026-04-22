---
agent: organization-manager
description: Guide for creating new GitHub repository templates
---

# Create Template Prompt

You are assisting in creating a new GitHub repository template for the chimera-lab.org organization.

## Discovery Phase

Before creating the template, gather this information:

1. **Template Purpose**: What repository type does this template support?
   - Examples: `app.template` (for all apps), `laravel_app.template` (Laravel-specific), `topic.template` (topics)

2. **Parent Template**: Which template should this inherit from?
   - Base: `repository.template` (always required)
   - Specialize: `app.template` → `laravel_app.template`
   - Lateral: Topic template from repository.template

3. **Target Repositories**: Name 2-3 existing repositories that should use this template
   - Validate template structure against their current layout
   - Identify patterns to include in template

4. **Essential Structure**: What must every repository of this type include?
   - Directory structure (src/, docs/, etc.)
   - Configuration files (.gitignore, LICENSE, etc.)
   - GitHub workflows or CI/CD
   - Documentation templates (README, CONTRIBUTING, etc.)

## Implementation Phase

Create the template with this structure:

```
<name>.template/
├── README.md                     # Template usage and overview
├── .github/
│   ├── CONTRIBUTING.md           # Contribution guidelines
│   ├── CODE_OF_CONDUCT.md        # Community standards
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   ├── feature_request.md
│   │   └── config.yml
│   ├── PULL_REQUEST_TEMPLATE.md  # PR template
│   └── workflows/
│       ├── test.yml              # Testing workflow
│       └── lint.yml              # Linting workflow
├── .gitignore                    # Language/framework specific
├── .editorconfig                 # Editor configuration
├── LICENSE                       # MIT or appropriate license
├── SECURITY.md                   # Security policy
├── [language-specific config]    # package.json, pyproject.toml, composer.json, etc.
└── [directory structure]         # src/, docs/, tests/, etc.

```

## Validation Phase

Before finalizing, validate:

- [ ] **Inheritance**: Template correctly inherits from parent
- [ ] **Completeness**: All essential files present
- [ ] **Documentation**: README explains template purpose and usage
- [ ] **Specificity**: Template is specific enough to be useful but general enough to apply to multiple projects
- [ ] **Real Projects**: Apply template to 1-2 existing projects and verify structure compatibility
- [ ] **Naming**: Follows `<name>.template` convention with lowercase and hyphens
- [ ] **GitHub Config**: Issue templates, workflows, and labels properly configured
- [ ] **Language Support**: Language-specific config files included (if applicable)

## Documentation Phase

Document the template creation:

1. **Update templates.knowledge.md**:
   - Add new template to hierarchy diagram
   - List use cases and example projects
   - Document inheritance chain

2. **Update ORGANIZATION.md**:
   - Add template to template suffix section
   - Include naming example
   - Document when to use this template

3. **Update STRUCTURE.md**:
   - Reference new template
   - Show example of repository created from template

4. **Create template-specific README**:
   - Purpose and scope
   - When to use
   - Quick start (copy link for "Use this template")
   - Customization guide
   - Examples of projects using template

## Integration Phase

After template is complete:

1. **Add to organization.knowledge.md**:
   ```
   - `<name>.template` - [Purpose], inherits from [parent]
   ```

2. **Update template.knowledge.md**:
   - Update hierarchy diagram
   - Add to template list with use cases

3. **Test with new repository**:
   - Create test repository using "Use this template"
   - Verify all files present and working
   - Test GitHub workflows
   - Verify issue templates display correctly

4. **Apply to existing repositories** (if applicable):
   - List repositories that should use this template
   - Document steps to apply template
   - Create issue to track template application

## Common Template Examples

### app.template
- Inherits from: `repository.template`
- Contains: App-specific workflows, structure, configs
- Used by: `.app` suffix repositories

### laravel_app.template
- Inherits from: `app.template`
- Adds: Laravel-specific files (artisan, config/, routes/, etc.)
- Used by: Laravel applications

### topic.template
- Inherits from: `repository.template`
- Contains: Topic-specific structure, README patterns
- Used by: `.topic` suffix repositories

### docker_scaffold.template
- Inherits from: `scaffold.template`
- Adds: Docker-specific files (Dockerfile, docker-compose.yml)
- Used by: Docker scaffolds

## Success Criteria

Template is successfully created when:

1. ✅ Template repository created with proper name
2. ✅ Inherits correctly from parent template
3. ✅ Contains all essential structure and files
4. ✅ README documents template purpose and usage
5. ✅ GitHub templates (issues, PRs) configured
6. ✅ Workflows included and tested
7. ✅ 2-3 existing projects can successfully use template
8. ✅ Knowledge base updated with template reference
9. ✅ Documentation explains template hierarchy and usage
10. ✅ Naming conventions documentation updated

## Notes

- Templates should be general enough to apply to multiple projects
- Avoid repo-specific content; use placeholders for organization/project names
- Document assumptions about language, framework, or platform
- Keep templates maintainable with clear dependency chains
- Plan template updates and version management
