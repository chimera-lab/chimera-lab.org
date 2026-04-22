# Makefile for project automation - customize for your project type

.PHONY: help install test lint format check clean build docs setup cmr-check cmr-template-diff cmr-template-update cmr-render cmr-pipeline

# Default target
help:
	@echo "Available targets:"
	@echo "  install     Install project dependencies"
	@echo "  test        Run tests"
	@echo "  lint        Run linting checks"
	@echo "  format      Format code"
	@echo "  check       Run all checks (lint + test)"
	@echo "  clean       Clean build artifacts"
	@echo "  build       Build project"
	@echo "  docs        Generate documentation"
	@echo "  setup       Setup development environment"
	@echo "  cmr-check   Validate docs and tag directives"
	@echo "  cmr-template-diff   Show template/repository differences"
	@echo "  cmr-template-update Apply template updates"
	@echo "  cmr-render  Refresh CMR tags and TOC"
	@echo "  cmr-pipeline Run full CMR pipeline"

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
	pre-commit install

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

# CMR pipeline automation
cmr-check:
	cmr docs check
	cmr docs check --tags

cmr-template-diff:
	cmr repo template diff

cmr-template-update:
	cmr repo template update

cmr-render:
	cmr docs fix --tags
	cmr docs fix -r toc

cmr-pipeline: cmr-check cmr-template-diff cmr-template-update cmr-render cmr-check
