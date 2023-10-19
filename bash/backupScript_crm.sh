#!/bin/bash

directory="/mnt/backup/crm"
/opt/ < my_crm_folder > /mysql/bin/mysqldump --opt -Q -u root -p< my_pass > sugarcrm > $directory"/crm_dump.sql"


#если нужно восстановить:
#/opt/ < my_crm_folder > /mysql/bin/mysq -u root -p< my_pass > sugarcrm < /mnt/backup/crm/crm_dump.sql