#!/bin/bash

# Configuration
LOG_DIR="~/.jenkins/war/help/LogRecorder"
BACKUP_DIR="/home/pglab/Desktop/backupDir"
RETENTION_DAYS=7
DATE=$(date +'%Y-%m-%d')

mkdir -p "$BACKUP_DIR"

backup_logs() {
    local backup_file="$BACKUP_DIR/logs_$DATE.tar.gz"
    tar -czf "$backup_file" -C "$LOG_DIR" .
    if [ $? -eq 0 ]; then
        echo "$(date +'%Y-%m-%d %H:%M:%S'): Successfully created backup $backup_file"
    else
        echo "$(date +'%Y-%m-%d %H:%M:%S'): Failed to create backup $backup_file" >&2
        exit 1
    fi
}

backup_logs

