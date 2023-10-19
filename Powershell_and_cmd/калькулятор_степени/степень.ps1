Write-Output ("ДЛЯ ПОЛУЧЕНИЯ РЕЗУЛЬТАТА НУЖНО ВВЕСТИ ЧИСЛО ПОТОМ СТЕПЕНЬ")
$base = Read-Host -Prompt 'Введите число'
$power = Read-Host -Prompt 'Введите степень'
$result = [math]::Pow($base, $power)
Write-Output ("$base в степени $power равно $result")