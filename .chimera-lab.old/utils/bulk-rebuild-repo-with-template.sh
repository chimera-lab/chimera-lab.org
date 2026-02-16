#!/bin/bash

# Ler o arquivo JSON como um array
mapfile -t repositories < <(jq -c '.repositories[]' target_repositories.json)

# Iterar sobre os elementos do array
for item in "${repositories[@]}"; do
    owner=$(jq -r '.owner' <<< "$item")
    old=$(jq -r '.old' <<< "$item")
    template=$(jq -r '.template' <<< "$item")
    visibility=$(jq -r '.visibility' <<< "$item")
    new=$(jq -r '.new' <<< "$item")

    bash rebuild-repo-with-template.sh "$owner" "$old" "$template" "$visibility" "$new"

done
