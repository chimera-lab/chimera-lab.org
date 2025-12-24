---
agent: organization-manager
description: Guide for validating repository structure against templates and organization rules
---

# Validate Template Prompt

You are assisting in validating GitHub repositories against their applied templates and organization rules. Validation ensures consistency across the chimera-lab.org organization.

## Discovery Phase

Before validation, gather this information:

1. **Validation Scope**: What to validate?
   - Single repository validation
   - All repositories in topic validation
   - Organization-wide validation
   - Specific validation type (structure, metadata, workflows, documentation)

2. **Repository Information**:
   - Repository path/name
   - Applied template (check `.chimera-lab/meta.json`)
   - Repository type (suffix: `.app`, `.project`, etc.)
   - Primary language/framework

3. **Validation Baseline**:
   - Which template should it match?
   - Which organization rules apply?
   - Are there documented exceptions?
   - Expected directory structure

## Validation Checklist

### Phase 1: Essential Files

Validate that required files exist:

```
Repository Root:
├── README.md              # ✅ Required - explains project
├── LICENSE                # ✅ Required - MIT or other
├── .gitignore             # ✅ Required - language-specific
├── .github/               # ✅ Required directory
│   ├── CONTRIBUTING.md    # ✅ Required
│   ├── CODE_OF_CONDUCT.md # ✅ Recommended
│   ├── SECURITY.md        # ✅ Recommended
│   ├── CODEOWNERS         # ⚠️  For projects/packages
│   ├── workflows/         # ✅ Required
│   │   ├── [test/ci].yml  # Language dependent
│   │   └── [lint].yml     # Recommended
│   ├── ISSUE_TEMPLATE/    # ✅ Required
│   │   ├── config.yml
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── PULL_REQUEST_TEMPLATE.md # ✅ Recommended
├── .chimera-lab/          # ✅ Required directory
│   ├── meta.json          # ✅ Required
│   ├── issues.json        # ⚠️  For projects
│   └── milestones.json    # ⚠️  For projects
└── [language-config]      # Language-specific
```

**Validation Commands**:
```bash
# Check for essential files
for file in README.md LICENSE .gitignore; do
  test -f "$file" && echo "✅ $file" || echo "❌ Missing $file"
done

# Check directories
for dir in .github .chimera-lab; do
  test -d "$dir" && echo "✅ $dir/" || echo "❌ Missing $dir/"
done

# Check metadata
test -f .chimera-lab/meta.json && echo "✅ Metadata" || echo "❌ Missing metadata"
```

### Phase 2: Metadata Validation

Validate `.chimera-lab/meta.json`:

```bash
# Check metadata structure
cat .chimera-lab/meta.json | jq .

# Required fields:
# - name: repository name
# - type: repository suffix
# - description: brief description
# - language: primary language
# - templates_applied: list of parent templates
```

**Validation Checklist**:
```
.chimera-lab/meta.json:
├── name              # ✅ Matches repository name?
├── type              # ✅ Valid suffix (.app, .project, etc.)?
├── description       # ✅ Meaningful (not empty)?
├── language          # ✅ Recognized language?
├── templates_applied # ✅ List of parents (at least repository.template)?
└── [custom fields]   # ⚠️ Project-specific metadata
```

**Example Valid meta.json**:
```json
{
  "name": "chimera-lab-cli",
  "type": "app",
  "description": "CLI tool for managing chimera-lab organization",
  "language": "python",
  "templates_applied": [
    "repository.template@1.0.0",
    "app.template@1.1.0"
  ]
}
```

### Phase 3: Directory Structure

Validate structure matches repository type and template:

**For `.app` repositories**:
```
├── README.md
├── src/                  # ✅ Source code
├── tests/                # ✅ Tests
├── docs/                 # ✅ Documentation
├── [build/config]        # Language-specific
└── .github/
```

**For `.project` repositories**:
```
├── README.md
├── .github/
├── .chimera-lab/
├── src/                  # ✅ Source code
├── docs/                 # ✅ Documentation
├── tests/                # ✅ Tests
└── [project-specific]
```

**For `.topic` repositories**:
```
├── README.md
├── .github/
├── .chimera-lab/
├── [sub-topic].topic/    # ✅ Sub-topics
├── [repo].project/       # ✅ Contained projects
└── [repo].app/           # ✅ Contained apps
```

