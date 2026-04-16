---
name: automate
description: CI/CD workflows, deployment patterns, and automation management
---

# :file_folder: Automate

## :book: Table of Contents

<!-- toc -->

## :telescope: Overview

Automate handles CI/CD workflows, deployment patterns, and release automation. Coordinates GitHub Actions, version management, and automated testing pipelines.

## :world_map: Guides

### :world_map: Workflow Management

- GitHub Actions workflows in `.github/workflows/`.
- Use reusable workflows for common patterns.
- Trigger workflows on push, pull request, or schedule.
- Monitor workflow runs with `gh run list` and `gh run view`.

### :world_map: Deployment Patterns

- Targets: `main` (production), `develop` (staging), feature branches (preview).
- Pre-deploy: update CHANGELOG.md, bump version, run tests.
- Post-deploy: verify functionality, monitor errors.
- Use environment-specific configuration and secrets.

### :world_map: Release Automation

- Version tag: `git tag -a v{MAJOR}.{MINOR}.{PATCH} -m "Release v{version}"`.
- Follow semantic versioning: MAJOR (breaking), MINOR (features), PATCH (fixes).
- Generate release notes from CHANGELOG.md.
- Use `gh release create` for GitHub releases.

### :world_map: Output

- Workflow run status and logs.
- Deployment verification results.
- Release artifacts and notes.

## :books: References

- [:page_facing_up: ../../../docs/knowledge/automation.knowledge.md](../../../docs/knowledge/automation.knowledge.md)
- [:page_facing_up: ../../../docs/knowledge/deployment.knowledge.md](../../../docs/knowledge/deployment.knowledge.md)
