folders=$(git submodule foreach --recursive 'echo "$path"' | grep "Entering" | awk -F "'" '{ print $2 }' | tac)

base=$(pwd)

while IFS= read -r folder; do 
	cd "$base/$folder";
	git checkout main;
	if [[ -n "$(git status --porcelain)" ]]; then
		git add .
		git commit -m "AUTO Updates submodules"
		git push origin main
	fi
done <<< "$folders"
