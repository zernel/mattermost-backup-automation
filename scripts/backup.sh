#!/bin/bash

# Load configuration
source ../config/backup.conf

# Define log file
LOG_FILE="../logs/backup_$(date +%Y-%m-%d).log"

# Execute backup command and log output
{
    echo "Starting backup at $(date)"
    backup-restore-tool backup -d "$DB_CONNECTION_STRING" \
    --storage-object-key="$STORAGE_OBJECT_KEY" \
    --storage-bucket="$STORAGE_BUCKET" \
    --storage-access-key="$STORAGE_ACCESS_KEY" \
    --storage-secret-key="$STORAGE_SECRET_KEY" \
    --storage-region="$STORAGE_REGION"

    if [ $? -ne 0 ]; then
        echo "Backup failed at $(date)"
        # Call notify script if backup fails
        ../scripts/notify.sh "Backup failed for Mattermost at $(date)"
        exit 1
    else
        echo "Backup completed successfully at $(date)"
    fi
} &> "$LOG_FILE"