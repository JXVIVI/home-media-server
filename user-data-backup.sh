#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load variables from .env file
if [ -f "$SCRIPT_DIR/.env" ]; then
    export $(grep -v '^#' "$SCRIPT_DIR/.env" | xargs)
else
    echo ".env file not found! Exiting."
    exit 1
fi

echo "Starting backup to pCloud..."

# 1. Stop Jellyfin briefly to ensure the SQLite database is not locked/in-use
# This ensures a "clean" backup of your user data.
docker stop jellyfin

# 2. Run rclone sync
# Syncs the local config folder to the pCloud remote
# We use 'sync' so that if you delete a user/meta on the server, 
# it's eventually cleaned up on the backup too.
rclone sync "$SCRIPT_DIR/jellyfin-data/config" "$RCLONE_REMOTE_NAME:$RCLONE_DESTINATION_PATH" --progress

# 3. Restart Jellyfin
docker start jellyfin

echo "Backup complete and Jellyfin restarted."
