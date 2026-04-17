# :file_folder: GitHub Integration

## :book: Table of Contents

- [:file_folder: GitHub Integration](./#file_folder-github-integration)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:keyboard: Usage](./#keyboard-usage)
  - [:books: References](./#books-references)

## :telescope: Overview

This document describes what belongs in `.github/` for this repository.
The rule is strict: `.github/` is reserved for GitHub automation and workflow artifacts, while human-facing documentation belongs in `docs/`.

## :building_construction: Structure

Expected GitHub structure:

```text
.github/
├── agents/
├── prompts/
├── skills/
├── workflows/
└── ISSUE_TEMPLATE/
```

Documentation pages should be maintained in `docs/` and `docs/knowledge/`.

## :keyboard: Usage

- Add workflow and automation files under `.github/`.
- Keep narrative guides and standards in `docs/`.
- Validate documentation after structural changes with `cmr docs check`.

## :books: References

- [:page_facing_up: GITHUB_RULES.md](GITHUB_RULES.md)
- [:page_facing_up: STRUCTURE.md](STRUCTURE.md)
