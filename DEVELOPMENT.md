# :file_folder: Development Environment Setup

## :book: Table of Contents

- [:file_folder: Development Environment Setup](./#file_folder-development-environment-setup)
  - [:clipboard: Requirements](./#clipboard-requirements)
  - [:inbox_tray: Installation](./#inbox_tray-installation)
    - [:inbox_tray: Clone the repository](./#inbox_tray-clone-the-repository)
    - [:inbox_tray: Create development environment](./#inbox_tray-create-development-environment)
    - [:inbox_tray: Install dependencies](./#inbox_tray-install-dependencies)
    - [:inbox_tray: Install pre-commit hooks (optional but recommended)](./#inbox_tray-install-pre-commit-hooks-optional-but-recommended)
  - [:keyboard: Usage](./#keyboard-usage)
  - [:toolbox: Tools](./#toolbox-tools)
    - [:toolbox: Running Tests](./#toolbox-running-tests)
    - [:toolbox: Code Quality](./#toolbox-code-quality)
    - [:toolbox: CMR Pipeline](./#toolbox-cmr-pipeline)
    - [:toolbox: Pre-commit Hooks](./#toolbox-pre-commit-hooks)
  - [:wrench: Configuration](./#wrench-configuration)
  - [:control_knobs: Customization](./#control_knobs-customization)
  - [:hammer_and_wrench: Common Problems](./#hammer_and_wrench-common-problems)

## :clipboard: Requirements

<!-- <llm prompt="Development.Requirements" applied> -->

Have Git and Python 3.8+ available locally, plus a working `cmr` installation and `pre-commit` in your active environment. If you plan to run GitHub-backed commands such as resource sync or template checks, authenticate first with `gh auth login`.

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
REPO_REMOTE=git@github.com:chimera-lab/repository.template.git
REPO_NAME=repository.template

git clone $REPO_REMOTE
cd $REPO_NAME
```

<!-- </code> -->

### :inbox_tray: Create development environment

<!-- <llm prompt="Development.Installation" applied> -->

After cloning the repository, create and activate a local virtual environment so the development tools stay isolated from your global Python installation.

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
```

<!-- </llm> -->

### :inbox_tray: Install dependencies

<!-- <llm prompt="Development.InstallDependencies" applied> -->

This repository does not define application dependencies or a lockfile. Install the shared development tools into the active environment instead, and ensure `cmr` is available on `PATH` before continuing.

```bash
pip install pre-commit
cmr --help
```

<!-- </llm> -->

### :inbox_tray: Install pre-commit hooks (optional but recommended)

<!-- <llm prompt="Development.PreCommitHooks" applied> -->

Enable the repository hooks once your environment is ready.

```bash
pre-commit install
```

The configured hooks catch common whitespace, file-format, line-ending, merge-conflict, and Markdown issues before a commit is created.

<!-- </llm> -->

## :keyboard: Usage

<!-- <llm prompt="Development.Usage" applied> -->

Use the `Makefile` as the main entry point for local workflows. `make setup` installs hooks, `make cmr-render` refreshes directive output, `make cmr-check` runs repository validation, `make cmr-sync` syncs GitHub-managed resources, and `make cmr-pipeline` runs the full render-then-check flow.

The generic `install`, `test`, `lint`, `format`, `build`, and `docs` targets are placeholders in this repository template and should be filled in only where a child repository needs project-specific behavior.

<!-- </llm> -->

## :toolbox: Tools

### :toolbox: Running Tests

<!-- <llm prompt="Development.Tests" applied> -->

There is no repository-specific test suite wired into `make test` yet; that target is still a template placeholder. For this repository, the practical verification path is `make cmr-check` together with `pre-commit run --all-files`.

<!-- </llm> -->

### :toolbox: Code Quality

<!-- <llm prompt="Development.CodeQuality" applied> -->

Code quality here is enforced through repository hygiene and documentation validation rather than language-specific tooling. Use `pre-commit run --all-files` for formatting and file checks, and use `cmr docs check` plus `cmr docs headers validate` for documentation structure and header validation.

<!-- </llm> -->

### :toolbox: CMR Pipeline

<!-- <llm prompt="Development.CmrPipeline" applied> -->

`make cmr-pipeline` runs the repository's full CMR workflow in order: `cmr docs fix --tags`, `cmr docs render --apply`, and then the grouped `cmr-check` targets. Use it when you want rendered directives and validation results to stay aligned in one pass.

<!-- </llm> -->

### :toolbox: Pre-commit Hooks

<!-- <llm prompt="Development.PreCommitTools" applied> -->

The current hook set includes `trailing-whitespace`, `end-of-file-fixer`, `check-yaml`, `check-toml`, `check-json`, `check-added-large-files`, `check-case-conflict`, `check-merge-conflict`, `mixed-line-ending`, `mdformat` with GFM support, and Prettier for YAML. Run `pre-commit run --all-files --show-diff-on-failure` to reproduce the GitHub Actions check locally.

<!-- </llm> -->

## :wrench: Configuration

<!-- <llm prompt="Development.Configuration" applied> -->

Repository configuration lives primarily in `Makefile`, `.pre-commit-config.yaml`, and `.chimera-lab/`. Use `.chimera-lab/config.json` and `.chimera-lab/meta.json` for repository metadata, template ancestry, and validation-related settings, and keep Markdown files aligned with the existing CMR directive structure.

<!-- </llm> -->

## :control_knobs: Customization

<!-- <llm prompt="Development.Customization" applied> -->

This repository is template-driven, so make shared changes at the highest template level that needs them instead of duplicating edits across descendants. Use `cmr repo template diff` to inspect drift, `cmr repo template update` to pull upstream changes, and `cmr repo template upgrade` when you are ready to apply them.

Child repositories can also replace the placeholder `install`, `test`, `lint`, `format`, `build`, and `docs` targets with project-specific commands.

<!-- </llm> -->

## :hammer_and_wrench: Common Problems

<!-- <llm prompt="Development.CommonProblems" applied> -->

If `cmr` commands fail, confirm the CLI is installed and on `PATH`, then run `cmr config github status` and `gh auth login` for GitHub-backed operations. If repo-scoped commands cannot resolve repository context, verify you are running them from a checkout that contains `.chimera-lab/`. If hooks fail unexpectedly, rerun `pre-commit run --all-files --show-diff-on-failure` to surface and apply the required fixes.

<!-- </llm> -->
