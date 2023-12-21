#!/usr/bin/env bash
set -eu
IFS=$'\t'

# update amber-lab administration chimera-lab/template-topic public chimera-lab/administration.topic
# update owner repo template visibility new_name

# ARGS
owner=$1
repo=$2
template=$3
visibility=$4
name=$5

echo "Using template '$template' to recreate '$owner/$repo' with name '$owner/$name'."
echo "Owner: $owner";
echo "Visibility: $visibility";

echo -n "Do you want to continue? (Y/n):"
read continue

if [[ ! "yY" == *"$continue"* ]]; then
    exit 1
fi

# Config
if [ -d /tmp/change-git-template ]; then
    rm -rf /tmp/change-git-template/*
else 
    mkdir /tmp/change-git-template
fi

# Start git repository
cd /tmp/change-git-template/
git clone "git@github.com:$owner/$repo.git"
cd $repo

# Save
git fetch origin main && git pull --all

if [ -d /home/$USER/.backup/$repo ]; then
    # Check for backups
    echo -e "\e[1;31m/home/$USER/.backup/$repo already exists, aborting execution...\e[0m\n\n"
    exit 1;
else
    #Backup
    mkdir -p /home/$USER/.backup
    cp -r . /home/$USER/.backup/
    echo "DEBUG: /home/$USER/.backup"
    ls /home/$USER/.backup
    echo "DEBUG: /home/$USER/.backup"
    ls /home/$USER/.backup/
    echo -e "\e[1;32mBacking up the repository to /home/$USER/.backup/$repo...\e[0m\n\n"
fi

# Create from new template
gh repo create "$owner/$name" --template "git@github.com:$template.git" --${visibility} 

# Add new remote
git remote add new_origin git@github.com:$owner/$name.git

# Add local files
git pull new_origin main --no-rebase --allow-unrelated-histories

# Push to remote
git push new_origin main

# pull new repository
cd ../
git clone git@github.com:$owner/$name.git
cd $name

# Make changes
echo "Make sure the new repository at /tmp/change-git-template/$name is ready to add *, commit and push
click ANY KEY to continue!"

read continue

git add * && commit -m "Automated repository rebuild" && git push origin

# Delete on origin
gh repo delete $owner/$name

exit 0
