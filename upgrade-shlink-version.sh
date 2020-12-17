#!/bin/bash

set -eu

NEW_SHLINK_VERSION=$1

git reset --hard HEAD
git pull

echo -n "-----> Editing & pushing Shlink version file..."
echo "$NEW_SHLINK_VERSION" > ./bin/version
git add ./bin/version
git commit -m "Upgrade version to $NEW_SHLINK_VERSION"
git push
echo "done"

echo -n "-----> Releasing and publishing a new tag..."
git fetch --all --tags
git tag -a "v$NEW_SHLINK_VERSION" -m "Release v$NEW_SHLINK_VERSION"
git push --tag
echo "done"
