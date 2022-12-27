Import-Module .\MyModule -Force

$config = Get-Config
Write-Host "The working folder is: $($config.WorkingFolder)"

Get-Planet

$path = "\temp\tasks\$([Guid]::NewGuid()).txt"
Test-Task -Path $path -Content "Written from function"

if (Test-Path $path) {
    Write-Log "Deleting $path"
    Remove-Item $path
}

Write-Log -Message "The log message is Foo"