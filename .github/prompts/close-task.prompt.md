---
agent: repository-manager
description: Close a task and optionally commit with issue reference if applicable
---

# /close-task - Close Task with Optional Issue Commit

Close the current task, and if it's associated with a GitHub issue, create a commit with proper issue reference.

## Execution Steps

1. **Identify Task Context**
   - Check if there's an active issue number in context
   - Review terminal history for recent `gh issue view` commands
   - Determine if task is issue-related or standalone

2. **Verify Task Completion**
   - Review recent changes using `git status`
   - Confirm all work is ready for commit
   - Check for any uncommitted or unstaged files

3. **For Issue-Related Tasks**
   
   **a) Gather Issue Information**
   - Get issue number from context or ask user
   - Use `gh issue view {number}` to get issue title and details
   
   **b) Create Commit with Issue Reference**
   - Stage all changes: `git add .`
   - Create commit with conventional format and issue reference:
     ```
     {type}: {brief description}
     
     {detailed explanation if needed}
     
     Closes #{issue-number}
     ```
   - Commit types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`
   
   **c) Push and Close Issue**
   - Push changes: `git push`
   - Verify issue closure: `gh issue view {number}` (should show as closed)

4. **For Standalone Tasks**
   - Create regular commit without issue reference
   - Use conventional commit format
   - Push changes

5. **Update Todo List**
   - If todo list is active, mark corresponding todo as completed
   - Use `manage_todo_list` tool to update status

6. **Report Completion**
   - Confirm task closure
   - Show commit hash and message
   - If issue: Show issue number and closure status
   - Summarize what was accomplished

## Commit Message Format

### With Issue Reference:
```
{type}: {brief description}

{detailed context or changes made}

Closes #{issue-number}
```

### Without Issue Reference:
```
{type}: {brief description}

{detailed context or changes made}
```

## Expected Output

- Git commit confirmation with hash
- Push status
- Issue closure confirmation (if applicable)
- Task completion summary

## Error Handling

- If no changes to commit: Report and ask if task should be marked complete anyway
- If issue not found: Proceed with regular commit
- If push fails: Report error and suggest solutions
- If issue closure fails: Report but confirm commit was successful
