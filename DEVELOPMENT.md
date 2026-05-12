# :file_folder: Development Environment Setup

## :book: Table of Contents

- [:file_folder: Development Environment Setup](./#file_folder-development-environment-setup)
  - [:clipboard: Requirements](./#clipboard-requirements)
  - [:inbox_tray: Installation](./#inbox_tray-installation)
    - [:inbox_tray: Clone the repository](./#inbox_tray-clone-the-repository)
    - [:inbox_tray: Install dependencies](./#inbox_tray-install-dependencies)
    - [:inbox_tray: Install git hooks](./#inbox_tray-install-git-hooks)
  - [:keyboard: Usage](./#keyboard-usage)
  - [:toolbox: Tools](./#toolbox-tools)
    - [:toolbox: Running Tests](./#toolbox-running-tests)
    - [:toolbox: Code Quality](./#toolbox-code-quality)
    - [:toolbox: CMR Pipeline](./#toolbox-cmr-pipeline)
    - [:toolbox: Git Hooks](./#toolbox-git-hooks)
  - [:wrench: Configuration](./#wrench-configuration)
  - [:control_knobs: Customization](./#control_knobs-customization)
  - [:hammer_and_wrench: Common Problems](./#hammer_and_wrench-common-problems)

## :clipboard: Requirements

<!-- <llm prompt="Development.Requirements" applied> -->

Have Git and a working `cmr` installation on `PATH`. If you plan to run GitHub-backed commands such
as resource sync or template checks, authenticate first with `gh auth login`.

<!-- </llm> -->

## :inbox_tray: Installation

### :inbox_tray: Clone the repository

<!-- <code lang="bash"> -->

<!-- <data name="REPO_REMOTE"> -->

<!-- <var key="repo.remote" applied> -->https://github.com/chimera-lab/chimera-lab.git<!-- </var> -->

<!-- </data name="REPO_REMOTE"> -->

<!-- <data name="REPO_NAME"> -->

<!-- <var key="repo.name" applied> -->chimera-lab.org<!-- </var> -->

<!-- </data name="REPO_NAME"> -->

```bash
REPO_REMOTE=https://github.com/chimera-lab/chimera-lab.git
REPO_NAME=chimera-lab.org

git clone https://github.com/chimera-lab/chimera-lab.git chimera-lab.org
cd chimera-lab.org
git submodule update --init --recursive
```

<!-- </code> -->

### :inbox_tray: Install dependencies

<!-- <llm prompt="Development.InstallDependencies" applied> -->

This repository has no application code. The only required tool is `cmr` (the chimera-lab CLI).

`cmr` is a TypeScript CLI built from
[chimera-lab-cli.app](https://github.com/chimera-lab/chimera-lab-cli.app). Install it globally via
pnpm:

```bash
git clone https://github.com/chimera-lab/chimera-lab-cli.app.git
cd chimera-lab-cli.app
pnpm install && pnpm build
pnpm link --global
```

Verify the installation:

```bash
cmr --version
```

<!-- </llm> -->

### :inbox_tray: Install git hooks

<!-- <llm prompt="Development.GitHooks" applied> -->

Enable the repository hooks once your environment is ready:

```bash
make setup
```

This installs `.github/hooks/pre-push` into `.git/hooks/`. The hook runs `cmr docs check --strict`
before every `git push`, rejecting pushes with documentation validation errors.

<!-- </llm> -->

## :keyboard: Usage

<!-- <llm prompt="Development.Usage" applied> -->

Use the `Makefile` as the main entry point for local workflows. `make setup` installs hooks,
`make cmr-render` refreshes directive output, `make cmr-check` runs the full validation suite
(config, meta, docs, template, and resources), `make cmr-sync` syncs issues, labels, and milestones
from GitHub, and `make cmr-pipeline` runs the full render-then-check flow in one pass.

<!-- </llm> -->

## :toolbox: Tools

### :toolbox: Running Tests

<!-- <llm prompt="Development.Tests" applied> -->

There is no repository-specific test suite wired into `make test` yet; that target is still a
template placeholder. For this repository, the practical verification path is `make cmr-check`.

<!-- </llm> -->

### :toolbox: Code Quality

<!-- <llm prompt="Development.CodeQuality" applied> -->

Code quality here is enforced through repository hygiene and documentation validation rather than
language-specific tooling. Use `cmr docs check` and `cmr docs headers validate` for documentation
structure and header validation.

<!-- </llm> -->

### :toolbox: CMR Pipeline

<!-- <llm prompt="Development.CmrPipeline" applied> -->

`make cmr-pipeline` runs the repository's full CMR workflow in order: `cmr docs fix --tags`,
`cmr docs render --apply`, and then the grouped `cmr-check` targets. Use it when you want rendered
directives and validation results to stay aligned in one pass.

<!-- </llm> -->

### :toolbox: Git Hooks

<!-- <llm prompt="Development.GitHooks" applied> -->

The repository uses a single `pre-push` hook (`.github/hooks/pre-push`) that runs
`cmr docs check --strict`. It is installed via `make setup` and runs in \~1.6s with no stash
overhead. To run the check manually at any time: `cmr docs check --strict`.

<!-- </llm> -->

## :wrench: Configuration

<!-- <llm prompt="Development.Configuration" applied> -->

Repository configuration lives primarily in `Makefile` and `.chimera-lab/`. `.chimera-lab/config.json` holds org-level settings such as name, slogan, variable
definitions, and badge declarations. `.chimera-lab/meta.json` holds repository identity — type,
template ancestry, tags, and authors. Keep Markdown files aligned with the existing CMR directive
structure.

<!-- </llm> -->

## :control_knobs: Customization

<!-- <llm prompt="Development.Customization" applied> -->

This repository is template-driven, so make shared changes at the highest template level that needs
them instead of duplicating edits across descendants. Use `cmr repo template diff` to inspect drift,
`cmr repo template update` to pull upstream changes, and `cmr repo template upgrade` when you are
ready to apply them.

<!-- </llm> -->

## :hammer_and_wrench: Common Problems

<!-- <llm prompt="Development.CommonProblems" applied> -->

If `cmr` commands fail, confirm the CLI is installed and on `PATH` with `cmr --version`, then run
`cmr config github` and `gh auth login` for GitHub-backed operations. Run `cmr config check` to
diagnose schema, vars, and backend issues. If repo-scoped commands cannot resolve repository
context, verify you are running them from a checkout that contains `.chimera-lab/`. If the pre-push
hook fails unexpectedly, run `cmr docs check --strict` directly to see the errors and fix them.

<!-- </llm> -->
