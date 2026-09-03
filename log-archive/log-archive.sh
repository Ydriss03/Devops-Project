#!/bin/bash

# ==========================================
# Log Archive Tool
# ==========================================

# Check that a log directory was provided
if [ $# -ne 1 ]; then
    echo "Usage: log-archive <log-directory>"
    exit 1
fi

LOG_DIR="$1"

# Check that the directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# Archive configuration
ARCHIVE_DIR="/var/log-archives"
LOG_FILE="$ARCHIVE_DIR/archive.log"

# Create archive directory if it doesn't exist
sudo mkdir -p "$ARCHIVE_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Define archive filename
ARCHIVE_FILE="$ARCHIVE_DIR/logs_$TIMESTAMP.tar.gz"

# Create compressed archive
sudo tar -czf "$ARCHIVE_FILE" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")"

# Check whether archive was created successfully
if [ $? -eq 0 ]; then

    echo "$(date +"%Y-%m-%d %H:%M:%S") - Archive created: $ARCHIVE_FILE" | sudo tee -a "$LOG_FILE" > /dev/null

    echo "Archive successfully created:"
    echo "$ARCHIVE_FILE"

else

    echo "$(date +"%Y-%m-%d %H:%M:%S") - ERROR: Failed to archive $LOG_DIR" | sudo tee -a "$LOG_FILE" > /dev/null

    echo "Error: Failed to create archive."
    exit 1

fi