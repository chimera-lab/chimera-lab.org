# SCRIPT PATH
SCRIPT_PATH=$(readlink -f "$0")
# JSON PATH
JSON_PATH="$(dirname $SCRIPT_PATH)/milestones.json"
# EXECUTION PATH
EXEC_PATH=$(pwd)
# REPO PATH
REPO_PATH="$(gh repo view --json "url" | jq -r ".url" | sed 's/https:\/\/github.com/repos/g')/milestones"

jq -c ".[]" $JSON_PATH | while read -r MILESTONE_OBJ; do \
    gh api \
        --method POST \
        -H "Accept: application/vnd.github.v3+json" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        "$REPO_PATH" \
        -f "title=$(echo $MILESTONE_OBJ | jq -r '.title')" \
        -f "description=$(echo $MILESTONE_OBJ | jq -r '.description')"
done;
