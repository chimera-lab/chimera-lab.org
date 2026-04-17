# :file_folder: GitHub Rules

## :book: Table of Contents

- [:file_folder: GitHub Rules](./#file_folder-github-rules)
  - [:clipboard: Requirements](./#clipboard-requirements)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:keyboard: Usage](./#keyboard-usage)
  - [:books: References](./#books-references)

## :clipboard: Requirements

- Keep GitHub-related files in `.github/` only.
- Keep human-facing documentation in `docs/` only.
- Keep knowledge files in `docs/knowledge/`.
- Use typed headers with emoji prefixes in documentation.
- Validate documentation before merge.

## :building_construction: Structure

Expected split:

```text
.github/
├── agents/
├── prompts/
├── skills/
└── workflows/

docs/
├── ARCHITECTURE.md
├── ORGANIZATION.md
├── ROADMAP.md
├── STRUCTURE.md
├── GITHUB.md
├── GITHUB_RULES.md
└── knowledge/
```

## :keyboard: Usage

- If a new documentation page is created, place it in `docs/`.
- If a file in `.github/` contains narrative documentation, move it to `docs/`.
- Run `cmr docs check` and `cmr docs check --tags` after refactors.

## :books: References

- [:page_facing_up: GITHUB.md](GITHUB.md)
- [:page_facing_up: STRUCTURE.md](STRUCTURE.md)
