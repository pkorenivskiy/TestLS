#
# Script.ps1
#

function showSubFolders()
{
    $files = Get-ChildItem -Path $path -Recurse $extension

    $res = New-Object PSCustomObject

    foreach($f in $files)
    {        
        $data = Get-Content $f.FullName | Out-String
        
        $res | Add-Member -Type NoteProperty -Name $f.FullName -Value (-join ($data[0..9])).Trim().Replace("`n", "").Replace("`r", "")
    }
    $res
}


$path = "C:\del"
$extension = "*.txt"
if ($args.Length -lt 2)
{
    Write-Host "Usage Script.ps1 <path> <extension>"
}
else
{
    showSubFolders
}
