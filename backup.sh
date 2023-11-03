#!/bin/bash

source_dir="./world"
backup_dir="./backups"

# Create the backup archive for today
datestr=$(date +"%Y-%m-%d")
backup_file="$backup_dir/backup_$datestr.tar.gz"
tar -czvf "$backup_file" "$source_dir"

# Define the retention policy
current_secs=$(date -d "$datestr" +%s)
keep_all_secs=$((10 * 24 * 60 * 60))
keep_sunday_secs=$((30 * 24 * 60 * 60))

# List all backup files in the backup directory
backup_files=($(find "$backup_dir" -maxdepth 1 -type f -name "backup_*.tar.gz" | sort))

for backup in "${backup_files[@]}"; do
    backup_datestr=$(echo "$backup" | sed -n 's/.*backup_\([0-9\-]*\)\.tar\.gz/\1/p')
    backup_secs=$(date -d "$backup_datestr" +%s)
    age_in_secs=$((current_secs - backup_secs))

    if [ "$age_in_secs" -le "$keep_all_secs" ]; then
        # Keep all backups from the last 10 days
        echo "keep all $backup"
        continue
    elif [ "$age_in_secs" -le "$keep_sunday_secs" ] && [ "$(date -d "$backup_datestr" +%u)" -eq 7 ]; then
        # Keep all backups from sunday for the last 30 days
        echo "keep sunday $backup"
        continue
    elif [ "$(date -d "$backup_datestr" +%d)" -eq 01 ]; then
        # Keep one per month forever (on the first day of the month)
        echo "keep first of month $backup"
        continue
    fi

    # Delete backups that don't match the retention policy
    echo "del $backup"
    rm "$backup"
done
