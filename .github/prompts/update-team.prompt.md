---
agent: prompt-engineer
description: Update copilot-team-components.plantuml diagram with actual chimera-lab-cli agents, prompts and knowledge architecture
---

# Update Team Architecture Diagram

Update the `.github/copilot-team-components.plantuml` file to reflect the actual architecture of agents, prompts, and knowledge files in chimera-lab-cli repository.

## Steps

### 1. List Existing Resources

First, scan the repository structure to identify all existing resources:

**Agents** (`.github/agents/`):
- List all `.agent.md` files
- Extract name and description from frontmatter
- Expected agents: prompt-engineer, project-manager, cli-developer, python-architect, technical-writer, repository-manager

**Prompts** (`.github/prompts/`):
- List all `.prompt.md` files
- Extract agent target and description from frontmatter
- Expected prompts: work, plan-milestone, fix-docs, update-team, commit, explain-issue, close-task, recover-task, go, fix-context

**Knowledge** (`.github/knowledge/`):
- List all `.md` files
- Document their purpose based on filename and content
- Expected: system.knowledge.md, commands.knowledge.md, organization.knowledge.md, repository.knowledge.md, automation.knowledge.md

### 2. Read Each Prompt

For each prompt file in `.github/prompts/`:
- Read the full content
- Identify the `agent` field from frontmatter (which agent it targets)
- Create relationship in PlantUML: `file PromptName as "filename" COLOR_PROMPT`
- Add arrow: `PromptName --> TargetAgentComponent`

### 3. Read Each Agent

For each agent file in `.github/agents/`:
- Read the full content
- Identify which knowledge files it references
- Create component in PlantUML: `component AgentName as "Display Name" COLOR_TYPE`
- Add note with agent description
- Create arrows to knowledge files: `AgentName --> KnowledgeFile`

### 4. Read Each Knowledge File

For each knowledge file in `.github/knowledge/`:
- Create database entry in PlantUML: `database KnowName as "filename" COLOR_KNOWLEDGE`

### 5. Update PlantUML File

Update `.github/copilot-team-components.plantuml` with:
- Keep the header and package structure
- Update color definitions (keep existing COLOR_* defines)
- Update knowledge database entries to match actual files
- Update agent components to match actual agents
- Update prompt file entries to match actual prompts
- Update all relationships based on actual cross-references
- Maintain proper PlantUML syntax and indentation

### 6. Validation

Ensure:
- All agents in `.github/agents/` are represented (6 agents for CLI)
- All prompts in `.github/prompts/` are represented (10 prompts)
- All knowledge files in `.github/knowledge/` are represented (5 knowledge files)
- Relationships match actual frontmatter references
- PlantUML syntax is valid
- Layout uses `left to right direction`
- Proper color coding is maintained
- CLI-specific architecture is clear (Typer, Pydantic, Walker references)

## Expected Output

The updated `.github/copilot-team-components.plantuml` should:
- Accurately reflect chimera-lab-cli Python CLI architecture
- Show all 6 CLI-focused agents with their roles
- Show all prompts targeting their respective agents
- Show 5 knowledge files (system, commands, organization, repository, automation)
- Include proper notes describing each agent's CLI-specific responsibility
- Maintain visual consistency with existing color scheme
- Be valid PlantUML syntax that renders correctly
- Highlight Python/CLI focus (not design system/components)
