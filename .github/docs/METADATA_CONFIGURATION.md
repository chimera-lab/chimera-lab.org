# Organization Metadata Configuration

Guide for understanding and maintaining organization metadata in `.chimera-lab/` directory.

## Overview

Metadata in `.chimera-lab/` centralizes organization-wide configuration:

- **labels.json** - Issue label definitions
- **milestones.json** - Release milestone templates
- **repo.json** - Repository planning and filtering
- **meta.json** - Organization metadata
- **settings.json** - Global organization settings

This ensures consistency across all repositories and provides a single source of truth for organization configuration.

## Directory Structure

```
chimera-lab.org/
└── .chimera-lab/
    ├── meta.json              # Organization metadata
    ├── settings.json          # Global settings
    ├── config/
    │   ├── labels.json        # Label definitions
    │   ├── milestones.json    # Milestone templates
    │   └── repo.json          # Repository configuration
    ├── domains/               # Domain-specific configs
    │   ├── projects/
    │   ├── topics/
    │   └── templates/
    ├── repositories/          # Repository snapshots
    ├── utils/                 # Helper scripts
    └── CHANGELOG.md           # Metadata change history
```

## Metadata Files

### 1. meta.json (Organization Metadata)

Main organization metadata file.

**Location**: `.chimera-lab/meta.json`

**Purpose**: Define organization identity, contacts, and core settings

**Template**:
```json
{
  "organization": {
    "name": "chimera-lab.org",
    "title": "Chimera Lab Organization",
    "description": "Multi-repository organization for knowledge, tools, and projects",
    "url": "https://chimera-lab.org",
    "logo": "https://chimera-lab.org/logo.png"
  },
  "contact": {
    "email": "contact@chimera-lab.org",
    "website": "https://chimera-lab.org",
    "repository": "https://github.com/chimera-lab/chimera-lab.org"
  },
  "version": "1.0.0",
  "last_updated": "2024-01-15",
  "governance": {
    "primary_language": "en",
    "timezone": "UTC",
    "decision_model": "consensus"
  },
  "repositories": {
    "total_count": 50,
    "active_count": 45,
    "archived_count": 5
  }
}
```

**Update Frequency**: Quarterly or when organization changes

### 2. settings.json (Global Settings)

Global configuration for all repositories.

**Location**: `.chimera-lab/settings.json`

**Purpose**: Define organization-wide defaults

**Template**:
```json
{
  "github": {
    "organization": "chimera-lab",
    "homepage": "https://chimera-lab.org",
    "email": "contact@chimera-lab.org"
  },
  "repositories": {
    "defaults": {
      "visibility": "public",
      "has_wiki": false,
      "has_projects": true,
      "has_downloads": true,
      "is_template": false,
      "allow_forking": true,
      "allow_squash_merge": true,
      "allow_merge_commit": true,
      "allow_rebase_merge": true
    },
    "protection": {
      "require_pull_request_reviews": 1,
      "require_status_checks": true,
      "require_branches_up_to_date": true,
      "enforce_admins": true
    }
  },
  "labels": {
    "source": "labels.json",
    "apply_on_creation": true
  },
  "milestones": {
    "source": "milestones.json",
    "template": "quarterly"
  },
  "automation": {
    "stale_issue_days": 90,
    "archive_old_issues": false,
    "auto_delete_old_releases": false
  }
}
```

**Update Frequency**: As needed when policies change

### 3. labels.json (Issue Labels)

Centralized label definitions.

**Location**: `.chimera-lab/config/labels.json`

**Purpose**: Ensure consistent labels across repositories

**Current Categories**:
- **common**: Bug, docs, enhancement, help wanted, etc.
- **general**: Logic, performance, security, testing, etc.
- **infrastructure**: Containerization, orchestration, monitoring, etc.
- **interface**: UI, UX, mobile, CLI, etc.
- **embedded**: Hardware, firmware, OS-level, etc.
- **study**: Terminology, guides, examples, exercises, etc.
- **organization**: Templates, org rules, scopes, priorities, efforts, etc.

**Adding New Labels**:
```json
{
  "name": "type:new-type",
  "description": "Description of the label",
  "color": "#ff0000"
}
```

**Guidelines**:
- Use prefixes: `type:`, `priority:`, `scope:`, `status:`, `effort:`, `area:`
- Stick to standard colors (red for critical, green for done, etc.)
- Keep descriptions concise (one line)
- Document purpose of new labels

### 4. milestones.json (Release Milestones)

Template for release milestones.

**Location**: `.chimera-lab/config/milestones.json`

**Purpose**: Define standard milestone structure for releases

