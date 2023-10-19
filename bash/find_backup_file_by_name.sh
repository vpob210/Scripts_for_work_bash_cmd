!/bin/bash

backup_file="backup_"
timestamp_older=$(date -d "-3 days" +%m_%d_%Y)
old_backup_file="$backup_file$timestamp_older"

timestamp=$(date +%m_%d_%Y)
new_backup_file="backup_${timestamp}"

#echo $timestamp
#echo $new_backup_file
#echo $old_backup_file

# Проверяем наличие
if ls $old_backup_file 1> /dev/null 2>&1; then
    echo $old_backup_file
   # rm $old_backup_file
fi