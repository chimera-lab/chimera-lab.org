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
    - [:toolbox: Pre-commit Hooks](./#toolbox-pre-commit-hooks)
  - [:wrench: Configuration](./#wrench-configuration)
  - [:control_knobs: Customization](./#control_knobs-customization)
  - [:hammer_and_wrench: Common Problems](./#hammer_and_wrench-common-problems)
    - [:hammer_and_wrench: Dependency errors](./#hammer_and_wrench-dependency-errors)
    - [:hammer_and_wrench: Pre-commit failures](./#hammer_and_wrench-pre-commit-failures)
    - [:hammer_and_wrench: Test failures](./#hammer_and_wrench-test-failures)

## :clipboard: Requirements

- Git installed
- Your project's runtime environment (Node.js, Python, Go, etc.)
- VS Code (recommended) or your preferred editor

## :inbox_tray: Installation

### :inbox_tray: Clone the repository

```bash
git clone --recursive https://github.com/chimera-lab/chimera-lab.git
cd chimera-lab
```

### :inbox_tray: Create development environment

```bash
# Install the CMR CLI globally
npm i -g @chimera-lab/cli

# Verify installation
cmr --help
```

### :inbox_tray: Install dependencies

```bash
# Use the appropriate command for your project type
make install
```

### :inbox_tray: Install pre-commit hooks (optional but recommended)

```bash
pre-commit install
```

## :keyboard: Usage

Use Make (recommended) for common development tasks:

```bash
# Install dependencies
make install

# Run tests
make test

# Run linting
make lint

# Format code
make format

# Run all checks
make check

# Clean build artifacts
make clean

# Set up development environment
make setup
```

## :toolbox: Tools

### :toolbox: Running Tests

```bash
make test
```

### :toolbox: Code Quality

```bash
# Validate documentation across all submodules
cmr docs check

# Fix auto-fixable issues (TOC, header emoji)
cmr docs fix -r toc -r header-emoji
```

### :toolbox: Pre-commit Hooks

Pre-commit hooks automatically run checks before commits:

```bash
# Install hooks
pre-commit install

# Run manually
pre-commit run --all-files
```

## :wrench: Configuration

If using VS Code, the workspace is pre-configured with:

- **Recommended extensions** (will prompt to install)
- **Editor settings** (formatting, linting)
- **Debug configurations** for your project type
- **Task definitions** for common operations

## :control_knobs: Customization

Repository-specific settings are stored in `.chimera-lab/settings.json`. Template variables, validation rules, and custom headers can be configured per-repository.

## :hammer_and_wrench: Common Problems

### :hammer_and_wrench: Dependency errors

Ensure you've installed all required dependencies

### :hammer_and_wrench: Pre-commit failures

Run `pre-commit run --all-files` to fix

### :hammer_and_wrench: Test failures

Check that all dependencies are correctly installed
