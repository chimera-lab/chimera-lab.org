---
agent: project-manager
description: Analyze GitHub issue using gh cli, determine responsible agent, and provide detailed context
---

# Explain Issue

## Objective
Analyze a GitHub issue to understand its requirements and assign it to the appropriate specialized agent.

## Instructions

1. **Retrieve Issue Details**
   - Use `gh issue view <issue-number>` to fetch complete issue information
   - Extract title, description, labels, and comments
   - Identify issue type (bug, feature, documentation, etc.)

2. **Analyze Requirements**
   - Parse issue description and identify:
     - Affected components or modules
     - Required changes (code, docs, config, etc.)
     - Priority and urgency indicators
     - Related files or directories

3. **Determine Responsible Agent**
   - Based on issue content, recommend the most appropriate agent:
     - `cli-developer` - CLI command implementation, modules, GitHub API integration
     - `python-architect` - Architecture design, type system, Pydantic models
     - `technical-writer` - Documentation updates, knowledge base, guides
     - `repository-manager` - Repository maintenance, Git operations, releases
     - `project-manager` - Feature planning, milestones, coordination
     - `prompt-engineer` - Agent/prompt creation or updates

4. **Provide Context**
   - Summarize key requirements for the assigned agent
   - Highlight specific files or patterns mentioned
   - Note any dependencies or blockers
   - Include relevant issue metadata (labels, milestone, etc.)

## Output Format

Provide a clear summary:
- Issue number and title
- Issue type and priority
- **Recommended Agent**: [agent-name]
- **Key Requirements**: Bullet points of what needs to be done
- **Affected Areas**: Files, directories, or modules involved
- **Additional Context**: Any important details from comments or description
