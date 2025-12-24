# Project Coordination Framework

Framework for coordinating features, dependencies, and releases across multiple repositories in the chimera-lab.org organization.

## Overview

The chimera-lab.org organization consists of multiple independent repositories organized into topics and projects. Successful coordination requires clear frameworks for:

- **Feature tracking** across repositories
- **Dependency management** between projects
- **Release coordination** for synchronized deployments
- **Migration planning** for organization-wide changes
- **Communication patterns** between project teams

This document establishes the framework for effective multi-project coordination.

## Feature Tracking Across Repositories

### Single Repository Features

Features contained within one repository use standard GitHub issues:

```
Repository: chimera-lab-cli.app
├── Feature: Add new command
├── Assigned to: CLI team
├── Milestone: v2.0
└── Related: only internal issues
```

**Process**:
1. Create issue in repository
2. Link to milestone for release planning
3. Use labels for categorization
4. Link to PRs for implementation tracking

### Cross-Repository Features

Features that span multiple repositories require coordination:

**Example**: "Support OAuth in all applications"
- Affects: `chimera-lab-chat.project`, `chimera-lab-blog.project`, `chimera-lab-store.project`
- Shared implementation: `chimera-lab-auth.package` (new library)
- Coordination point: Feature tracking issue in central organization repo

**Process**:

1. **Create Master Feature Issue**:
   - Location: Main organization repository (if exists) or central project
   - Title: "Feature: [Cross-Repo Feature Name]"
   - Label: `scope:cross-repo`
   - Content: Summary and list of affected repositories

   ```markdown
   # Feature: OAuth Support Across Applications
   
   ## Overview
   Support OAuth 2.0 authentication across all user-facing applications.
   
   ## Affected Repositories
   - chimera-lab-chat.project - chat authentication
   - chimera-lab-blog.project - blog authentication
   - chimera-lab-store.project - store authentication
   
   ## Shared Components
   - New package: chimera-lab-auth.package (dependency)
   
   ## Timeline
   - Phase 1: Create auth package (Week 1-2)
   - Phase 2: Integrate into chat (Week 3)
   - Phase 3: Integrate into blog (Week 4)
   - Phase 4: Integrate into store (Week 5)
   
   ## Tracking
   - [ ] Auth package created (#123)
   - [ ] Chat integration (#124)
   - [ ] Blog integration (#125)
   - [ ] Store integration (#126)
   ```

2. **Create Repository-Specific Issues**:
   - One issue per affected repository
   - Link back to master feature issue
   - Include: scope, dependencies, timeline, acceptance criteria

   ```markdown
   # Implement OAuth Support
   (Chat Application)
   
   Related to: [Master Issue #100]
   Blocking: Deployment of chat v2.0
   
   ## Requirements
   - Integrate chimera-lab-auth.package
   - Update login flow
   - Migrate existing sessions
   - Update UI for OAuth providers
   
   ## Dependencies
   - chimera-lab-auth.package v1.0+ (Issue #123)
   
   ## Acceptance Criteria
   - [ ] OAuth login functional
   - [ ] Session migration complete
   - [ ] All tests passing
   - [ ] Backwards compatible with existing sessions
   ```

3. **Track Progress**:
   - Master issue links to all sub-issues
   - Use GitHub's "Linked Issues" feature
   - Update master issue as sub-issues progress
   - Close master issue when all sub-issues complete

### Feature Communication

Coordinate via:

1. **Linked Issues** (GitHub):
   - Use "Related to" for informational links
   - Use "Blocks" for dependency relationships
   - Use "Duplicates" for consolidation

2. **GitHub Discussions**:
   - Create discussion for cross-repo features
   - Include: timeline, affected teams, technical approach
   - Reference specific issues with `#123`

3. **Regular Standups**:
   - Weekly cross-repo team sync (if multiple projects active)
   - Review cross-repo feature progress
   - Identify blockers and dependencies
   - Update timeline if needed

---

## Dependency Management

### Types of Dependencies

**Code Dependencies**:
- Package/library used by another project
- Example: `chimera-lab-laravel.package` used by `chimera-lab-blog.project`
- Managed via: composer.json, package.json, requirements.txt

**Feature Dependencies**:
- Feature in one repo depends on feature in another
- Example: Blog can't deploy v2.0 until auth package v1.0 is released
- Managed via: Issue milestones and linked issues

**Data Dependencies**:
- Data format or API changes affecting multiple repos
- Example: User schema change affects chat, blog, and store
- Managed via: Migration plans and coordinated deployments

**Infrastructure Dependencies**:
- Shared infrastructure (database, cache, message queue)
- Example: All apps use same Redis instance
- Managed via: Deployment coordination and maintenance windows

