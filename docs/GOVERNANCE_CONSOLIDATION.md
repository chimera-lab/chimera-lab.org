# :compass: Governance Consolidation

## :book: Table of Contents

- [:compass: Governance Consolidation](./#compass-governance-consolidation)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)
  - [:keyboard: Usage](./#keyboard-usage)
  - [:notebook: Notes](./#notebook-notes)

## :telescope: Overview

This phase starts after broad .github narrative documentation migration.
The objective is to converge repository documentation onto typed-header and link-valid patterns without regressing the docs-only policy.

## :building_construction: Structure

Current gate status snapshot:

- Repositories audited in Apache gate: 40
- Repositories fully passing Apache gate: 0
- Repositories pending Apache gate: 40

Priority waves:

1. Wave A: Fix README link targets and missing local documentation stubs.
2. Wave B: Normalize typed headers and TOC in legacy README/CHANGELOG/CONTRIBUTING documents.
3. Wave C: Align policy and AI instruction references from .github narrative paths to docs/GITHUB docs.
4. Wave D: Add Apache public-readiness artifacts where required (LICENSE Apache-2.0, SECURITY, CODE_OF_CONDUCT, CONTRIBUTING, optional NOTICE).

## :keyboard: Usage

Execution checklist:

- Generate per-repo validation snapshot with `cmr docs check`.
- Apply deterministic fixes first (`cmr docs fix -r toc`).
- Patch remaining semantic errors manually in minimal focused commits.
- Re-run validation and record pass/fail delta.
- Update the Apache gate report after each wave.

## :notebook: Notes

Initial residual hotspots from validation:

- Legacy typed-header and TOC drift in scaffold READMEs under project repositories.
- Historical repositories with extensive non-typed headers and localization-heavy docs.
- AI instruction files still referencing old .github narrative locations.

Success criteria:

- No broken narrative-doc links to .github/README.md or .github/RULES.md.
- Zero broken links in targeted repositories per wave.
- All touched repositories pass `cmr docs check` for modified files.
- Apache gate report shows decreasing pending count each wave.
