#!/bin/bash

source_dir="/путь/к/исходной/папке"
backup_dir="/путь/к/папке/бэкапа"

# просто копируем файлы которые изменились
rsync -av --update "$source_dir/" "$backup_dir/"

# что бы не забыть
# rsync -avz -e "ssh" /путь/к/исходной/папке username@192.168.66.99:/путь/к/целевой/папке

# scp myfile.txt username@remotehost:/path/to/destination/
# scp -r myfolder/ username@remotehost:/path/to/destination/