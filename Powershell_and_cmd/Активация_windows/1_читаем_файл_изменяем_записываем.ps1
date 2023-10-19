# Чтение файла в массив строк
$content = Get-Content 'seriyniki.txt'

#дебаг - сюда доходим
#Write-Host "$content"

# Добавление '+' в начало каждой строки
$content = $content | ForEach-Object { '+' + $_ }

#дебаг 2 - плюсы добавили
#Write-Host "$content"

# Запись обновленного содержимого обратно в файл
$content | Out-File 'file.txt' # ФАЙЛ ДРУГОЙ ДЛЯ ТЕСТА ЧТОБ НЕ ПОРТИТЬ ОСНОВНОЙ