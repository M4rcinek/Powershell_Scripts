$SharePath = $env:TARGET_PATH
$MonthsBack = -4
$CsvOutput = "C:\Temp\Pliki_Ostatnie_4_Miesiace.csv"

$DateLimit = (Get-Date).AddMonths($MonthsBack)

Get-ChildItem -Path $SharePath -File -Recurse -ErrorAction SilentlyContinue |
Where-Object {
    $_.CreationTime -ge $DateLimit
} |
Select-Object @{
        Name = 'RozmiarMB'
        Expression = { [math]::Round($_.Length / 1MB, 2) }
    },
    FullName,
    CreationTime,
    LastWriteTime |
Sort-Object RozmiarMB -Descending |
Export-Csv -Path $CsvOutput -NoTypeInformation -Encoding UTF8

Write-Host "Raport zapisany do: $CsvOutput"