### Managing Code Dependencies

#### Declaring Dependencies

In each repository, document external dependencies:

```
# In repository README or docs/DEPENDENCIES.md

## External Dependencies

### Libraries
- chimera-lab-laravel.package (v1.0+) - Laravel utilities
- chimera-lab-auth.package (v2.0+) - Authentication

### Services
- Redis (v6.0+) - Caching
- PostgreSQL (v12+) - Database

### Organization Repositories
- chimera-lab-docker-stack.project - Docker environment setup
```

#### Version Constraints

Use semantic versioning with conservative constraints:

```json
// package.json (JavaScript)
{
  "dependencies": {
    "chimera-lab-auth": "^2.0.0"  // Compatible with 2.x
  }
}
```

```yaml
# requirements.txt (Python)
chimera-lab-utils>=1.0.0,<2.0.0  # Compatible with 1.x
```

```json
// composer.json (PHP)
{
  "require": {
    "chimera-lab/laravel": "~1.1"  // Compatible with 1.1.x
  }
}
```

#### Updating Dependencies

Process for updating shared libraries:

1. **Plan Update**:
   - Check which repos use library
   - Review breaking changes
   - Create task in library repository

2. **Release New Version**:
   - Update version following semver
   - Document changes in CHANGELOG
   - Create release tag
   - Publish to package registry

3. **Notify Dependent Projects**:
   - Create issue in each dependent repo
   - Include: migration guide, timeline, deprecation notice
   - Link to release notes

4. **Coordinate Updates**:
   - Set deadline for update (e.g., 30 days)
   - For breaking changes: mandatory update before deprecation
   - Track update progress

### Managing Feature Dependencies

#### Blocking Features

When feature A blocks feature B:

```markdown
# Feature: Chat v2.0 Release

## Blockers
- Auth package must be released (#100)
- User schema migration must complete (#101)

## Blocked By
- Issue #100: OAuth implementation in auth package
```

#### Tracking in Milestones

Use milestones for coordinated releases:

```
Milestone: Q1 2024 Release
├── chimera-lab-blog.project v2.0
│   ├── Issue #50: OAuth support (Blocked by #100)
│   ├── Issue #51: New dashboard
│   └── Issue #52: Performance optimization
├── chimera-lab-chat.project v1.5
│   ├── Issue #60: Message reactions
│   └── Issue #61: File sharing
└── chimera-lab-auth.package v1.0
    ├── Issue #100: OAuth implementation
    └── Issue #101: LDAP support
```

---

## Release Coordination

### Release Types

**Independent Release** (Single Repository):
- Repository has no cross-repo dependencies
- Process: Standard semantic versioning
- Example: `docker.overview` v1.1.0

**Dependent Release** (With Dependencies):
- Repository depends on other repos
- Must wait for dependencies to be released first
- Example: `chimera-lab-blog.project` depends on `chimera-lab-auth.package`

**Coordinated Release** (Multiple Repositories):
- Multiple repos released together
- Requires synchronization
- Example: Q1 2024 release with blog, chat, and store updates

**Breaking Change Release**:
- Requires migration steps for dependent projects
- Requires notification and timeline
- Requires version bump and migration guide

### Release Process

#### Independent Release

```
Repository: chimera-lab-docker-stack.project
Version: 1.2.0 (v1.1.0 → v1.2.0)
Type: Minor (new feature, backwards compatible)

1. Development on main branch
2. Code review and testing
3. Tag release: git tag -a v1.2.0
4. Push tag: git push origin v1.2.0
5. Create GitHub Release with changelog
6. Close milestone v1.2.0
7. Update documentation if needed
```

#### Dependent Release

```
Repository: chimera-lab-blog.project
Depends on: chimera-lab-auth.package v2.0

1. Wait for chimera-lab-auth.package to release v2.0
2. Update dependency:
   composer require chimera-lab/auth:^2.0
3. Update code to use new auth API
4. Test thoroughly
5. Create release (tag and push)
6. Update dependency version in docs
```

#### Coordinated Release

```
Timeline: March 1, 2024 - Q1 2024 Release

Plan Phase (Feb 15):
├── Create milestone: "Q1 2024 Release"
├── List all features targeting release
├── Identify dependencies
└── Create coordination issue

Development Phase (Feb 15 - Feb 28):
├── chimera-lab-auth.package: OAuth support
├── chimera-lab-blog.project: OAuth integration
├── chimera-lab-chat.project: OAuth integration
└── chimera-lab-store.project: OAuth integration

Testing Phase (Feb 28 - Mar 1):
├── Integration testing across all repos
├── End-to-end testing
├── Performance testing
└── Security audit

Release Phase (Mar 1):
1. Release chimera-lab-auth.package v2.0
2. Release chimera-lab-blog.project v3.0
3. Release chimera-lab-chat.project v2.0
4. Release chimera-lab-store.project v1.5
5. Create blog post announcing release
6. Update organization documentation
```

