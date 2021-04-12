#!/bin/sh

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old publication"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out gh-pages branch into public"
git worktree add -B gh-pages public origin/gh-pages

echo "Removing existing files"
rm -rf public/*

echo "Generating site"
hugo
cp CNAME ./public/

echo "Updating gh-pages branch"
read -erp "Commit Message: " commitMessage
cd public && git add --all && git commit -m "[publish gh-pages] $commitMessage"

read -erp "Push gh-pages to origin? (y/n): " doPushToRemote

if [[ "$doPushToRemote" == "y" ]]
then
    echo "Pushing to remote..."    
    git push origin gh-pages
fi