**Validation Command**:
```bash
# Check directory structure
echo "Directory structure:"
tree -d -L 2 -I '.git|node_modules|venv'

# Verify required directories exist
declare -a required_dirs=(".github" ".chimera-lab" "docs")
for dir in "${required_dirs[@]}"; do
  test -d "$dir" && echo "✅ $dir/" || echo "❌ Missing $dir/"
done
```

### Phase 4: GitHub Configuration

Validate `.github/` directory:

```bash
# Check workflows
ls -la .github/workflows/

# ✅ Should contain:
# - test.yml or similar (testing)
# - lint.yml or similar (linting)
# - Others as appropriate for project type

# Check templates
ls -la .github/ISSUE_TEMPLATE/
ls -la .github/PULL_REQUEST_TEMPLATE.md

# Check documentation
ls -la .github/CODE_OF_CONDUCT.md
ls -la .github/CONTRIBUTING.md
ls -la .github/SECURITY.md

# Validate workflow syntax
for workflow in .github/workflows/*.yml; do
  echo "Checking $workflow..."
  python -m yaml "$workflow" > /dev/null && echo "✅ Valid" || echo "❌ Invalid YAML"
done
```

**Validation Checklist**:
```
.github/
├── workflows/
│   ├── test.yml or [language]_test.yml    # ✅ Required
│   ├── lint.yml or [language]_lint.yml    # ✅ Required
│   └── [others].yml                       # ⚠️ As needed
├── ISSUE_TEMPLATE/
│   ├── config.yml                         # ✅ Config
│   ├── bug_report.md                      # ✅ Bug template
│   └── feature_request.md                 # ✅ Feature template
├── PULL_REQUEST_TEMPLATE.md               # ✅ PR template
├── CONTRIBUTING.md                        # ✅ Required
├── CODE_OF_CONDUCT.md                     # ⚠️ Recommended
├── SECURITY.md                            # ⚠️ Recommended
└── CODEOWNERS                             # ⚠️ For projects
```

### Phase 5: Documentation Quality

Validate documentation completeness:

**README.md Sections**:
```markdown
✅ Title/Description
✅ Table of Contents (if > 5 sections)
✅ Installation/Setup Instructions
✅ Usage Examples
✅ Contributing Guidelines (or link to CONTRIBUTING.md)
✅ License (or link to LICENSE)
⚠️ API Documentation (if applicable)
⚠️ Architecture Overview (for complex projects)
⚠️ Troubleshooting (for end-user tools)
```

**Documentation Validation**:
```bash
# Check README exists and has content
wc -l README.md | awk '$1 < 50 {print "⚠️  Short README (< 50 lines)"} $1 >= 50 {print "✅ Adequate README"}'

# Check for common sections
grep -q "## Installation\|## Usage\|## Getting Started" README.md && echo "✅ Has usage docs" || echo "❌ Missing usage docs"

# Check CONTRIBUTING.md exists
test -f .github/CONTRIBUTING.md && echo "✅ CONTRIBUTING.md" || echo "❌ Missing CONTRIBUTING.md"

# Check for links/structure
grep -q "^#" README.md && echo "✅ Has headers" || echo "❌ No headers"
```

### Phase 6: Naming Consistency

Validate repository naming conventions:

```bash
# Get repository name
REPO_NAME=$(basename "$(git rev-parse --show-toplevel)")

# Check naming format
if [[ $REPO_NAME =~ ^[a-z0-9]+-[a-z0-9\-]*\.(app|project|package|scaffold|topic|template|overview|diy)$ ]]; then
  echo "✅ Valid naming format: $REPO_NAME"
else
  echo "❌ Invalid naming: $REPO_NAME"
  echo "   Expected: <name>.<suffix> with lowercase and hyphens"
fi

# Check suffix matches type
SUFFIX="${REPO_NAME##*.}"
TYPE=$(jq -r '.type' .chimera-lab/meta.json)
if [[ "$SUFFIX" == "$TYPE" ]]; then
  echo "✅ Suffix matches type ($SUFFIX)"
else
  echo "⚠️  Suffix ($SUFFIX) vs meta.json type ($TYPE)"
fi
```

### Phase 7: Git Configuration

Validate Git settings:

```bash
# Check .gitignore exists
test -f .gitignore && echo "✅ .gitignore" || echo "❌ Missing .gitignore"

# Check for .gitattributes (useful for multi-platform)
test -f .gitattributes && echo "✅ .gitattributes" || echo "⚠️  No .gitattributes"

# Check Git configuration
git config user.email > /dev/null && echo "✅ Git user configured" || echo "❌ Git user not configured"

# Check for sensitive files in git history (optional)
git log --all --full-history -- "*.key" "*.pem" "*.env" > /dev/null && echo "⚠️  Possible sensitive files in history"
```

