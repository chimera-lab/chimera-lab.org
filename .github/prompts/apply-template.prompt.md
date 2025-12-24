---
agent: repository-manager
description: Guide for applying GitHub repository templates to new repositories
---

# Apply Template Prompt

You are assisting in applying a GitHub repository template to a new or existing repository in the chimera-lab.org organization.

## Discovery Phase

Before applying the template, gather this information:

1. **Template Selection**: Which template applies to this repository?
   - Check repository suffix: `.app`, `.project`, `.topic`, `.package`, etc.
   - Reference: [NAMING_CONVENTIONS.md](../docs/NAMING_CONVENTIONS.md)
   - Confirm in [templates.knowledge.md](../knowledge/templates.knowledge.md)

2. **Repository Details**:
   - Full repository name
   - Location (in organization or within topic)
   - Repository type (GitHub suffix)
   - Primary language/framework

3. **Existing Content**:
   - Does repository exist? (new vs existing)
   - What content already present? (code, docs, workflows)
   - Any conflicts with template? (divergent structure, incompatible configs)

## Pre-Application Phase

For new repositories created with template:

1. **GitHub "Use this template"**:
   - Navigate to template repository
   - Click "Use this template" (GitHub feature)
   - Fill in repository name in full format: `<name>.<suffix>`
   - Set appropriate visibility (public/private)
   - Include all branches: ✓ (if applicable)

2. **Initial Configuration**:
   ```bash
   # Clone the new repository
   git clone https://github.com/chimera-lab/<repository-name>
   cd <repository-name>
   
   # Configure as submodule (if in topic)
   cd /path/to/topic
   git submodule add https://github.com/chimera-lab/<repository-name> <relative-path>
   git commit -m "chore(submodules): add <repository-name> to <topic>"
   ```

## Application Phase

### For New Repository (via GitHub Template)

1. **Files Already Present**:
   - ✅ Repository structure
   - ✅ .github/ configuration
   - ✅ README.md
   - ✅ LICENSE
   - ✅ Workflow templates

2. **Customize Template Content**:
   ```bash
   # Edit README.md - replace template placeholders:
   - [Your Project Name] → actual name
   - [Your Project Description] → actual description
   - [Your Project Link] → actual repository link
   
   # Update .github/ files:
   - CONTRIBUTING.md - adjust contribution guidelines if needed
   - CODE_OF_CONDUCT.md - keep or customize
   - Issue/PR templates - review for relevance
   
   # Update workflows:
   - test.yml - adjust for language/framework
   - lint.yml - configure linters for project
   - Add additional workflows as needed
   ```

3. **Add Metadata** (`.chimera-lab/` directory):
   ```bash
   mkdir -p .chimera-lab
   
   # Create meta.json
   cat > .chimera-lab/meta.json << 'EOF'
   {
     "name": "<repository-name>",
     "type": "<suffix>",
     "description": "<brief description>",
     "language": "<primary-language>",
     "templates_applied": ["<parent-template>"]
   }
   EOF
   
   # Create issues.json (if project)
   cat > .chimera-lab/issues.json << 'EOF'
   {
     "categories": [
       {"name": "bug", "description": "Bugs and issues"},
       {"name": "feature", "description": "New features"},
       {"name": "docs", "description": "Documentation"}
     ]
   }
   EOF
   ```

4. **Initial Commit**:
   ```bash
   git add .
   git commit -m "chore: customize template for <repository-name>"
   git push origin main
   ```

### For Existing Repository (Manual Application)

Only for repositories that existed before template creation.

1. **Backup Current State**:
   ```bash
   git checkout -b template-migration
   git push origin template-migration
   ```

