$UserName = $env:TARGET_USER
$RootPath = $env:TARGET_PATH

function Get-SubfolderPermissions {
    param (
        [string]$Path,
        [string]$User
    )

    $Folders = Get-ChildItem -Path $Path -Recurse -Directory
    foreach ($Folder in $Folders) {
        $Acl = Get-Acl -Path $Folder.FullName
        foreach ($Access in $Acl.Access) {
            if ($Access.IdentityReference -like "*$User*") {
                Write-Output "Użytkownik $User ma uprawnienia do folderu $($Folder.FullName)"
            }
        }
    }
}

Get-SubfolderPermissions -Path $RootPath -User $UserName