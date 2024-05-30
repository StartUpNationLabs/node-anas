#!/bin/bash

# Save the parent directory of this script to a variable
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Change to the parent of the parent directory of this script
cd $SCRIPT_DIR/..

# Fetch the latest changes from the remote
echo "Fetching latest changes"
git fetch

# Check if there are any changes
if [[ $(git rev-parse HEAD) == $(git rev-parse @{u}) ]]; then
    echo "No changes to pull"
    exit 0
fi

# Pull the latest changes, overwriting any local changes
echo "Pulling latest changes"
git pull -X theirs

# Reveal any new secrets
echo "Revealing secrets"
git secret reveal -f

# Run the on-update.sh script
echo "Running on-update.sh"
bash .on-update.sh