if [[ -s .chimera-lab/issues.json ]]; then 
    jq -c ".[]" .chimera-lab/issues.json | while read -r ISSUE_OBJ; do gh issue create -t "$(echo $ISSUE_OBJ | jq -r '.title')" -m $(echo $ISSUE_OBJ | jq -r '.milestone') -b ""; done;
fi
