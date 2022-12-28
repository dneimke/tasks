# Load our Bootstapper module
Import-Module .\MyModule -Force

# Load our config using a helper function. The configuration is 
# stored in /MyModule/Configuration.pds1
$config = Get-Config
Write-Host "The working folder is: $($config.WorkingFolder)"

# Call one of our public functions
Get-Planet

# Call another public function - this function is a wrapper around the 
# private Write-File function
$path = "\temp\tasks\$([Guid]::NewGuid()).txt"
Test-Task -Path $path -Content "Written from function"

# cleanup
if (Test-Path $path) {
    # Calls our public logging function
    Write-Log -Message "Deleting $path"
    Remove-Item $path
}
