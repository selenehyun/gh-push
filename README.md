# GitHub Build Push
This is the Action we created to release the result of building the Repository's file into another Repository.

I am using it myself, and the build results of the code I write [here](https://github.com/polym-team/official-site) are deployed [here.](https://github.com/polym-team/polym-team.github.io)

## **Be careful** ⚠️
⚠️ This action erases all files in the repository to be deployed and then deploys only the new changes.

## Inputs
### `GITHUB_TOKEN`
**Required**
You must use a privileged access token for that Repository.<br />
The access token can be generated [here.](https://github.com/settings/tokens)

### `COMMIT_FILES`
**Required**
Enter the path of the file to deploy in the repository where you run the workflow.<br />
Ex) `dist/*`

### `REPO_FULLNAME`
**Required**
Enter the name of the repository to be deployed.<br />
Ex) `selenehyun/test`

### `BRANCH`
**Required**
Enter the branch name of the repository to be deployed.

## Example usage
```yml
name: Publish pages

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [12.x]

    steps:
      - uses: actions/checkout@v1
        with:
          fetch-depth: 0
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v1
        with:
          node-version: ${{ matrix.node-version }}
      - name: npm install, build
        run: |
          npm ci
          npm run build
        env:
          CI: true
      - name: Publish
        uses: selenehyun/gh-push@master
        env:
          GITHUB_TOKEN: ${{ secrets.PUBLISH_ACCESS_TOKEN }}
          COMMIT_FILES: dist/*
          REPO_FULLNAME: polym-team/polym-team.github.io
          BRANCH: master
```
