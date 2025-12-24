---
agent: repository-manager
description: Execute git operations across chimera-lab.org super-repository and all submodules
---

# /commit - Git Operations for Organization Super-Repository

Execute git operations across organization super-repository and all submodules (topics, projects, templates).

## 1. Verify SSH Access

Check if SSH is accessible:
- Test connection: `ssh -T git@github.com`
- If fails, check terminal history for previous SSH setup commands

## 2. SSH Key Setup

Show one line execution for:
- Eval ssh socket: `eval "$(ssh-agent -s)"`
- Add SSH key with "github" in name: `ssh-add ~/.ssh/*github.com`

## 3. Git Operations for Organization Super-Repository

Using `git` and `git submodule --recursive` for organization with multiple submodules:

1. **Check for changes**: 
   - Main organization: `git status`
   - All submodules (topics/projects): `git submodule foreach --recursive 'git status'`
   - Note: Organization has many submodules - each topic/project is a submodule

2. **Fetch and prune**: 
   - Main: `git fetch --prune`
   - Submodules: `git submodule foreach --recursive 'git fetch --prune'`

3. **Pull changes**: 
   - Main: `git pull`
   - Submodules: `git submodule foreach --recursive 'git pull'`

4. **Analyze changes**: Review all changes:
   - Organization-level changes (.github/, .chimera-lab/, reports/)
   - Submodule reference updates
   - Modified files by type and location

5. **Create logical commit groups**: Group related changes using conventional commit:
   - `feat(templates):` - Template changes
   - `feat(topics):` - Topic structure changes
   - `docs:` - Documentation updates
   - `chore(submodules):` - Submodule reference updates
   - `chore(metadata):` - .chimera-lab/ configuration
   - `fix:` - Bug fixes
   - `refactor:` - Structure reorganization

6. **Stage and commit**: For each logical group:
   - Stage files: `git add <files>`
   - Commit with message: `git commit -m "type(scope): description"`
   - **Important**: Organization commits often update submodule references

7. **Push**: 
   - Submodules first: `git submodule foreach --recursive 'git push'`
   - Then main repo: `git push`
   - Note: Push submodules before main to ensure references are valid

## Expected Output

- SSH agent PID confirmation
- Identity file added confirmation
- Git status for organization root and all submodules (topics/projects)
- Fetch, pull, commit, and push results
- Success/failure messages for each operation
- Submodule reference updates noted

## Error Handling

- Continue execution even if submodules have no changes
- Report any failed operations
- Verify SSH key is loaded before proceeding
