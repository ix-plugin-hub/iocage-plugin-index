# iocage-test

## Create orphan branch for the fork

- `git checkout --orphan foo`

```bash
git checkout --orphan run-cl
git rm -rf *
## This branch is now an empty repository
git add README.md
git commit -m "initial commit message"
git push origin stay-away
```

## tags and empty commits

```bash
git commit --allow-empty -m "empty"
git tag -a test-tag -m "empty"
git push test test-tag
```

delete tag from github

- `git tag --help`

```bash
# list tags
git tag -l

#add tag
git tag -a v1-2021.02.23-foo -m "bar message..."
git push :refs/tags/v1-2021.02.23-foo

# delete tag
git tag -d v1-2021.02.23-foo
git push :refs/tags/v1-2021.02.23-foo
```
