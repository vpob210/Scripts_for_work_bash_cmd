#!/bin/bash

 SOURCE_DIRECTORY="/mnt/share/share"   #Что будем сохранять
 SOURCE_IT_DIRECTORY="/mnt/share/it"
 SOURCE_KADR_DIRECTORY="/mnt/share/kadr"
 SOURCE_BUGH_DIRECTORY="/mnt/share/bugh"
 DIRECTORY_TO_BACKUP="/mnt/data/ShareBackup/"        #Куда положить бэкап
 COPY_DIR="/mnt/data/ShareBackup"                  #Зеркалирование бэкапа
 LOG_FILE="/var/log/backup_test.log"                     #Лог файл

    # Проверка на ошибку.Что бы не дубрировать код. Принимаем 2 переменные код возврата копирования и имя директурии
  log_error() {
    local exit_code=$1
    local dir_name=$2
    if [ $exit_code -ne 0 ]; then
        echo "`date` Ошибка при выполнении команды для директории $dir_name. Код возврата: $exit_code." >> $LOG_FILE
        #
        # Сюда допишу код с уведомлением в телеграмм. И нужно подумать о файле-логов и его размере.
        # 
    else
        echo "`date` Копирование каталога $dir_name завершено." >> $LOG_FILE
    fi
}
 
  function Create_backup() {
    tar -czf ${DIRECTORY_TO_BACKUP}"01"-`date "+%Y-%m-%d"`.tar.gz $SOURCE_DIRECTORY"/01\040Отдел\040продаж"
    log_error $? "/01\040Отдел\040продаж"
    tar -czf ${DIRECTORY_TO_BACKUP}"04"-`date "+%Y-%m-%d"`.tar.gz $SOURCE_DIRECTORY"/04\040Бухгалтерия"
    log_error $? "/04\040Бухгалтерия"
    tar -czf ${DIRECTORY_TO_BACKUP}"05"-`date "+%Y-%m-%d"`.tar.gz $SOURCE_DIRECTORY"/05\040Маркетинг"
    log_error $? "/05\040Маркетинг"
    tar -czf ${DIRECTORY_TO_BACKUP}"06"-`date "+%Y-%m-%d"`.tar.gz $SOURCE_DIRECTORY"/06\040Делопроизводство"
    log_error $? "/06\040Делопроизводство"
    tar -czf ${DIRECTORY_TO_BACKUP}"07"-`date "+%Y-%m-%d"`.tar.gz $SOURCE_DIRECTORY"/07\040Рекрутинг"
    #cp ${DIRECTORY_TO_BACKUP}-`date "+%Y-%m-%d"`* $COPY_DIR
    log_error $? "/07\040Рекрутинг"
    tar -czf ${DIRECTORY_TO_BACKUP}"IT"-`date "+%Y-%m-%d"`.tar.gz $SOURCE_IT_DIRECTORY
    #cp ${DIRECTORY_TO_BACKUP}-`date "+%Y-%m-%d"`* $COPY_DIR
    log_error $? "IT"
    echo "`date` Резервное копирование директории $SOURCE_DIRECTORY завершено." >> $LOG_FILE

    tar -czf ${DIRECTORY_TO_BACKUP}"KADR"-`date "+%Y-%m-%d"`.tar.gz $SOURCE_KADR_DIRECTORY
    #cp ${DIRECTORY_TO_BACKUP}-`date "+%Y-%m-%d"`* $COPY_DIR
    log_error $? "KADR"
    tar -czf ${DIRECTORY_TO_BACKUP}"BUGH"-`date "+%Y-%m-%d"`.tar.gz $SOURCE_BUGH_DIRECTORY
    #cp ${DIRECTORY_TO_BACKUP}-`date "+%Y-%m-%d"`* $COPY_DIR
    log_error $? "BUGH"
}
   
   if [[ ! -d $COPY_DIR || ! -d $DIRECTORY_TO_BACKUP ]]; then
   echo "`date` Не обнаружена директория для бекапа. Создание." >> $LOG_FILE
   mkdir -p $DIRECTORY_TO_BACKUP
   #mkdir -p $COPY_DIR
   fi
   Create_backup

find $DIRECTORY_TO_BACKUP/ -mtime +2 | xargs rm -f; #удаляет предыдущие бэкапы старше 2 дней.