### Phase 8: Language/Framework Specific

**Python Projects**:
```bash
# Check for requirements or setup files
ls -la requirements*.txt setup.py pyproject.toml 2>/dev/null | grep -q . && echo "✅ Has dependency file" || echo "❌ Missing dependency file"

# Validate pyproject.toml if present
test -f pyproject.toml && python -c "import tomllib; tomllib.load(open('pyproject.toml', 'rb'))" && echo "✅ Valid pyproject.toml" || echo "❌ Invalid pyproject.toml"
```

**JavaScript/Node Projects**:
```bash
# Check for package.json
test -f package.json && echo "✅ Has package.json" || echo "❌ Missing package.json"

# Validate package.json
node -e "JSON.parse(require('fs').readFileSync('package.json'))" && echo "✅ Valid package.json" || echo "❌ Invalid package.json"
```

**PHP/Laravel Projects**:
```bash
# Check for composer.json
test -f composer.json && echo "✅ Has composer.json" || echo "❌ Missing composer.json"

# Check for Laravel structure
test -d "app" -a -d "routes" && echo "✅ Laravel structure" || echo "⚠️  Not a standard Laravel app"
```

## Validation Automation

Create a validation script:

```bash
#!/bin/bash
# validate-repo.sh - Validate repository structure

REPO_PATH="${1:-.}"
ERRORS=0
WARNINGS=0

check_file() {
  if [ -f "$REPO_PATH/$1" ]; then
    echo "✅ $1"
  else
    echo "❌ Missing $1"
    ((ERRORS++))
  fi
}

check_dir() {
  if [ -d "$REPO_PATH/$1" ]; then
    echo "✅ $1/"
  else
    echo "❌ Missing $1/"
    ((ERRORS++))
  fi
}

echo "=== Repository Validation ==="

# Essential files
check_file "README.md"
check_file "LICENSE"
check_file ".gitignore"
check_file ".chimera-lab/meta.json"

# Essential directories
check_dir ".github"
check_dir ".chimera-lab"
check_dir "docs"

# Results
echo ""
echo "=== Summary ==="
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"

exit $ERRORS
```

## Bulk Validation

For organization-wide validation:

```bash
#!/bin/bash
# validate-org.sh - Validate all repositories

RESULTS_FILE="validation_results.txt"
> "$RESULTS_FILE"

for repo in */; do
  echo "Validating $repo..."
  ./validate-repo.sh "$repo" >> "$RESULTS_FILE" 2>&1
done

# Summary
echo ""
echo "=== Organization Validation Summary ==="
grep "❌" "$RESULTS_FILE" | wc -l | xargs echo "Issues found:"
grep "✅" "$RESULTS_FILE" | wc -l | xargs echo "Items passing:"
```

## Remediation

When validation finds issues:

1. **Missing Files**:
   ```bash
   # Copy from template
   cp /path/to/template/README.md README.md
   # Customize for repository
   # Commit changes
   git add README.md
   git commit -m "docs: add/update README"
   ```

2. **Invalid Metadata**:
   ```bash
   # Fix .chimera-lab/meta.json
   mkdir -p .chimera-lab
   cat > .chimera-lab/meta.json << 'EOF'
   {
     "name": "...",
     "type": "...",
     ...
   }
   EOF
   git add .chimera-lab/meta.json
   git commit -m "chore: update repository metadata"
   ```

3. **Workflow Issues**:
   - Validate YAML syntax
   - Check workflow triggers (branch names, event types)
   - Test locally with act or GitHub CLI
   - Commit fixes

## Success Criteria

Validation is successful when:

1. ✅ All essential files present
2. ✅ Metadata valid and complete
3. ✅ Directory structure matches type
4. ✅ GitHub configuration valid
5. ✅ Documentation comprehensive
6. ✅ Naming follows conventions
7. ✅ Git configuration correct
8. ✅ Language-specific configs present
9. ✅ No critical issues found
10. ✅ Repository matches applied template

## References

- [NAMING_CONVENTIONS.md](../docs/NAMING_CONVENTIONS.md) - Repository suffixes
- [templates.knowledge.md](../knowledge/templates.knowledge.md) - Template details
- [repository.knowledge.md](../knowledge/repository.knowledge.md) - Repository metadata
- [ORGANIZATION_MANAGEMENT.md](../docs/ORGANIZATION_MANAGEMENT.md) - Repository operations
