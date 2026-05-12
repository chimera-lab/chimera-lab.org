# Makefile for project automation - customize for your project type

.PHONY: help install test lint format check clean build docs setup \
	cmr-check cmr-check-config cmr-check-meta cmr-check-docs cmr-check-template cmr-check-resources \
	cmr-render \
	cmr-template-status cmr-template-diff cmr-template-update cmr-template-upgrade \
	cmr-sync cmr-pipeline

# Default target
help:
	@echo "Available targets:"
	@echo ""
	@echo "  Project"
	@echo "  -------"
	@echo "  install              Install project dependencies"
	@echo "  test                 Run tests"
	@echo "  lint                 Run linting checks"
	@echo "  format               Format code"
	@echo "  check                Run all checks (lint + test)"
	@echo "  clean                Clean build artifacts"
	@echo "  build                Build project"
	@echo "  docs                 Generate documentation"
	@echo "  setup                Setup development environment"
	@echo ""
	@echo "  CMR - Checks"
	@echo "  ------------"
	@echo "  cmr-check            Run all CMR checks"
	@echo "  cmr-check-config     Health check CLI config (schema, vars, env, backend)"
	@echo "  cmr-check-meta       Validate metadata schema and list missing fields"
	@echo "  cmr-check-docs       Validate markdown docs, tags, and headers"
	@echo "  cmr-check-template   Check template sync status and diff"
	@echo "  cmr-check-resources  Compare local issues, labels, milestones with GitHub"
	@echo ""
	@echo "  CMR - Render"
	@echo "  ------------"
	@echo "  cmr-render           Render directives (tags + TOC + variables)"
	@echo ""
	@echo "  CMR - Template"
	@echo "  --------------"
	@echo "  cmr-template-status  Show full template sync status"
	@echo "  cmr-template-diff    Show differences between template and repository"
	@echo "  cmr-template-update  Check for pending template updates (read-only)"
	@echo "  cmr-template-upgrade Apply pending template updates to repository"
	@echo ""
	@echo "  CMR - Resources"
	@echo "  ---------------"
	@echo "  cmr-sync             Sync issues, labels, and milestones from GitHub"
	@echo ""
	@echo "  CMR - Pipeline"
	@echo "  --------------"
	@echo "  cmr-pipeline         Run full CMR pipeline (render → check)"

# Installation - customize for your project type
install:
	@echo "Install project dependencies"
	# Add installation commands for your project type

# Testing - customize for your project type
test:
	@echo "Run tests"
	# Add testing commands for your project type

# Code quality - customize for your project type
lint:
	@echo "Run linting checks"
	# Add language-specific linting commands

format:
	@echo "Format code"
	# Add language-specific formatting commands

check: lint test

# Development setup
setup:
	@echo "Setup development environment"
	@cp .github/hooks/pre-push .git/hooks/pre-push
	@chmod +x .git/hooks/pre-push
	@echo "Installed pre-push hook"

# Build and release - customize for your project type
clean:
	rm -rf build/
	rm -rf dist/
	# Add cleanup commands for your project type

build: clean
	@echo "Build project"
	# Add build commands for your project type

# Documentation
docs:
	@echo "Generate documentation"
	# Add documentation generation commands

# CMR - Checks
cmr-check-config:
	cmr config check
	cmr config missing

cmr-check-meta:
	cmr meta validate
	cmr meta missing

cmr-check-docs:
	cmr docs check
	cmr docs headers validate

cmr-check-template:
	cmr repo template status
	cmr repo template diff

cmr-check-resources:
	cmr repo issues check
	cmr repo labels check
	cmr repo milestones check

cmr-check: cmr-check-config cmr-check-meta cmr-check-docs cmr-check-template cmr-check-resources

cmr-render:
	cmr docs fix --tags
	cmr docs render --apply

# CMR - Template
cmr-template-status:
	cmr repo template status

cmr-template-diff:
	cmr repo template diff

cmr-template-update:
	cmr repo template update

cmr-template-upgrade:
	cmr repo template upgrade

# CMR - Metadata & Resources
cmr-sync:
	cmr repo issues sync
	cmr repo labels sync
	cmr repo milestones sync

# CMR - Full pipeline
cmr-pipeline: cmr-render cmr-check
