#!/bin/bash

# This script sends a notification to a Mattermost channel using a webhook URL.

# Load configuration
source ../config/backup.conf

# Function to send notification
send_notification() {
    local message=$1
    curl -X POST -H 'Content-Type: application/json' -d "{\"text\": \"$message\"}" "$MATTERMOST_WEBHOOK_URL"
}

# Check if the webhook URL is set
if [ -z "$MATTERMOST_WEBHOOK_URL" ]; then
    echo "Mattermost webhook URL is not set. Exiting."
    exit 1
fi

# Send notification
send_notification "$1"