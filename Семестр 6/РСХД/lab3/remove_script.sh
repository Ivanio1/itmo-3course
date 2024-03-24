#!usr/local/bin/bash
BACKUPS_DIR=\~/backups/

SECONDS_IN_MONTH=$(( 28 * 24 * 3600 ))
current_time=$(date +%s)
for backup_dir in "$BACKUPS_DIR"/*; do
	file_modified_time=$(stat -f %m "$backup_dir")
	time_diff=$((current_time - file_modified_time))
	if [ "$time_diff" -gt "$SECONDS_IN_MONTH" ]; then
		rm -rf "$backup_dir"
		echo "file(dir) deleted $backup_dir"
	fi
done
