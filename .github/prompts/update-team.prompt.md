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
- Count actual files at runtime: `ls .github/agents/*.agent.md | wc -l` — use this count as the expected value

**Prompts** (`.github/prompts/`):
- List all `.prompt.md` files
- Extract agent target and description from frontmatter
- Count actual files at runtime: `ls .github/prompts/*.prompt.md | wc -l` — use this count as the expected value

**Knowledge** (`docs/knowledge/`):
- List all `.md` files
- Document their purpose based on filename and content
- Count actual files at runtime: `ls docs/knowledge/*.md | wc -l` — use this count as the expected value

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

For each knowledge file in `docs/knowledge/`:
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
- All agents in `.github/agents/` are represented (count actual files at runtime: `ls .github/agents/*.agent.md | wc -l`)
- All prompts in `.github/prompts/` are represented (count actual files at runtime: `ls .github/prompts/*.prompt.md | wc -l`)
- All knowledge files in `docs/knowledge/` are represented (count actual files at runtime: `ls docs/knowledge/*.md | wc -l`)
- Relationships match actual frontmatter references
- PlantUML syntax is valid; if diagram generation fails, report the error and the invalid syntax block without retrying indefinitely
- Layout uses `left to right direction`
- Proper color coding is maintained

## Expected Output

The updated `.github/copilot-team-components.plantuml` should:
- Accurately reflect chimera-lab.org organization architecture
- Show all 12 agents with their roles
- Show all prompts targeting their respective agents
- Show all 14 knowledge files
- Include proper notes describing each agent's responsibility
- Maintain visual consistency with existing color scheme
- Be valid PlantUML syntax that renders correctly
