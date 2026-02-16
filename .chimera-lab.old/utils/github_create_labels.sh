JSON_PATH=/home/lab/Desktop/chimera-lab.org/.github/labels.json

VALID_KEY=$(jq -r ". | has(\"$1\")" $JSON_PATH)

if [[ $VALID_KEY == "true" ]]; then
    while read -r tag; do
        gh label create --force "$(echo "$tag" | jq -r '.name')" --description "$(echo "$tag" | jq -r '.description')" --color "$(echo "$tag" | jq -r '.color')"; 
    done < <(jq -c ".$1[]" $JSON_PATH)
else
    echo "Key $1 is invalid, check $JSON_PATH"
fi
