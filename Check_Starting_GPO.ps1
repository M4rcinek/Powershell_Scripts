
# Skrypt PowerShell do sprawdzania lokalizacji uruchamiania aplikacji przy starcie systemu

Write-Host "=== Skrypty uruchamiania GPO ==="
$startupScripts = Get-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System\Scripts\Startup" -ErrorAction SilentlyContinue
if ($startupScripts) {
    $startupScripts.PSObject.Properties | ForEach-Object {
        Write-Host "$($_.Name): $($_.Value)"
    }
} else {
    Write-Host "Brak skryptów uruchamiania GPO."
}

Write-Host "`n=== Wpisy Run w rejestrze ==="
$runPaths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
)
foreach ($path in $runPaths) {
    Write-Host "`n$path"
    $entries = Get-ItemProperty -Path $path -ErrorAction SilentlyContinue
    if ($entries) {
        $entries.PSObject.Properties | ForEach-Object {
            if ($_.Name -ne "PSPath" -and $_.Name -ne "PSParentPath" -and $_.Name -ne "PSChildName" -and $_.Name -ne "PSDrive" -and $_.Name -ne "PSProvider") {
                Write-Host "$($_.Name): $($_.Value)"
            }
        }
    } else {
        Write-Host "Brak wpisów."
    }
}

Write-Host "`n=== Zaplanowane zadania ==="
$tasks = Get-ScheduledTask | Where-Object { $_.TaskPath -notlike "\Microsoft*" }
foreach ($task in $tasks) {
    Write-Host "Nazwa: $($task.TaskName), Ścieżka: $($task.TaskPath)"
}

Write-Host "`n=== Instalacje oprogramowania przez GPO ==="
$gpoSoftware = Get-WmiObject -Class Win32_Product | Where-Object { $_.Caption -like "*Assigned*" -or $_.Caption -like "*Published*" }
if ($gpoSoftware) {
    $gpoSoftware | ForEach-Object {
        Write-Host "Nazwa: $($_.Name), Wersja: $($_.Version)"
    }
} else {
    Write-Host "Brak instalacji oprogramowania przez GPO wykrytych przez WMI."
}
