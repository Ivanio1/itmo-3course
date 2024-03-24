#!/usr/local/bin/bash

BACKUPS_DIR="/var/db/postgres6/backups"
TABLE_SPACE="/var/db/postgres6/zzo32"
CURRENT_DATE=$(date "+%Y-%m-%d-%H:%M:%S")
BACKUP_DIR=$BACKUPS_DIR/BACKUP_${CURRENT_DATE}



DATE=$(date "+%Y%m%d%H%M%S")
BACKUP_NAME="backup_${DATE}"

NEW_TABLE_SPACE="/var/db/postgres6/tables_backups/${BACKUP_NAME}"

pg_basebackup -h 127.0.0.1 -p 9455 -U postgres6 -D $BACKUP_DIR -T "${TABLE_SPACE}"="${NEW_TABLE_SPACE}"

scp -r $BACKUP_DIR postgres1@pg158:~/backups/${BACKUP_NAME}/
scp -r $NEW_TABLE_SPACE postgres1@pg158:~/tables_backups/${BACKUP_NAME}/

SECONDS_IN_WEEK=$(( 7 * 24 * 3600 ))

current_time=$(date +%s)
for backup_dir in "$BACKUP_DIR"/*; do
	file_modified_time=$(stat -f %m "$backup_dir")
	time_diff=$((current_time - file_modified_time))
	if [ "$time_diff" -gt "$SECONDS_IN_WEEK" ]; then
		rm -rf "$backup_dir"
		echo "file(dir) deleted $backup_dir"
	fi
done

for tables_dir in "$TABLE_SPACE"/*; do
	file_modified_time=$(stat -f %m "$tables_dir")
	time_diff=$((current_time - file_modified_time))
	if [ "$time_diff" -gt "$SECONDS_IN_MONTH" ]; then
		rm -rf "$tables_dir"
		echo "file(dir) deleted $tables_dir"
	fi
done


ssh postgres1@pg158 "bash ~/remove_script.sh"