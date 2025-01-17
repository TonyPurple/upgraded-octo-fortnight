#!/bin/bash

source "$(dirname "$0")/.env"

eval "$(keychain --eval --agents ssh $SSH_KEY_PATH)"

REPO_PATH="$HOME/scripts"
FILE_TO_EDIT="README.md"
COMMIT_MESSAGE="Automated update via cron job"

cd "$REPO_PATH" || exit 1

echo "Updated on $(date)" >> "$FILE_TO_EDIT"

git add "$FILE_TO_EDIT"
git commit -m "$COMMIT_MESSAGE"
git push origin main

