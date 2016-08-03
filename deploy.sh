#!/bin/bash
set -e # Exit with nonzero exit code if anything fails.

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

for SPEC in $SPECS; do
  echo ${SPEC}.bs:
  ERR=$(curl https://api.csswg.org/bikeshed/ -f -F file=@${SPEC}.bs -F output=err)
  if [ -n "$ERR" ]; then
    echo "$ERR"
    exit 1
  fi
done

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Skipping deploy; just doing a build."
    exit 0
fi

# Load the encrypted deploy key so we can push to $TARGET_BRANCH.
echo $DEPLOY_KEY_KEY | gpg --batch --passphrase-fd 0 deploy_key.gpg
chmod 600 deploy_key
eval `ssh-agent -s`
ssh-add deploy_key
rm deploy_key

# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

# Clone the existing gh-pages for this repo into out/
# Create a new empty branch if gh-pages doesn't exist yet (should only happen on first deploy)
git clone $REPO out
cd out
git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH
cd ..

# Clean out existing contents
rm -rf out/*

# Adding back published/ dir, if it exists.
if [ -d published ]; then
  cp -r published/ out/
fi

# Keep links to gh-pages/implementation-status.md working.
cp -r implementation-status.md out/

# Re-generating.
for SPEC in $SPECS; do
  curl https://api.csswg.org/bikeshed/ -f -F file=@${SPEC}.bs > out/${SPEC}.html;
done

# Now let's go push the cloned repo to gh-pages.
cd out
git config user.name "$COMMIT_AUTHOR_NAME"
git config user.email "$COMMIT_AUTHOR_EMAIL"

# If there are no changes to the compiled out (e.g. this is a README update) then just bail.
if [[ -z $(git status -s) ]]; then
    echo "No changes to the output on this push; exiting."
    exit 0
fi

# Commit the "changes", i.e. the new version.
# The delta will show diffs between new and old versions.
git add --all .
git commit -m "Deploy to GitHub Pages: ${SHA}"

# Now that we're all set up, we can push.
git push $SSH_REPO $TARGET_BRANCH