### Release Checklist

For each release:

```markdown
## Release: [Repository] v[Version]

### Pre-Release
- [ ] All PRs merged and tested
- [ ] Dependencies updated to required versions
- [ ] CHANGELOG updated
- [ ] Version number bumped
- [ ] Documentation updated
- [ ] Breaking changes documented
- [ ] Migration guide created (if needed)

### Release
- [ ] Tag created: git tag -a v[Version]
- [ ] Tag pushed: git push origin v[Version]
- [ ] GitHub Release created
- [ ] Package published (if applicable)
- [ ] Announcement posted

### Post-Release
- [ ] Milestone closed
- [ ] Dependent projects notified
- [ ] Update to dependent repositories planned
- [ ] Issue tracking updated
- [ ] Documentation links updated
- [ ] Team notified of release
```

---

## Migration Planning

### Organization-Wide Migrations

Migrations affect multiple repositories simultaneously:

**Examples**:
- Change all repositories from Node.js 16 to 18
- Migrate from one database to another
- Change authentication system organization-wide
- Update all Docker images to new version

### Migration Planning Process

1. **Proposal Phase**:
   ```markdown
   # Proposal: Migrate to Node.js 18
   
   ## Motivation
   - Node.js 16 reaches EOL in September 2023
   - Node.js 18 has significant performance improvements
   - Security updates only available in 18+
   
   ## Affected Repositories
   - chimera-lab-blog.project
   - chimera-lab-chat.project
   - chimera-lab-website.project
   
   ## Timeline
   - Feb: Internal migration in dev environment
   - Mar: Staggered production migration
   - Apr 1: All repos running Node.js 18
   
   ## Risks
   - Dependency incompatibilities
   - Performance regression
   - Breaking changes in libraries
   ```

2. **Planning Phase**:
   - Audit all affected repositories
   - Identify compatibility issues
   - Plan rollback strategy
   - Create detailed migration steps
   - Define testing requirements

3. **Pilot Phase**:
   - Migrate lowest-risk repository first
   - Document actual issues vs predicted
   - Refine migration process
   - Test thoroughly

4. **Rollout Phase**:
   - Follow planned order
   - Monitor each migration
   - Support teams during migration
   - Document actual vs. planned timeline

5. **Completion Phase**:
   - Verify all repositories migrated
   - Update documentation
   - Archive old environment docs
   - Conduct retrospective

### Migration Coordination

**Communication**:
- Create GitHub issue for each step
- Label: `scope:org-wide`, `type:migration`
- Update daily in organization meeting/discussion

**Rollback Plan**:
- Document rollback steps for each repository
- Keep old version available during transition
- Define rollback conditions (e.g., "if > 5% performance regression")

**Success Metrics**:
- All tests passing in new environment
- Performance metrics within acceptable range
- Zero critical bugs in production
- User-reported issues < threshold

---

## Communication Patterns

### Issue-Based Communication

Use GitHub issues for documentation:

```
Issue #100: Support OAuth across applications

Description: [Complete feature description]

Timeline:
- Week 1: Auth package development
- Week 2: Chat integration
- Week 3: Blog integration
- Week 4: Store integration

Tracking:
- [x] Auth package created
- [ ] Chat integration (#101)
- [ ] Blog integration (#102)
- [ ] Store integration (#103)

Communication: @project-manager weekly updates
```

### Discussion-Based Communication

Use GitHub Discussions for conversations:

- **Topic**: "Q1 2024 Release Planning"
- **Participants**: All project leads
- **Updates**: Weekly summaries
- **Decisions**: Link to decisions made

### Meeting-Based Communication

For complex coordination:

**Weekly Sync** (Optional, if > 3 active projects):
- Attendees: Project leads, organization manager
- Duration: 30 minutes
- Agenda:
  1. Cross-repo feature progress (5 min)
  2. Blocking issues (10 min)
  3. Timeline adjustments (10 min)
  4. Next week actions (5 min)

**Monthly Planning** (Quarterly if slow):
- Attendees: All project leads, architects
- Duration: 2 hours
- Agenda:
  1. Roadmap review (30 min)
  2. Dependency planning (30 min)
  3. Release planning (30 min)
  4. Resource allocation (30 min)

### Status Updates

