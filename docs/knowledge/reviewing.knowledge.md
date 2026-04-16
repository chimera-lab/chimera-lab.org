---
name: reviewing
description: Patterns for validating code, documentation, and agent context quality
---

# :file_folder: Reviewing Knowledge

## :book: Table of Contents

- [:file_folder: Reviewing Knowledge](./#file_folder-reviewing-knowledge)
  - [:telescope: Overview](./#telescope-overview)
  - [:world_map: Guides](./#world_map-guides)
    - [:world_map: Documentation Review](./#world_map-documentation-review)
    - [:world_map: Context Review](./#world_map-context-review)
    - [:world_map: Code Review](./#world_map-code-review)
  - [:books: References](./#books-references)

## :telescope: Overview

Reviewing ensures quality, consistency, and correctness across code, documentation, and AI context files. Use `cmr docs validate` for automated checks. Verify strict layer separation.

## :world_map: Guides

### :world_map: Documentation Review

- Run `cmr docs validate` to check structure and links.
- Run `cmr docs fix` to auto-repair formatting issues.
- Verify headers follow approved semantic emoji conventions.
- Check that references between files are valid and not circular.
- Validate against architecture docs for design consistency.
- Verify organizational conventions: naming, structure, template hierarchy.

### :world_map: Context Review

- Agents reference skills only (via `:dart: Skills` section). No direct doc references from agents.
- Skills reference knowledge only (via `:books: References` section). No direct doc references from skills.
- Knowledge references docs only (via `:world_map: References` section). Knowledge is the abstraction layer.
- Prompts reference agents via frontmatter and skills via content. No direct doc or knowledge references.
- No agent-to-agent, prompt-to-prompt, skill-to-skill, or knowledge-to-agent references.

### :world_map: Code Review

- Verify changes match acceptance criteria from the originating issue.
- Check for conventional commit format compliance.
- Ensure no temporary files or secrets in staged changes.
- Validate test coverage for new or changed behavior.

## :books: References

- [:page_facing_up: ../ARCHITECTURE.md](../ARCHITECTURE.md)
- [:page_facing_up: ../ORGANIZATION.md](../ORGANIZATION.md)
- [:page_facing_up: ../STRUCTURE.md](../STRUCTURE.md)
- [:page_facing_up: ../../CODE_OF_CONDUCT.md](../../CODE_OF_CONDUCT.md)
- [:page_facing_up: ../../CONTRIBUTING.md](../../CONTRIBUTING.md)
