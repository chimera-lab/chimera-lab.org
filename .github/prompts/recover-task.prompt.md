---
agent: project-manager
description: Recover and restore the todo list from previous context or conversation
---

# /recover-task - Recover Todo List

Recover and restore the todo list from previous work context.

## Execution Steps

1. **Analyze Context**
   - Review conversation history for previous todo list states
   - Check for any saved todo states in recent messages
   - Identify the last valid todo list configuration

2. **Validate Todo Structure**
   - Ensure all recovered todos have valid structure:
     - id (sequential numbers)
     - title (concise, action-oriented)
     - description (detailed context)
     - status (not-started, in-progress, completed)
   - Check for any incomplete or corrupted entries

3. **Restore Todo List**
   - Use `manage_todo_list` tool with operation="write"
   - Include all recovered todos with their original status
   - Preserve the work progress and context

4. **Report Recovery**
   - Confirm successful recovery
   - Show summary of recovered todos by status:
     - Completed tasks count
     - In-progress tasks (should be 0 or 1)
     - Not-started tasks count
   - Highlight any todos that need attention

## Recovery Sources (Priority Order)

1. Last `manage_todo_list` operation in conversation
2. Explicit todo mentions in recent messages
3. Infer from completed work and pending requests

## Expected Output

- Confirmation of todo list restoration
- Summary table showing all todos with their status
- Next suggested action based on recovered state

## Error Handling

- If no previous todo list found: Report this and ask if user wants to create new list
- If corrupted data found: Report issues and ask for clarification
- If multiple versions found: Use the most recent complete version
