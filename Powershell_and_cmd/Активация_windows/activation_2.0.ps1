# Путь к текстовому файлу
$filePath = "C:\temp\seriynik.txt"

# Считываем содержимое файла
$fileContent = Get-Content -Path $filePath

# Ищем первую строку, которая не начинается с "+"
$firstLine = $fileContent | Where-Object { -not $_.StartsWith("+") } | Select-Object -First 1

# Проверяем наличие подходящей строки
if ($firstLine) {
    # Активация Windows с использованием лицензионного ключа
    $activationCommand = "slmgr.vbs /ipk $firstLine"
    $activationOutput = Invoke-Expression $activationCommand

    # Проверяем успешность активации
    if ($activationOutput -match "успешно") {
        # Добавляем символ "+" в начало строки
        $updatedLine = "+$firstLine"
        $fileContent = $fileContent -replace [regex]::Escape($firstLine), $updatedLine
        $fileContent | Set-Content -Path $filePath
        Write-Host "Первая строка файла изменена: $updatedLine"
    } else {
        Write-Host "Активация Windows не удалась."
    }
} else {
    Write-Host "Все строки начинаются с символа '+'."
}

# Проверка статуса активации
$activationStatus = & slmgr.vbs /dlv
Write-Host "Статус активации Windows:"
Write-Host $activationStatus