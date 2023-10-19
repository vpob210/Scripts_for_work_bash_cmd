$base = Read-Host -Prompt 'Введите число'
$maxPower = Read-Host -Prompt 'Введите максимальную степень'
$sum = 0
for ($i=1; $i -le $maxPower; $i++) {
    $sum += [math]::Pow($base, $i)
}
Write-Output ("Сумма $base возведенного по очередно в степень начиная с 1 до $maxPower равна $sum")
