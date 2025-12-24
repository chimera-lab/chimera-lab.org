---
agent: repository-manager
description: Guide for updating existing GitHub repository templates across organization
---

# Update Template Prompt

You are assisting in updating GitHub repository templates across the chimera-lab.org organization. Template updates ensure consistency and improvements are propagated to all derived repositories.

## Discovery Phase

Before updating templates, gather this information:

1. **Template to Update**: Which template(s) need updates?
   - Specific template (e.g., `app.template`)
   - Child templates inherit from parent (e.g., updating `app.template` affects `laravel_app.template`)
   - Check current template state

2. **Update Scope**: What is changing?
   - Bug fixes in workflows
   - New GitHub features or templates
   - Updated documentation standards
   - Configuration changes
   - Dependency updates
   - Removal of obsolete content

3. **Impact Analysis**:
   - How many repositories use this template? (check organization structure)
   - List affected repositories
   - Will update break anything? (breaking changes analysis)
   - Is rollback needed if issues arise?

4. **Change Rationale**:
   - Why is this update necessary?
   - Benefits to affected repositories
   - Any compatibility concerns
   - Migration steps needed (if breaking)

## Update Phase

### Strategy 1: Non-Breaking Changes (Recommended)

Most updates (new workflows, improved docs, new templates) are non-breaking:

1. **Update Template Repository**:
   ```bash
   cd <template-name>.template
   git checkout -b update/<description>
   
   # Make changes to template files
   # Examples:
   # - .github/workflows/: add new or improve existing
   # - README.md: clarify instructions, add examples
   # - .gitignore: update for new language versions
   # - Documentation files: improve clarity
   
   git add .
   git commit -m "feat(<template>): <description of change>"
   git push origin update/<description>
   ```

2. **Create PR for Review**:
   - Document changes clearly
   - Explain benefits and impact
   - Include examples if applicable
   - Request technical-writer review for docs changes

3. **Merge to Main**:
   ```bash
   git checkout main
   git pull origin main
   git merge --no-ff update/<description>
   git push origin main
   git tag -a v<version> -m "Update template"
   git push origin v<version>
   ```

### Strategy 2: Breaking Changes

For updates that require repository changes (restructuring, workflow changes):

1. **Update Template with Compatibility Notes**:
   ```bash
   # In template README.md or migration guide:
   ## Breaking Changes (v2.0)
   - Workflows moved to .github/workflows-v2/
   - config.yml format changed
   
   ## Migration Guide
   1. Update workflow references
   2. Update configuration files
   3. Test locally before pushing
   ```

2. **Create Migration Guide**:
   - Document old vs new structure
   - Provide migration commands/steps
   - Show before/after examples
   - Estimate effort for migration

3. **Update Affected Repositories**:
   - For major breaking changes, do it yourself or coordinate
   - Use consistent PR format
   - Include reference to migration guide
   - Test after changes

## Application Phase

### Automatic Application (for non-breaking changes)

New repositories created from updated template automatically get new version.

### Manual Application to Existing Repositories

For some updates, existing repositories need synchronization:

1. **Identify Affected Repositories**:
   ```bash
   # Find repositories using template
   cd /path/to/organization
   find . -name ".github" -type d | grep -v ".git" | cut -d/ -f1,2
   
   # Check template version in .chimera-lab/meta.json
   grep -r "templates_applied" */.chimera-lab/meta.json
   ```

2. **Update Strategy Selection**:
   - **Automatic sync** (optional files like workflows): merge new workflows
   - **Manual review** (critical files): create PR for review
   - **Repository-specific** (customized files): skip if diverged significantly

3. **Apply Updates Systematically**:
   ```bash
   # For each affected repository:
   cd <repository>
   git checkout -b template-update
   
   # Copy specific updated files
   cp /path/to/template/.github/workflows/* .github/workflows/
   cp /path/to/template/.gitignore .gitignore
   # Don't overwrite heavily customized files
   
   # Test locally
   # Commit and create PR
   git add .
   git commit -m "chore: update template files"
   git push origin template-update
   # Create PR, review, merge
   ```

4. **Bulk Update Coordination**:
   - Create GitHub issue: "Template Update: <template-name> v<version>"
   - List all affected repositories
   - Assign team members to update groups
   - Track completion in issue

## Versioning Phase

Template versioning helps track updates:

1. **Semantic Versioning**:
   - `v1.0.0` - Initial release
   - `v1.1.0` - Non-breaking features added
   - `v1.1.1` - Bug fixes
   - `v2.0.0` - Breaking changes

