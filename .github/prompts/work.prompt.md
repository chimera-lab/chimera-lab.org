---
agent: organization-manager
description: Execute assigned tasks within chimera-lab.org organization following structure conventions and best practices.
---

# Work

Execute the assigned task within chimera-lab.org organization following structure conventions, template patterns, and coordination protocols.

## Pre-Work Context Gathering

**FIRST: Understand the Task**
1. Identify task scope: organization-wide, topic-specific, or repository-specific
2. Review affected repositories/topics/templates
3. Consult relevant knowledge base files
4. Check for cross-repository dependencies

**SECOND: Gather Technical Context**
- **For organization structure**: Review [organization.knowledge.md](../knowledge/organization.knowledge.md) and [ORGANIZATION_STRUCTURE.md](../docs/ORGANIZATION_STRUCTURE.md)
- **For templates**: Review [templates.knowledge.md](../knowledge/templates.knowledge.md)
- **For repository management**: Review [repository.knowledge.md](../knowledge/repository.knowledge.md)
- **For rules and validation**: Review [RULES.md](../RULES.md)
- **For metadata**: Check `.chimera-lab/config/` files

## Planning Phase

**Create TODO List** with `manage_todo_list`:
```json
{
  "id": 1,
  "title": "Review existing structure/templates",
  "description": "Analyze current organization structure, affected repositories/topics",
  "status": "not-started"
},
{
  "id": 2,
  "title": "Implement changes",
  "description": "Execute primary task (template update, structure change, documentation)",
  "status": "not-started"
},
{
  "id": 3,
  "title": "Update metadata and documentation",
  "description": "Update .chimera-lab/ files, README.md, and related docs",
  "status": "not-started"
},
{
  "id": 4,
  "title": "Update documentation",
  "description": "Update knowledge base, README, docstrings",
  "status": "not-started"
},
{
  "id": 5,
  "title": "Test manually",
  "description": "Run commands and verify output",
  "status": "not-started"
}
```

## Implementation Guidelines

### Adding New Commands

**Structure** (Typer pattern):
```python
@app.command()
def command_name(
    arg: str = typer.Argument(..., help="Description"),
    option: bool = typer.Option(False, "--flag", help="Description")
):
    """Command description for --help text."""
    # Implementation
```

**Standards**:
- All commands must have docstrings
- Use Rich for formatted output (`console.print()`)
- Type hints on all parameters
- Error handling with clear messages
- Follow patterns from existing commands in `src/cmrlab/app.py`

### Working with Walker

**Path Resolution**:
```python
from cmrlab.walker import Walker

walker = Walker(start_path)
repos = walker.discover_repositories()  # Returns dict[str, Path]
```

**Common Patterns**:
- Always use Walker for path discovery
- Never hardcode organization paths
- Respect `.chimera-lab/` configuration
- Handle missing directories gracefully

### Using Pydantic Models

**Type Definitions** (`src/cmrlab/types/`):
- `IssueModel` - GitHub issues
- `MilestoneModel` - GitHub milestones
- `LabelModel` - GitHub labels
- `RepositoryModel` - Repository metadata

**Pattern**:
```python
from cmrlab.types.issues import IssueModel

issue = IssueModel.model_validate(issue_data)
```

### GitHub API Integration

**Using requests**:
```python
import os
import requests

github_token = os.getenv("CHIMERA_LAB_CLI_GITHUB_API")
headers = {"Authorization": f"token {github_token}"}
response = requests.get(url, headers=headers)
```

**Best Practices**:
- Always check for `CHIMERA_LAB_CLI_GITHUB_API` environment variable
- Use Pydantic models to validate API responses
- Handle rate limiting and network errors
- Clear error messages when token missing

### Rich Output

**Console Formatting**:
```python
from rich.console import Console
from rich.table import Table

console = Console()
console.print("[bold green]Success:[/bold green] Operation completed")

table = Table(title="Results")
table.add_column("Name", style="cyan")
table.add_row("value")
console.print(table)
```

## Quality Checklist

**Before Marking Task Complete**:
- [ ] Code follows patterns from [CLI_GUIDELINES.md](../docs/CLI_GUIDELINES.md)
- [ ] Type hints on all public functions
- [ ] Docstrings on all commands and functions
- [ ] Error handling with clear messages
- [ ] Rich formatting for output
- [ ] Manual testing completed (`cmr <command>`)
- [ ] Help text accurate (`cmr <command> --help`)
- [ ] Knowledge base updated if new patterns
- [ ] No hardcoded paths or credentials
- [ ] Pydantic models used for data validation

## Testing Workflow

**Manual Testing**:
```bash
# Activate virtual environment
source .venv/bin/activate

# Install in editable mode if needed
pip install -e .

# Test command
cmr <command> [args] [options]

# Verify help text
cmr <command> --help

# Test error cases
cmr <command> --invalid-option
```

**Common Test Scenarios**:
- Valid input → expected output
- Invalid input → clear error message
- Missing configuration → helpful guidance
- Missing GitHub token → clear instructions

## Documentation Updates

**Required Updates**:
1. **Docstrings**: Command and function documentation
2. **Knowledge Base**: Update if new patterns introduced
3. **README**: Add usage examples for new commands
4. **CHANGELOG**: Document changes (coordinate with Project Manager)

**Knowledge Base Updates**:
- New commands → [commands.knowledge.md](../knowledge/commands.knowledge.md)
- New patterns → [system.knowledge.md](../knowledge/system.knowledge.md)
- Repository features → [repository.knowledge.md](../knowledge/repository.knowledge.md)
- Automation features → [automation.knowledge.md](../knowledge/automation.knowledge.md)

## Completion Criteria

✅ **Implementation**: Feature works as specified  
✅ **Standards**: Follows CLI_GUIDELINES patterns  
✅ **Types**: Complete type hints and Pydantic validation  
✅ **Documentation**: Docstrings, help text, knowledge base updated  
✅ **Testing**: Manual testing passed  
✅ **Integration**: Works with existing commands/modules  
✅ **Errors**: Clear error messages for edge cases

## Common Pitfalls to Avoid

❌ **DON'T**:
- Hardcode organization paths (use Walker)
- Forget type hints or docstrings
- Skip error handling
- Use plain print() (use Rich console)
- Ignore GitHub API rate limits
- Commit untested code

✅ **DO**:
- Use Walker for path discovery
- Add comprehensive type hints
- Handle errors gracefully with clear messages
- Format output with Rich
- Test manually before completing
- Follow existing code patterns

---

**Start by marking first TODO as in-progress, execute systematically, mark completed immediately after each step.**
