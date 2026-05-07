# :file_folder: Roadmap

## :book: Table of Contents

- [:file_folder: Roadmap](./#file_folder-roadmap)
  - [:telescope: Overview](./#telescope-overview)
  - [:memo: To-Do List](./#memo-to-do-list)
  - [:books: References](./#books-references)

## :telescope: Overview

<!-- <llm prompt="Roadmap.Overview" applied> -->

This roadmap focuses on maturing the organization super-repository as the shared source of truth for documentation, templates, metadata, and automation. Near-term work should prioritize keeping the repository structure stable, improving rendered documentation quality, and tightening template and validation workflows so downstream repositories inherit consistent standards.

<!-- </llm> -->

## :memo: To-Do List

<!-- <llm prompt="Roadmap.ToDoList" applied> -->

1. Keep top-level governance and reference documents aligned with the current organization model, template hierarchy, and repository conventions.
2. Expand and refine knowledge files under `docs/knowledge/` so prompts, agents, and human-facing docs share the same terminology and guidance.
3. Improve CMR-driven documentation rendering and validation workflows to reduce drift in headers, directives, and generated sections.
4. Review template inheritance and synchronization paths so changes are made once at the correct parent level and propagated safely.
5. Fill in or specialize placeholder CI, lint, test, and documentation automation where this repository or its child templates need concrete behavior.
6. Keep `.chimera-lab/` metadata accurate as repository structure, validation rules, and organizational assets evolve.
7. Continue documenting contribution, development, and troubleshooting paths so new contributors can work effectively in the super-repository.
8. Record meaningful structural or process changes in `CHANGELOG.md` as the repository moves beyond its initial baseline release.

<!-- </llm> -->

## :books: References

- [:page_facing_up: knowledge/planning.knowledge.md](knowledge/planning.knowledge.md)
- [:page_facing_up: ../CHANGELOG.md](../CHANGELOG.md)
- [:page_facing_up: ../CONTRIBUTING.md](../CONTRIBUTING.md)
- [:page_facing_up: ../README.md](../README.md)
