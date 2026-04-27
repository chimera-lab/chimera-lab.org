# :file_folder: Roadmap

## :book: Table of Contents

- [:file_folder: Roadmap](./#file_folder-roadmap)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Workstream 1: Publish Existing Repositories](./#world_map-workstream-1-publish-existing-repositories)
      - [:world_map: Phase 0: npm Publish Pipeline](./#world_map-phase-0-npm-publish-pipeline)
      - [:world_map: Phase 1: Template Repository Publication](./#world_map-phase-1-template-repository-publication)
      - [:world_map: Phase 2: Content Repository Publication](./#world_map-phase-2-content-repository-publication)
      - [:world_map: Phase 1: App Scaffold](./#world_map-phase-1-app-scaffold)
      - [:world_map: Phase 2: Content Discovery and Processing](./#world_map-phase-2-content-discovery-and-processing)
      - [:world_map: Phase 3: Web Layer](./#world_map-phase-3-web-layer)
      - [:world_map: Phase 4: Integration](./#world_map-phase-4-integration)
      - [:world_map: Phase 5: Polish](./#world_map-phase-5-polish)
  - [:memo: To-Do List](./#memo-to-do-list)
    - [:memo: Publication Readiness](./#memo-publication-readiness)
    - [:memo: Content App Delivery](./#memo-content-app-delivery)
    - [:memo: Integration Exit Criteria](./#memo-integration-exit-criteria)
  - [:books: References](./#books-references)

## :telescope: Overview

This roadmap replaces the generic template with the concrete implementation order for the chimera-lab organization super-repo. The sequence is intentionally strict:

1. Publish the reusable repositories and packages that already exist.
2. Build `chimera-lab-content.app` as a separate Node.js application that consumes those published packages.

The dependency is structural, not optional. The content application should not be presented as a public organization deliverable until the reusable CLI packages, templates, and publishable topic repositories are visible and consumable. This aligns with the execution order described in [:page_facing_up: knowledge/planning.knowledge.md](knowledge/planning.knowledge.md) and should drive the next entries in [:page_facing_up: ../CHANGELOG.md](../CHANGELOG.md).

**Organization Goal**: turn the current private working set into a public publishing pipeline, then use that pipeline to power a content site generator that renders organization knowledge directly from the filesystem and git history.

**Non-Negotiable Decisions**:

- `chimera-lab-content.app` is a separate repository.
- The app is a Node.js service that imports `@chimera-lab/core`, `@chimera-lab/services`, and `@chimera-lab/documents` from the GitHub npm registry.
- Published content is double-gated: repository `meta.json` must set `public: true`, and each published Markdown document must set frontmatter `public: true`.
- No database is introduced in the first implementation. Content remains filesystem-based and git-backed.
- Git history is the fallback source for `date`, `updated`, and `author` when those values are absent from frontmatter.

## :building_construction: Structure

## :world_map: Guides

### :world_map: Workstream 1: Publish Existing Repositories

This workstream makes the current reusable assets public and consumable. It must complete before the content application can be positioned as a public product.

**Target Outcome**: public packages can be installed from GitHub Packages, public templates can be browsed and cloned, and public `.topic` repositories can be scanned by the content application.

**Scope**:

- CLI monorepo packages to publish:
  - `@chimera-lab/core` for AST, types, and frontmatter parsing
  - `@chimera-lab/services` for settings, git, organization discovery, and resolvers
  - `@chimera-lab/documents` for document discovery and loaders
  - `@chimera-lab/rules` for validation rules
  - `@chimera-lab/cli` for the CLI binary
- Template repositories to make public:
  - `repository.template`
  - `topic.template`
  - `scaffold.template`
- Content repositories to make public:
  - all `.topic` repositories with content worth publishing, after audit and explicit metadata opt-in

#### :world_map: Phase 0: npm Publish Pipeline

The first milestone is package publication from the CLI monorepo.

- Add `publishConfig` to each package in the CLI monorepo so packages resolve to the GitHub npm registry.
- Confirm package names, scopes, repository metadata, and `files` exports are correct before first release.
- Create a GitHub Actions workflow that publishes packages on tag or release creation.
- Ensure the workflow supports monorepo package publishing without leaking private packages or internal-only assets.
- Verify install flow from a clean Node.js environment using GitHub Packages authentication.
- Document tag and release conventions so package publication is deterministic.

#### :world_map: Phase 1: Template Repository Publication

The template repositories are already on GitHub and need visibility changes plus a final readiness pass.

- Review `repository.template`, `topic.template`, and `scaffold.template` for private-only references.
- Remove or rewrite placeholder text that assumes private usage only.
- Confirm documentation, license, and repository metadata are publication-ready.
- Switch repository visibility to public.
- Verify template consumers can discover them without relying on private dependencies.

#### :world_map: Phase 2: Content Repository Publication

Public content should only include repositories that are ready to be indexed and shown externally.

- Inventory all `.topic` repositories in the organization.
- Classify each repository as `publish now`, `publish after cleanup`, or `keep private`.
- For every repository approved for publication, set repository-level `meta.json` to `public: true`.
- Remove or rewrite private notes, drafts, placeholders, or internal-only references before visibility changes.
- Change GitHub visibility to public only after the repository metadata and content audit pass.
- Leave non-ready repositories private until they meet the same gate.

**Operational Gates for Workstream 1**:

- GitHub Packages installs succeed for the published `@chimera-lab/*` packages.
- Public templates are visible and self-descriptive.
- Public `.topic` repositories have `meta.json` with `public: true`.
- No repository is made public unless its public surface has been intentionally reviewed.

**Workstream 2: Build `chimera-lab-content.app`**

This workstream creates a dedicated Node.js application that reuses the organization's existing document and repository logic instead of reimplementing it.

**Architecture Decision**: `chimera-lab-content.app` is a separate repository and imports the reusable packages from the GitHub npm registry.

**Primary Goal**: render publishable content from public chimera-lab repositories with no database, using repository metadata, frontmatter, and git history as the source of truth.

**Core Reuse Requirement**:

- Reuse 100% of the existing CLI package capabilities that already solve frontmatter parsing, AST handling, meta.json loading, organization discovery, directive resolution, and git operations.
- Do not fork or duplicate those concerns inside the new application unless a package boundary change is required in the CLI monorepo.

#### :world_map: Phase 1: App Scaffold

Build the new repository as a minimal service with clean package consumption boundaries.

- Create `chimera-lab-content.app` as a new repository.
- Use Node.js and TypeScript.
- Choose Express or Fastify based on simplest operational fit and existing team preference.
- Add dependencies for `@chimera-lab/core`, `@chimera-lab/services`, and `@chimera-lab/documents` from GitHub Packages.
- Establish environment configuration for organization root paths, repository discovery, package registry auth, and cache settings.
- Define clear module boundaries for discovery, transformation, rendering, and delivery.

#### :world_map: Phase 2: Content Discovery and Processing

This phase turns repository files into normalized publishable content records.

- Implement `ContentDiscoveryService` to scan repositories for `meta.json` where `public: true`.
- Implement `FrontmatterPublishService` to load Markdown files and keep only documents where frontmatter `public: true`.
- Enforce the double gate: repository-level opt-in and document-level opt-in must both be true.
- Implement `GitMetadataService` to infer `date`, `updated`, and `author` from git history when frontmatter does not define them.
- Implement `MarkdownRenderService` using `markdown-it` to convert Markdown to HTML and resolve directives through the existing package logic.
- Normalize output fields for title, slug, description, tags, category, layout, excerpt, dates, and author.

**Published Frontmatter Schema**:

```yaml
---
public: true
title: "My Article"
slug: my-article
description: "..."
tags: [node, cli]
category: tutorials
layout: default
excerpt: "..."
# Auto-inferred from git when absent:
# date, updated, author
---
```

**Inference Rules**:

- `title` falls back to the first H1.
- `slug` falls back to the filename.
- `date`, `updated`, and `author` fall back to git history.
- Repositories or documents missing the `public: true` gate are excluded from output.

#### :world_map: Phase 3: Web Layer

This phase exposes normalized content through routes and templates.

- Add route handlers and controllers for index pages, topic pages, document pages, feeds, and health checks.
- Choose an HTML rendering strategy:
  - port the existing blade-components concepts into a Node.js-compatible view layer, or
  - use a template engine such as Nunjucks or EJS.
- Build CSS from design tokens aligned with `blade-design-system` so presentation stays consistent with existing organization styling.
- Generate navigation from repository hierarchy, topic structure, and document metadata.
- Keep rendering deterministic so static caching and downstream integration stay simple.

#### :world_map: Phase 4: Integration

This phase determines how the content app fits into the broader organization website stack.

- Integrate with `chimera-lab-website.project`.
- Decide whether Laravel consumes the Node.js application as an API or whether the Node.js app serves content directly.
- Add Docker packaging for local development and deployment parity.
- Implement filesystem and render caching to avoid repeated full scans on every request.
- Define deployment inputs, environment variables, and container runtime expectations.

#### :world_map: Phase 5: Polish

This phase turns the internal renderer into a publishable public-facing application.

- Add sitemap generation.
- Add RSS feed generation.
- Add search across published content.
- Improve navigation generation from repository and document hierarchy.
- Add SEO metadata handling for title, description, canonical URLs, and social preview tags.
- Close remaining presentation gaps before public launch.

**Operational Gates for Workstream 2**:

- The app installs published `@chimera-lab/*` packages without local path dependencies.
- Public repositories and documents are filtered correctly through the double gate.
- Git metadata inference works when frontmatter omits date fields.
- The web layer can render repository-backed content consistently.
- The integration path with `chimera-lab-website.project` is explicit and tested.

## :memo: To-Do List

### :memo: Publication Readiness

- [ ] Add `publishConfig` to `@chimera-lab/core`, `@chimera-lab/services`, `@chimera-lab/documents`, `@chimera-lab/rules`, and `@chimera-lab/cli`.
- [ ] Create and test the GitHub Actions package publication workflow for the CLI monorepo.
- [ ] Verify package install from the GitHub npm registry in a clean consumer project.
- [ ] Review `repository.template`, `topic.template`, and `scaffold.template` for public readiness.
- [ ] Switch the three template repositories to public visibility.
- [ ] Audit all `.topic` repositories for publishable content.
- [ ] Set `meta.json` `public: true` only in repositories approved for public exposure.
- [ ] Change approved `.topic` repositories to public visibility.

### :memo: Content App Delivery

- [ ] Create the `chimera-lab-content.app` repository.
- [ ] Scaffold the Node.js and TypeScript application.
- [ ] Integrate `@chimera-lab/core`, `@chimera-lab/services`, and `@chimera-lab/documents` from GitHub Packages.
- [ ] Implement `ContentDiscoveryService`.
- [ ] Implement `FrontmatterPublishService`.
- [ ] Implement `GitMetadataService`.
- [ ] Implement `MarkdownRenderService` with directive resolution.
- [ ] Add routes, controllers, and HTML templating.
- [ ] Add styling from shared design tokens.
- [ ] Add Docker packaging and content caching.
- [ ] Integrate with `chimera-lab-website.project`.
- [ ] Add sitemap, RSS, search, and navigation generation.

### :memo: Integration Exit Criteria

- [ ] Package publication is stable enough that the content app does not need local package linking.
- [ ] Public repository metadata and document frontmatter gates are both enforced.
- [ ] Git-derived metadata is visible in rendered output when frontmatter omits it.
- [ ] The application can rebuild content directly from repository state with no database.
- [ ] The deployment approach for the website and the content app is documented and repeatable.
- [ ] The next release entry in [:page_facing_up: ../CHANGELOG.md](../CHANGELOG.md) reflects the publication and content app milestones.

## :books: References

- [:page_facing_up: knowledge/planning.knowledge.md](knowledge/planning.knowledge.md)
- [:page_facing_up: ../CHANGELOG.md](../CHANGELOG.md)
- [:page_facing_up: ../README.md](../README.md)
- [:page_facing_up: ../projects.topic/chimera-lab-website.project/README.md](../projects.topic/chimera-lab-website.project/README.md)
- [:page_facing_up: ../original.topic/chimera-lab-cli.app/README.md](../original.topic/chimera-lab-cli.app/README.md)
