# mattermost-backup-automation

This project provides an automated solution for backing up a Mattermost database using the `backup-restore-tool`. It includes scripts for executing backups, sending notifications on failure, and setting up a cron job for daily backups.

## Project Structure

```
mattermost-backup-automation
├── scripts
│   ├── backup.sh        # Script to perform the backup and log output
│   └── notify.sh        # Script to send notifications to Mattermost
├── config
│   └── backup.conf      # Configuration file for database and S3 settings
├── logs
│   └── .gitkeep         # Keeps the logs directory tracked by Git
├── crontab-setup.sh     # Script to set up the cron job
└── README.md            # Project documentation
```

## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd mattermost-backup-automation
   ```

2. **Configure the backup settings**:
   Copy the sample configuration file and edit it with your credentials:
   ```bash
   cp config/backup.conf.sample config/backup.conf
   # Edit the config/backup.conf file with your actual values

3. **Make the scripts executable**:
   ```bash
   chmod +x scripts/*.sh
   ```

4. **Set up the cron job**:
   Run the `crontab-setup.sh` script to schedule the backup script to run daily at 1 AM:
   ```bash
   ./crontab-setup.sh
   ```

## Usage

- The `backup.sh` script will execute the backup command and log the output to a specified log file. If the backup fails, it will call the `notify.sh` script to send a notification to the specified Mattermost channel.

- The `notify.sh` script is responsible for sending notifications to Mattermost using the configured webhook URL.

## Logging

Logs will be stored in the `logs` directory. Ensure that this directory is writable by the user running the backup script.

## Notes

- Ensure that the `backup-restore-tool` is installed and accessible in your PATH.
- Review the logs regularly to monitor the backup status and any potential issues.