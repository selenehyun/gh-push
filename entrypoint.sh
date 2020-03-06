#!/bin/bash

set -e

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "Set the GITHUB_TOKEN env variable."
	exit 1
fi

if [[ -z "$COMMIT_FILES" ]]; then
	echo "Set the COMMIT_FILES env variable."
	exit 1
fi

if [[ -z "$REPO_FULLNAME" ]]; then
	echo "Set the REPO_FULLNAME env variable."
	exit 1
fi

if [[ -z "$BRANCH" ]]; then
	echo "Set the BRANCH env variable."
	exit 1
fi

git clone --depth 1 https://x-access-token:$GITHUB_TOKEN@github.com/$REPO_FULLNAME.git /$REPO_FULLNAME
echo $PWD
ls -al
cp -r ./$COMMIT_FILES /$REPO_FULLNAME
cd /$REPO_FULLNAME
git config --global user.email "push@no-reply.github.com"
git config --global user.name "GitHub Push Action"

# check commit exists
git add $COMMIT_FILES
git commit -m "GitHub Push"
git push origin $BRANCH
