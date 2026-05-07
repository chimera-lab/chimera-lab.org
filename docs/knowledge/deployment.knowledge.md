---
name: deployment
description: Patterns for releasing, versioning, and deploying <!-- <var key="org.name" applied> -->chimera-lab<!-- </var> --> projects
---

# :file_folder: Deployment Knowledge

## :book: Table of Contents

- [:file_folder: Deployment Knowledge](./#file_folder-deployment-knowledge)
  - [:telescope: Overview](./#telescope-overview)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Semantic Versioning](./#world_map-semantic-versioning)
    - [:world_map: Release Process](./#world_map-release-process)
    - [:world_map: Environment Management](./#world_map-environment-management)
    - [:world_map: Deployment Verification](./#world_map-deployment-verification)
  - [:books: References](./#books-references)

## :telescope: Overview

Deployment knowledge covers semantic versioning, release processes, environment management, and deployment verification. Follow conventional practices for versioning, tagging, changelog updates, and environment-specific configurations.

## :world_map: Guides

### :world_map: Semantic Versioning

- Format: `v{MAJOR}.{MINOR}.{PATCH}` (e.g., v1.2.3).
- MAJOR: breaking changes, incompatible API modifications.
- MINOR: new features, backward-compatible additions.
- PATCH: bug fixes, backward-compatible corrections.
- Pre-release: append `-alpha`, `-beta`, `-rc` (e.g., v1.0.0-beta.1).
- Use `cmr repo milestones list` to plan version increments.

### :world_map: Release Process

- Update CHANGELOG.md with release notes grouped by type (Added, Changed, Fixed, Removed).
- Bump version in package metadata (package.json, pyproject.toml, Cargo.toml, etc.).
- Run full test suite and linters before tagging.
- Create annotated tag: `git tag -a v{version} -m "Release v{version}"`.
- Push tag: `git push origin v{version}`.
- Create GitHub release with changelog except and artifacts.
- Verify deployment in target environment.

### :world_map: Environment Management

- Environments: production (`main`), staging (`develop`), feature branches (preview).
- Use environment-specific configuration files (.env, config.yaml, etc.).
- Store sensitive credentials in environment variables or secret management systems.
- Use GitHub Environments to define deployment targets with protection rules.
- Branch protection: require reviews, passing checks before merging to `main`.

### :world_map: Deployment Verification

- Smoke tests: verify critical functionality post-deployment.
- Monitor logs, error rates, and performance metrics.
- Rollback strategy: revert to previous tag if issues detected.
- Use `cmr repo status` to check repository state before deployment.
- Document rollback procedures in DEVELOPMENT.md or deployment runbooks.

## :books: References

- [:page_facing_up: ../ARCHITECTURE.md](../ARCHITECTURE.md)
- [:page_facing_up: ../../CHANGELOG.md](../../CHANGELOG.md)
- [:page_facing_up: operating.knowledge.md](operating.knowledge.md)
- [:page_facing_up: validating.knowledge.md](validating.knowledge.md)