**Template**:
```json
{
  "templates": [
    {
      "name": "Q1 2024 Release",
      "description": "First quarter 2024 release cycle",
      "due_date": "2024-03-31",
      "state": "open"
    },
    {
      "name": "Q2 2024 Release",
      "description": "Second quarter 2024 release cycle",
      "due_date": "2024-06-30",
      "state": "open"
    }
  ],
  "defaults": {
    "pattern": "Q? YYYY Release",
    "schedule": "quarterly",
    "duration_days": 90
  }
}
```

**Update Frequency**: Quarterly (before each new quarter)

### 5. repo.json (Repository Configuration)

Repository planning and filtering.

**Location**: `.chimera-lab/config/repo.json`

**Purpose**: Track repository status and special configurations

**Current Structure**:
```json
{
  "planned": [],          // Repositories planned but not yet created
  "ignored": [],          // Repositories to exclude from repositories
  "special_handling": {}  // Special configuration for specific repos
}
```

**Example Usage**:
```json
{
  "planned": [
    {
      "name": "chimera-lab-website",
      "type": "project",
      "status": "in-development",
      "estimated_completion": "2024-03-01"
    }
  ],
  "ignored": [
    "docker-scaffold.topic",  // Scaffold, not a real project
    "template.topic"           // Templates not independent
  ],
  "special_handling": {
    "chimera-lab-cli.app": {
      "rules": ["require-cli-specific-tests"],
      "templates": ["app.template", "python.template"]
    }
  }
}
```

**Update Frequency**: As repositories are added/removed

### 6. Domain-Specific Configs

Configurations specific to repository types/domains.

**Location**: `.chimera-lab/domains/`

**Examples**:
- `projects/config.json` - Settings for all `.project` repositories
- `topics/config.json` - Settings for all `.topic` repositories
- `templates/config.json` - Settings for template repositories

**Example Content**:
```json
// .chimera-lab/domains/projects/config.json
{
  "type": "project",
  "required_files": [
    ".github/workflows/test.yml",
    ".github/workflows/lint.yml",
    "README.md",
    "LICENSE",
    ".chimera-lab/meta.json"
  ],
  "required_sections_in_readme": [
    "Overview",
    "Installation",
    "Usage",
    "Contributing",
    "License"
  ],
  "standard_milestones": [
    "v1.0",
    "v1.1",
    "v2.0"
  ]
}
```


### Validation Checklist

When updating metadata, verify:

- [ ] All JSON files have valid syntax
- [ ] All required fields present
- [ ] Labels have unique names
- [ ] Colors are valid hex codes
- [ ] Milestones have due dates
- [ ] No duplicate entries
- [ ] References point to existing items
- [ ] Descriptions are clear and concise
- [ ] Version number incremented
- [ ] Last_updated timestamp current
- [ ] No sensitive information exposed

```markdown
# Metadata Changelog

## [1.1.0] - 2024-01-15

### Added
- label: type:org-rule (organization rules)
- label: scope:org-wide (organization-wide scope)
- milestone: Q1 2024 Release

### Changed
- Updated organization name to chimera-lab.org
- Expanded label color palette

### Fixed
- Corrected milestone due date format

## [1.0.0] - 2024-01-01

### Initial Release
- Organization metadata structure
- Label definitions
- Milestone templates
- Repository configuration
```

## Best Practices

### Do's
- ✅ Use consistent naming (lowercase with hyphens)
- ✅ Document purpose of each label/milestone
- ✅ Keep JSON properly formatted
- ✅ Version metadata changes
- ✅ Regularly validate syntax
- ✅ Announce changes to team
- ✅ Synchronize across repositories
- ✅ Archive old milestones

### Don'ts
- ❌ Use colors without meaning
- ❌ Create duplicate labels
- ❌ Leave out descriptions
- ❌ Break JSON structure
- ❌ Store sensitive data
- ❌ Forget to commit changes
- ❌ Let milestones accumulate indefinitely
- ❌ Create repository-specific labels (use central ones)

## References

- [ORGANIZATION_STRUCTURE.md](./ORGANIZATION_STRUCTURE.md) - Organization overview
- [ORGANIZATION_MANAGEMENT.md](./ORGANIZATION_MANAGEMENT.md) - Operational procedures
- [NAMING_CONVENTIONS.md](./NAMING_CONVENTIONS.md) - Label naming conventions
- [RULES.md](../.github/RULES.md) - Organization rules
- [templates.knowledge.md](../docs/knowledge/templates.knowledge.md) - Template system
- [repository.knowledge.md](../docs/knowledge/repository.knowledge.md) - Repository standards
