#!/bin/bash

TIME="$(date +"%Y%m%d_%H%M%S")"
LOG="/root/logs/backup-db-to-cos-$TIME.log"
DUMP_FILE="/root/database/$TIME.sql"

# Dump database to local
mysqldump -uroot -pDB_PASS DB_NAME > $DUMP_FILE --log-error=$LOG

# Upload dump file to COS
coscmd upload $DUMP_FILE / > /dev/null 2>>$LOG
