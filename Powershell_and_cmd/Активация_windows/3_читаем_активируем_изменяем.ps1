# Чтение файла в массив строк
$content = Get-Content 'seriyniki.txt'

# Перебор всех строк
for ($i=0; $i -lt $content.Length; $i++) {
    # Если строка не начинается с '+' или '-', попытаться активировать Windows
    if ($content[$i] -notlike '+*' -and $content[$i] -notlike '-*') {
        # Выполнить команду активации Windows
        $output = & cscript //nologo slmgr.vbs /ipk $content[$i]
        
        # Если активация успешна, добавить '+' в начало строки
        # В противном случае, добавить '-'
        if ($LASTEXITCODE -eq 0) {
            $content[$i] = '+' + $content[$i]
        } else {
            $content[$i] = '-' + $content[$i]
        }
    }
}

# Запись обновленного содержимого обратно в файл
$content | Out-File 'file.txt'