2. **Download Template Files**:
   - Clone template repository
   - Extract essential files (don't overwrite all code)
   - Preserve existing code/documentation

3. **Merge Template Structure**:
   ```bash
   # Copy template files, preserving existing code:
   cp -r template/.github/ .github/
   cp template/.gitignore .gitignore
   cp template/LICENSE LICENSE
   cp template/SECURITY.md SECURITY.md
   
   # Review and keep existing files:
   - Don't overwrite existing README unless corrupted
   - Merge workflows with existing CI/CD
   - Keep language-specific configs (package.json, etc.)
   
   # Create metadata:
   mkdir -p .chimera-lab
   cp template/.chimera-lab/* .chimera-lab/
   ```

4. **Review and Test**:
   ```bash
   # Verify structure
   ls -la .github/
   git status
   
   # Test workflows (push to branch)
   git add .
   git commit -m "chore: apply template to existing repository"
   git push origin template-migration
   # Check GitHub Actions run successfully
   ```

5. **Merge to Main**:
   ```bash
   git checkout main
   git pull origin main
   git merge template-migration
   git push origin main
   ```

## Post-Application Phase

After template applied, complete these tasks:

1. **Verify Structure**:
   - [ ] `.github/` directory present with all subdirectories
   - [ ] README.md exists and is properly formatted
   - [ ] .gitignore appropriate for language
   - [ ] LICENSE file present
   - [ ] Workflows in `.github/workflows/` execute without errors
   - [ ] Issue/PR templates appear in GitHub UI

2. **Validate Configuration**:
   - [ ] Repository settings match organization standards
   - [ ] Branch protection rules configured (if needed)
   - [ ] CODEOWNERS file in `.github/` if applicable
   - [ ] Repository description updated
   - [ ] Topics/tags applied correctly

3. **Test GitHub Features**:
   - [ ] Create test issue → verify templates work
   - [ ] Create test PR → verify template works
   - [ ] Run workflows manually or via test commit
   - [ ] Check automatic labels application

4. **Update Organization Records**:
   ```bash
   # If in topic (add as submodule if not already)
   cd /path/to/topic
   git submodule add https://github.com/chimera-lab/<repo> <repo-name>
   
   # Update topic's .chimera-lab/meta.json
   # Update organization knowledge base if new repository type
   ```

5. **Documentation**:
   - [ ] Update `.github/docs/ORGANIZATION_STRUCTURE.md` with new repo
   - [ ] If new template type, update `templates.knowledge.md`
   - [ ] If new repository type, update `NAMING_CONVENTIONS.md`
   - [ ] Create GitHub issue for template tracking (if bulk operation)

## Template Reference

| Suffix | Template | Parent |
|--------|----------|--------|
| `.app` | `app.template` | `repository.template` |
| `.project` | `project.template` | `repository.template` |
| `.package` | `package.template` | `repository.template` |
| `.scaffold` | `scaffold.template` | `repository.template` |
| `.topic` | `topic.template` | `repository.template` |
| `.overview` | `overview.template` | `repository.template` |
| `.diy` | `diy.template` | `repository.template` |
| `.template` | Specialized | `repository.template` |

## Language-Specific Configurations

### Python Projects
```
- pyproject.toml or setup.py
- requirements.txt or Pipfile
- .python-version (optional)
- tests/ directory
```

### JavaScript/Node Projects
```
- package.json
- .npmrc (if organization scope)
- tsconfig.json (if TypeScript)
- jest.config.js or test config
```

### Laravel/PHP Projects
```
- composer.json
- artisan file
- config/ directory
- routes/ directory
- .env.example
```

### Docker Projects
```
- Dockerfile
- docker-compose.yml (or docker-compose.yaml)
- .dockerignore
- Docker-specific .gitignore
```

## Troubleshooting

### Template Files Not Appearing
- Check GitHub "Use this template" created repository correctly
- Verify template repository is public and properly configured
- Refresh browser cache if applying manually

### Workflows Not Running
- Check `.github/workflows/` files present
- Verify workflow syntax (valid YAML)
- Check branch name matches workflow trigger (usually `main`)
- Enable GitHub Actions in repository settings

### Merge Conflicts
- For existing repos, use `git merge --strategy=ours` to keep local version
- Manually review and merge template improvements
- Test after merge before pushing

### Metadata Missing
- Create `.chimera-lab/` directory if missing
- Copy template's `meta.json` and `issues.json`
- Update values to reflect actual repository

## Success Criteria

Template application is successful when:

1. ✅ Repository created using GitHub "Use this template" or files merged
2. ✅ All template files present and properly structured
3. ✅ README customized with repository-specific content
4. ✅ Metadata files created (.chimera-lab/)
5. ✅ Workflows configured and tested successfully
6. ✅ GitHub issue and PR templates display correctly
7. ✅ Repository appears in organization structure
8. ✅ Language/framework-specific configs present
9. ✅ Repository added to submodules (if in topic)
10. ✅ Organization documentation updated

## References

- [templates.knowledge.md](../knowledge/templates.knowledge.md) - Template hierarchy
- [NAMING_CONVENTIONS.md](../docs/NAMING_CONVENTIONS.md) - Repository suffixes
- [ORGANIZATION_MANAGEMENT.md](../docs/ORGANIZATION_MANAGEMENT.md) - Submodule workflow
- [repository.knowledge.md](../knowledge/repository.knowledge.md) - Repository metadata
