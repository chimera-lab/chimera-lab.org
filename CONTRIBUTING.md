# :busts_in_silhouette: Contributing

This guide explains how to prepare your environment, configure <!-- <var key="repo.name"> --><!-- </var> -->, and contribute changes consistently.

## :book: Table of Contents

- [:busts_in_silhouette: Contributing](./#busts_in_silhouette-contributing)
  - [:telescope: Overview](./#telescope-overview)
  - [:clipboard: Requirements](./#clipboard-requirements)
  - [:wrench: Configuration](./#wrench-configuration)
  - [:memo: To-Do List](./#memo-to-do-list)

## :telescope: Overview

We keep contributions simple: satisfy prerequisites, configure the project, then follow the short step list below for changes and reviews.

## :clipboard: Requirements

- Git installed and able to authenticate with the <!-- <var key="org.name"> --><!-- </var> --> repository.
- Development environment that matches project language/runtime.
- Access to required secrets or environment variables when applicable.

## :wrench: Configuration

1. Clone <!-- <var key="repo.name"> --><!-- </var> --> and install dependencies per the project README.
2. Set any required environment variables or secret files locally (do not commit secrets).
3. Run lint and test commands once to ensure the base setup passes.

## :memo: To-Do List

1. Open or confirm a tracked issue describing the problem/feature and expected outcome.
2. Create a branch from `main` with a clear name (e.g., `feat/short-description` or `fix/issue-123`).
3. Plan scope and acceptance checks; align on interfaces or data contracts before coding.
4. Implement the change with tests covering new or adjusted behavior.
5. Run formatters, linters, and the full test suite locally; resolve failures.
6. Update documentation and any relevant examples or configs; add changelog entry if required.
7. Commit using conventional commit format (e.g., `feat: add user login`, `fix(gui): resolve crash on startup`); reference the issue in the body (e.g., `Refs #123`).
8. Push the branch and open a pull request linking the issue (e.g., `Closes #123`) with a brief summary and test notes.
9. Respond to review feedback promptly; adjust code, tests, or docs as requested.
10. Maintain a clean history (rebasing if needed); merge per project policy after approvals and passing checks.
