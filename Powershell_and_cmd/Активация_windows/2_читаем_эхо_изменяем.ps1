# Чтение файла в массив строк
$content = Get-Content 'seriyniki.txt'

# Перебор всех строк
for ($i=0; $i -lt $content.Length; $i++) {
    # Если строка не начинается с '+', выводим её в консоль и добавляем '+' в начало
    if ($content[$i] -notlike '+*') {
        Write-Output $content[$i]
        $content[$i] = '+' + $content[$i]
    }
}

# Запись обновленного содержимого обратно в файл
$content | Out-File 'file.txt'