2. **Version in Template**:
   ```bash
   # In template README.md
   ## Template Version
   This template is version 1.1.0
   
   # In .chimera-lab/meta.json
   {
     "version": "1.1.0",
     "last_updated": "2024-01-15",
     "breaking_changes": false
   }
   ```

3. **Track in Repositories**:
   ```bash
   # In .chimera-lab/meta.json of derived repository
   {
     "templates_applied": [
       "repository.template@1.0.0",
       "app.template@1.1.0"
     ]
   }
   ```

## Documentation Phase

Document all template updates:

1. **Update CHANGELOG.md** (in template):
   ```markdown
   ## v1.1.0 (2024-01-15)
   - feat: add new GitHub Actions workflow for deployment
   - fix: correct Python version in pyproject.toml
   - docs: improve README examples
   ```

2. **Update templates.knowledge.md**:
   - Update last-modified date
   - Note significant changes
   - Update example repositories if version-specific

3. **Update ORGANIZATION_MANAGEMENT.md**:
   - If new template management procedure needed
   - If breaking changes require special handling

4. **Notify Users**:
   - Create GitHub Discussion or issue
   - Announce significant updates
   - Provide migration timeline if breaking changes

## Validation Phase

After updating template(s), validate:

1. **Template Repository**:
   - [ ] All changes committed and pushed
   - [ ] CHANGELOG updated
   - [ ] README reflects current version
   - [ ] Workflow files syntactically correct (validate YAML)
   - [ ] No hardcoded values that should be customizable

2. **Affected Repositories** (sample 2-3):
   - [ ] Repository can successfully use updated template
   - [ ] All files copy/merge without conflicts
   - [ ] Workflows run without errors
   - [ ] No breaking changes break existing functionality
   - [ ] Documentation still makes sense with new version

3. **Consistency**:
   - [ ] All repositories using same template version
   - [ ] No divergent workflows between repositories
   - [ ] Configuration consistent across repositories
   - [ ] Documentation coherent (no contradicting versions)

## Common Template Updates

### Adding a New Workflow
```bash
# In <template>.template/.github/workflows/

# Example: Adding code coverage workflow
cat > coverage.yml << 'EOF'
name: Code Coverage
on: [push, pull_request]
jobs:
  coverage:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run coverage
        run: pip install -r requirements.txt && pytest --cov
EOF

git add .github/workflows/coverage.yml
git commit -m "feat(template): add code coverage workflow"
```

### Updating .gitignore
```bash
# Common additions for Python
echo "
# Virtual environments
venv/
env/
ENV/

# IDE
.vscode/
.idea/
*.swp

# Environment files
.env
.env.local
" >> .gitignore

git add .gitignore
git commit -m "chore(template): expand .gitignore"
```

### Improving Documentation
```bash
# In README.md
# Add troubleshooting section, examples, or clarifications

git add README.md
git commit -m "docs(template): improve setup instructions"
```

## Rollback Procedure

If template update causes issues:

1. **Identify Issue**:
   - Repository with problem
   - Which update caused it
   - Impact on other repositories

2. **Create Hotfix**:
   ```bash
   cd <template>.template
   git checkout -b hotfix/<issue>
   # Fix the problem
   git commit -m "fix(template): <issue description>"
   git push origin hotfix/<issue>
   # Merge quickly to main
   ```

3. **Notify Users**:
   - Comment on template PR/issue
   - Notify affected repositories
   - Provide rollback steps if needed

4. **Update Affected Repositories**:
   ```bash
   # In affected repositories
   git pull origin main  # Gets hotfix
   git add .
   git commit -m "chore: merge template hotfix"
   git push
   ```

## Success Criteria

Template update is successful when:

1. ✅ Template repository updated with all changes
2. ✅ Changes properly documented (CHANGELOG, README)
3. ✅ Version incremented appropriately
4. ✅ Validation on sample repositories successful
5. ✅ No breaking changes (or documented with migration path)
6. ✅ Affected repositories tested with new version
7. ✅ Knowledge base documentation updated
8. ✅ Users notified if major update
9. ✅ All repositories can still build/deploy
10. ✅ No regression in existing functionality

## References

- [templates.knowledge.md](../knowledge/templates.knowledge.md) - Template structure
- [ORGANIZATION_MANAGEMENT.md](../docs/ORGANIZATION_MANAGEMENT.md) - Organization operations
- [repository.knowledge.md](../knowledge/repository.knowledge.md) - Repository metadata
- Individual repository `.chimera-lab/meta.json` - Template version tracking
