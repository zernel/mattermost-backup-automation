#!/bin/bash

# This script sets up a cron job to run the backup script every day at 1 AM.

# Define the cron job
CRON_JOB="0 1 * * * /path/to/mattermost-backup-automation/scripts/backup.sh >> /path/to/mattermost-backup-automation/logs/backup.log 2>&1"

# Add the cron job to the crontab
(crontab -l; echo "$CRON_JOB") | crontab - 

echo "Cron job added: $CRON_JOB"