**Weekly Status Template**:
```markdown
# Project Status: [Project Name]

## Progress This Week
- Completed: [Features/tasks]
- In Progress: [Current work]
- Blockers: [Issues blocking progress]

## Next Week
- Planned work: [What's coming]
- Dependencies needed: [What other repos must do]
- Risks: [Potential issues]

## Cross-Repo Impact
- Affects: [Other repositories]
- Timeline: [When they'll be impacted]
- Actions needed: [What other teams must do]
```

---

## Multi-Project Dependency Graph

### Visualization

Document project dependencies:

```
chimera-lab.org

[auth.package] v2.0
├── chimera-lab-blog.project (depends)
├── chimera-lab-chat.project (depends)
└── chimera-lab-store.project (depends)

[laravel.package] v1.0
├── chimera-lab-blog.project (depends)
└── chimera-lab-website.project (depends)

[docker-stack.project] v1.2.0
├── chimera-lab-docker.topic (uses)
└── All projects (optional dependency)
```

### Dependency Matrix

Create matrix for complex dependencies:

| Project | Depends On | Version | Status |
|---------|-----------|---------|--------|
| blog | auth.package | ^2.0 | ✅ |
| blog | laravel.package | ^1.0 | ✅ |
| chat | auth.package | ^2.0 | ✅ |
| store | auth.package | ^2.0 | ⏳ (waiting for v2.0 release) |

---

## Handling Breaking Changes

### Deprecation Process

For libraries with breaking changes:

1. **Announce** (Release N):
   - Tag version N
   - Document deprecation in CHANGELOG
   - Announce in release notes
   - Give 3+ months notice

2. **Support** (Releases N to N+2):
   - Maintain old API alongside new
   - Add deprecation warnings
   - Document migration path
   - Fix bugs in both versions

3. **Remove** (Release N+3+):
   - Remove old API
   - Release as major version bump
   - Require all dependent projects to migrate
   - Archive old documentation

### Migration Assistance

For dependent projects:

1. **Create Migration Guide**:
   ```markdown
   # Migration Guide: [Library] v2.0
   
   ## Breaking Changes
   - AuthService constructor changed
   - Response format updated
   
   ## Migration Steps
   ### Before (v1.x)
   ```php
   $auth = new AuthService($config);
   $user = $auth->login();
   ```
   
   ### After (v2.0)
   ```php
   $auth = Auth::factory($config);
   $user = $auth->authenticate();
   ```
   ```

2. **Offer Support**:
   - Available for questions
   - Help debug issues during migration
   - Extend deadline if needed
   - Create documented examples

3. **Track Migrations**:
   - Create issue for each dependent project
   - Track completion status
   - Provide timeline
   - Celebrate completion

---

## Escalation and Conflict Resolution

### Issue Escalation

If project conflict arises:

1. **Discuss** (Issue comment):
   - Clearly state the problem
   - Propose solution
   - Ask for feedback

2. **Escalate** (GitHub Discussion):
   - If no agreement in 24 hours
   - Involve project leads
   - Document viewpoints

3. **Decide** (Architecture review):
   - If still unresolved
   - Involve architects/leadership
   - Document decision
   - Communicate clearly

### Conflict Types

**Resource Conflict**:
- Problem: Two projects need same person
- Solution: Priority by milestone, shuffle tasks

**Timeline Conflict**:
- Problem: Dependent releases have incompatible timelines
- Solution: Adjust timeline, add buffer, communicate early

**Technical Conflict**:
- Problem: Two approaches to shared problem
- Solution: Technical review, consensus, document decision

**Priority Conflict**:
- Problem: Projects prioritize features differently
- Solution: Business prioritization, leadership decision

---

## Success Metrics

Track coordination effectiveness:

| Metric | Target | Measurement |
|--------|--------|-------------|
| **On-Time Releases** | 95%+ | Percent of releases meeting planned date |
| **Dependency Health** | 100% | No outdated dependencies in production |
| **Cross-Repo Features** | < 2 weeks | Average time from feature proposal to delivery |
| **Blocking Issues** | < 5/month | Critical blockers in issue tracking |
| **Communication Timeliness** | 24 hours | Time to respond to cross-repo requests |
| **Escalation Resolution** | < 1 week | Time to resolve escalated issues |

---

## References

- [ORGANIZATION_MANAGEMENT.md](./ORGANIZATION_MANAGEMENT.md) - Organization operations
- [RULES.md](../.github/RULES.md) - Organization rules and conventions
- [templates.knowledge.md](../.github/knowledge/templates.knowledge.md) - Template management
- [repository.knowledge.md](../.github/knowledge/repository.knowledge.md) - Repository standards
- [NAMING_CONVENTIONS.md](./NAMING_CONVENTIONS.md) - Repository naming guide
