---
agent: developer
description: Resume or start the next pending item in the active TODO list
---

# Go

Resume or start the next pending item in the active `manage_todo_list`.

## Scope

- Act only on items from the currently active `manage_todo_list`.
- Execute exactly one pending item: the highest-priority incomplete task.
- Do not authorize actions outside the active TODO list.

## Failure Handling

- If no active TODO list exists, stop immediately and report: "No active TODO list found. Please create one before using Go."
- If all items are already complete, stop and report: "All TODO items are complete. Nothing to resume."

## Process

1. Read the active `manage_todo_list`.
2. Identify the next pending item.
3. Execute it using the appropriate skill.
4. Mark it complete in the TODO list.
5. Report the result and the next pending item (if any).
