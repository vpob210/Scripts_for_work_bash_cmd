#!/bin/bash

DIRECTORY="./"  # Изменить на актуальный

# Получаем текущую дату минус 30 дней в формате, понятном команде find
MIN_DATE=$(date -d "30 days ago" +%Y%m%d)

# Ищем файлы в указанном каталоге, удовлетворяющие условиям
# В текущем варианте: файл больше 1 ГБ и старше 30 дней. -mmin -60  - условие в минутах
find "$DIRECTORY" -type f -size +1G -mtime +30 -print0 |
while IFS= read -r -d '' file; do
    echo "Удаляем файл: $file"
    # rm "$file"
done