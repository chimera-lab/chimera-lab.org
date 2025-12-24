# Organization Management

Comprehensive guide for managing chimera-lab.org super-repository, including super-repository workflow, submodule operations, template application, and maintenance best practices.

## Table of Contents

- [Super-Repository Concept](#super-repository-concept)
- [Directory Structure](#directory-structure)
- [Submodule Workflow](#submodule-workflow)
- [Topic Management](#topic-management)
- [Repository Management](#repository-management)
- [Template Operations](#template-operations)
- [Metadata Management](#metadata-management)
- [Maintenance Tasks](#maintenance-tasks)
- [Troubleshooting](#troubleshooting)

## Super-Repository Concept

chimera-lab.org uses Git super-repository pattern:
- Organization root is Git repository tracking all sub-repositories
- Each topic/project is a Git submodule
- Centralized configuration in `.chimera-lab/`
- Coordinated updates across organization

**Key Benefits**:
- Single point of management for entire organization
- Atomic commits tracking organization-wide changes
- Easy submodule version pinning
- Coordinated topic/project updates

## Directory Structure

```
chimera-lab.org/                    # Organization root
├── .chimera-lab/                   # Organization metadata
│   ├── config/
│   │   ├── labels.json             # Default labels
│   │   ├── milestones.json         # Default milestones
│   │   └── repo.json               # Planned/ignored repos
│   ├── domains/
│   │   └── domains.json            # Topic mapping
│   └── utils/
│       ├── git_update_submodules.sh
│       ├── git_commit_submodules.sh
│       └── rebuild-repo-with-template.sh
├── .git/                           # Git super-repository
├── .gitmodules                     # Submodule definitions
├── .github/                        # Organization documentation
├── administration.topic/           # Topic collections (submodules)
├── projects.topic/                 # Project collections (submodules)
├── original.topic/                 # Source code (submodules)
├── template.topic/                 # Templates (submodules)
└── reports/                        # Generated reports
```

**Important**: Every topic, project, app, package, scaffold, and template is a **Git submodule**.

## Submodule Workflow

### Understanding Submodules

Git submodules allow you to:
- Track separate repositories within one organization
- Pin each submodule to specific commit
- Update submodules independently or together
- Work with multiple related projects

### Cloning with Submodules

**Initial Clone** (includes all submodules):
```bash
git clone --recursive https://github.com/chimera-lab/chimera-lab.org.git
cd chimera-lab.org
```

**Or initialize submodules after cloning**:
```bash
git clone https://github.com/chimera-lab/chimera-lab.org.git
cd chimera-lab.org
git submodule init
git submodule update --remote
```

### Updating Submodules

**Update all submodules to latest** (use utility script):
```bash
.chimera-lab/utils/git_update_submodules.sh
```

**Or manually**:
```bash
# Update all submodules
git submodule update --remote --merge

# Update specific submodule
git submodule update --remote --merge <submodule-path>
```

### Working in Submodules

**Inside a submodule**:
```bash
# Navigate to submodule
cd <topic-name>.topic/

# Work normally (create branch, make changes, commit, push)
git checkout -b feature/new-feature
# make changes
git commit -am "feat: new feature"
git push origin feature/new-feature
```

**Update organization reference** after submodule changes:
```bash
# Return to organization root
cd ../..

# Stage submodule reference update
git add <submodule-path>

# Commit submodule update
git commit -m "chore(submodules): update <submodule-name>"

# Push organization change
git push
```

### Adding New Submodules

**Add existing repository as submodule**:
```bash
# Add as submodule
git submodule add https://github.com/chimera-lab/new-repo.git <path>

# Example: Add new project under projects.topic/
git submodule add https://github.com/chimera-lab/new-project.project.git projects.topic/new-project.project

# Commit
git add .gitmodules <path>
git commit -m "feat: add new-project.project as submodule"
git push
```

**Verify submodule added**:
```bash
# Check .gitmodules
cat .gitmodules

# List submodules
git submodule status
```

### Removing Submodules

**Remove submodule** (requires careful steps):
```bash
# 1. De-initialize submodule
git submodule deinit -f <submodule-path>

# 2. Remove from git index
git rm --cached <submodule-path>

# 3. Remove from .gitmodules
# (edit .gitmodules manually or use git config)

# 4. Commit changes
git add .gitmodules <submodule-path>
git commit -m "chore: remove <submodule-name> submodule"
git push
```

## Topic Management

### Creating New Topic

**Structure for new topic**:
```bash
# Create topic directory
mkdir -p <new-topic>.topic

# Create Git repository
cd <new-topic>.topic
git init
git branch -M main

# Create basic structure
mkdir -p .github
echo "# $(echo <new-topic> | tr '-' ' ')" > README.md
echo "Organization topic for..." >> README.md

# Create metadata
mkdir -p .chimera-lab
cat > .chimera-lab/meta.json << EOF
{
  "name": "<new-topic>.topic",
  "template": "topic.template",
  "parent": "chimera-lab.org",
  "level": 1,
  "is_template": false
}
EOF

# Commit and push
git add .
git commit -m "chore: initialize <new-topic>.topic"
git branch -M main
git push -u origin main

# Add as submodule to organization
cd ../..
git submodule add https://github.com/chimera-lab/<new-topic>.topic.git <new-topic>.topic
git add .gitmodules <new-topic>.topic
git commit -m "feat: add <new-topic>.topic as submodule"
git push
```

### Topic Hierarchy

**Recommended nesting**:
```
Level 0: chimera-lab.org (organization root)
Level 1: administration.topic, devops.topic, security.topic (top-level topics)
Level 2: administration.topic/linux-administration.topic (sub-topic)
Level 3: linux-administration.topic/ubuntu.overview (repository within sub-topic)
```

**Avoid deeper nesting** - max 3-4 levels for maintainability.

### Moving Repositories Between Topics

**Reorganize topic structure**:
1. Create new parent topic (if needed)
2. Remove submodule from old parent
3. Add submodule to new parent
4. Update documentation in both topics
5. Commit and push organization changes

## Repository Management

### Adding Repository to Topic

**Add existing repository to topic**:
```bash
# Navigate to topic
cd <topic-name>.topic

# Add as submodule
git submodule add https://github.com/chimera-lab/<repo-name>.<suffix>.git <repo-name>.<suffix>

# Commit in topic
git add .gitmodules <repo-name>.<suffix>
git commit -m "feat: add <repo-name>.<suffix> as submodule"
git push

# Update organization reference
cd ../..
git add <topic-name>.topic
git commit -m "chore(submodules): update <topic-name>.topic"
git push
```

### Removing Repository from Topic

**Remove submodule from topic**:
```bash
# Navigate to topic
cd <topic-name>.topic

# Remove submodule
git submodule deinit -f <repo-name>.<suffix>
git rm --cached <repo-name>.<suffix>

# Update .gitmodules
git add .gitmodules
git commit -m "chore: remove <repo-name>.<suffix>"
git push

# Update organization reference
cd ../..
git add <topic-name>.topic
git commit -m "chore(submodules): update <topic-name>.topic"
git push
```

## Template Operations

### Applying Template to Repository

**Create repository from template**:
1. Via GitHub web: Use "Use this template" button
2. Add as submodule to appropriate topic
3. Apply template as submodule in `.github/.template/`
4. Customize repository structure
5. Update metadata files

**Via CLI** (if chimera-lab-cli available):
```bash
cmr repo create --name new-repo.suffix --template template.name --topic parent.topic
```

### Updating Template Across Repositories

**Update all repos using template**:
```bash
# List affected repositories
.chimera-lab/utils/bulk-rebuild-repo-with-template.sh --list-only app.template

# Update all repositories
.chimera-lab/utils/bulk-rebuild-repo-with-template.sh app.template
```

**Update single repository**:
```bash
.chimera-lab/utils/rebuild-repo-with-template.sh <repo-name>.<suffix>
```

**Manual template update**:
1. Update template repository
2. In child repo: `cd .github/.template && git pull`
3. Resolve any conflicts
4. Test and validate changes
5. Commit: `chore(template): update template`

## Metadata Management

### Organization Metadata

**`.chimera-lab/config/labels.json`** - Default labels:
```bash
# Validate JSON
jq empty .chimera-lab/config/labels.json

# Apply to repositories
.chimera-lab/utils/github_create_labels.sh --org-labels
```

**`.chimera-lab/config/milestones.json`** - Default milestones:
```bash
# Validate JSON
jq empty .chimera-lab/config/milestones.json

# Apply to repositories
.chimera-lab/utils/github_create_milestones.sh --org-milestones
```

**`.chimera-lab/config/repo.json`** - Repository planning:
```json
{
  "planned": [
    "future-project.project"
  ],
  "ignored": [
    "deprecated.topic"
  ]
}
```

### Repository Metadata

**Every repository requires `.chimera-lab/meta.json`**:
```json
{
  "name": "repository-name.suffix",
  "template": "template-name.template",
  "parent": "parent-topic",
  "level": 2,
  "is_template": false
}
```

**Validate all repositories**:
```bash
# Check structure
find . -name "meta.json" -path "*/.chimera-lab/*" | sort

# Validate JSON syntax
for f in find . -name "meta.json" -path "*/.chimera-lab/*"; do
  echo "Checking $f..."
  jq empty "$f" || echo "ERROR in $f"
done
```

## Maintenance Tasks

### Regular Maintenance

**Daily/Weekly**:
- Pull organization changes: `git pull`
- Update submodules: `git submodule update --remote --merge`
- Review `.gitmodules` for consistency

**Monthly**:
- Audit submodule status: `git submodule status`
- Validate metadata files: Check all `.chimera-lab/meta.json`
- Review organization structure: Are topics organized logically?

**Quarterly**:
- Template audit: Check template coverage
- Deprecation review: Remove unused repositories
- Documentation review: Update README files
- Rules audit: Review RULES.md for needed updates

### Generating Reports

**Organization status**:
```bash
# Generate directory structure
tree -L 2 -d > reports/structure-$(date +%Y-%m-%d).txt

# List all submodules with status
git submodule status > reports/submodules-$(date +%Y-%m-%d).txt

# Count repositories
find . -name ".chimera-lab" -path "*/meta.json" | wc -l > reports/repo-count-$(date +%Y-%m-%d).txt
```

**Documentation generation** (if CLI available):
```bash
# Generate graphs
cmr graph all --output graphml > reports/org-graph-$(date +%Y-%m-%d).graphml

# Generate template usage
cmr template list --output json > reports/templates-$(date +%Y-%m-%d).json
```

### Cleanup Tasks

**Remove stale branches** in submodules:
```bash
# Prune remote branches
git submodule foreach 'git fetch -p origin'

# Remove local branches tracking deleted remotes
git submodule foreach 'git branch -vv | grep "\[.*: gone\]" | awk "{print \$1}" | xargs git branch -D'
```

**Clear cache**:
```bash
# Remove git cache if metadata changes
git rm -r --cached .
git add .
git commit -m "chore: clear git cache"
```

## Troubleshooting

### Common Issues

**Submodule out of sync**:
```bash
# Status shows diverged commit
git submodule update --remote --merge <submodule-path>
git add <submodule-path>
git commit -m "chore(submodules): sync <submodule-name>"
git push
```

**Submodule not cloned**:
```bash
# Reinitialize submodules
git submodule init
git submodule update --remote --recursive
```

**Merge conflicts in submodules**:
```bash
# Navigate to submodule
cd <submodule-path>

# Resolve conflict (get latest from remote)
git fetch origin
git merge origin/main

# Resolve any actual conflicts
git add .
git commit -m "chore: resolve submodule merge conflict"
git push

# Update organization reference
cd ../..
git add <submodule-path>
git commit -m "chore(submodules): resolve conflict in <submodule-name>"
git push
```

**Organization becoming large** (many submodules):
- Keep topics organized hierarchically
- Archive or deprecate unused topics
- Use `.chimera-lab/config/repo.json` to ignore stale repos
- Consider splitting into multiple organizations if > 50 active submodules

### Getting Help

For organization-wide issues, create issue in organization root with label `type:org-rule` or `scope:cross-repo`.

For individual repository issues, create issue in respective repository.

For template-related issues, create issue in template repository or organization root with label `type:template`.

---

## References

- [ORGANIZATION_STRUCTURE.md](./ORGANIZATION_STRUCTURE.md) - Repository conventions
- [RULES.md](../.github/RULES.md) - Organization rules
- [NAMING_CONVENTIONS.md](./NAMING_CONVENTIONS.md) - Naming guide
- [templates.knowledge.md](../.github/knowledge/templates.knowledge.md) - Template reference
- [organization.knowledge.md](../.github/knowledge/organization.knowledge.md) - Organization concepts
