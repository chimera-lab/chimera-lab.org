---
name: review
description: Validate code, documentation, and context quality
---

# :file_folder: Review

## :book: Table of Contents

<!-- <toc> --><!-- </toc> -->

## :telescope: Overview

Review ensures quality and consistency across code, documentation, and AI context. Use `cmr docs validate` for automated checks. Verify content separation: knowledge explains, docs detail, prompts instruct, agents orchestrate via skills.

## :world_map: Guides

### :world_map: Documentation Validation

- Run `cmr docs validate` to check structure and links.
- Run `cmr docs fix` to auto-repair formatting.
- Verify headers follow semantic emoji conventions — see validating knowledge for complete vocabulary.
- Check references between files are valid and non-circular.

### :world_map: Context Validation

- Agents reference skills only (`:dart: Skills` section). No direct doc references.
- Skills reference knowledge only (`:books: References` section). No direct doc references.
- Knowledge references docs only (`:books: References` section). Knowledge is the abstraction layer.
- Prompts reference agents via frontmatter and skills via content. No direct doc or knowledge references.
- No agent-to-agent, prompt-to-prompt, skill-to-skill, or knowledge-to-agent references.

### :world_map: Code Validation

- Verify changes match acceptance criteria.
- Check conventional commit format.
- Ensure no temporary files or secrets in staged changes.
- Validate test coverage for changes.

### :world_map: Output

- List of issues found and fixes applied.
- Validation results summary.
- Reference integrity status.

## :books: References

- [:page_facing_up: ../../../docs/knowledge/reviewing.knowledge.md](../../../docs/knowledge/reviewing.knowledge.md)
- [:page_facing_up: ../../../docs/knowledge/validating.knowledge.md](../../../docs/knowledge/validating.knowledge.md)
