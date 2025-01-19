#!/bin/bash

source "$(dirname "$0")/.env"

# Dynamically set SSH_AUTH_SOCK
export SSH_AUTH_SOCK=$(systemctl --user show-environment | grep -oP 'SSH_AUTH_SOCK=\K.*')

# Fallback if SSH_AUTH_SOCK is not set
if [ -z "$SSH_AUTH_SOCK" ]; then
  export SSH_AUTH_SOCK="$FALLBACK_SSH_AUTH_SOCK"
fi

cd "$REPO_PATH" || exit 1

echo "Updated on $(date)" >> "$FILE_TO_EDIT"

git add "$FILE_TO_EDIT"
git commit -m "$COMMIT_MESSAGE"
git push origin main >> "$CRON_LOG" 2>&1

