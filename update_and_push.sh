#!/bin/bash

source "$(dirname "$0")/.env"

cd "$REPO_PATH" || exit 1

echo "Updated on $(date)" >> "$FILE_TO_EDIT"

GIT_SSH_COMMAND="ssh -i $SSH_KEY_PATH -o IdentitiesOnly=yes" git add "$FILE_TO_EDIT"
GIT_SSH_COMMAND="ssh -i $SSH_KEY_PATH -o IdentitiesOnly=yes" git commit -m "$COMMIT_MESSAGE"
GIT_SSH_COMMAND="ssh -i $SSH_KEY_PATH -o IdentitiesOnly=yes" git push origin main >> "$CRON_LOG" 2>&1



