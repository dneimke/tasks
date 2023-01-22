#region Configuration
$moduleConfigPath = ("{0}/ServerTasks/global-config" -f [Environment]::GetFolderPath('ApplicationData'))
$defaultSettingsPath = ("{0}/ServerTasks/settings" -f [Environment]::GetFolderPath('ApplicationData'))

if (-not (Test-Path $moduleConfigPath)) {
    $null = New-Item -Path $moduleConfigPath -ItemType File -Force
    Set-Content -Value $defaultSettingsPath -Path $moduleConfigPath
}

$script:settingsPath = Get-Content $moduleConfigPath
#endregion


$PublicScripts = @( Get-ChildItem -Path "$($PSScriptRoot)\Public\*.ps1" -ErrorAction SilentlyContinue )
$PrivateScripts = @( Get-ChildItem -Path "$($PSScriptRoot)\Private\*.ps1" -ErrorAction SilentlyContinue )

# Dot source the functions
foreach ($file in @($PublicScripts + $PrivateScripts)) {

    try {
        . $file.FullName
    }
    catch {
        $exception = ([System.ArgumentException]"Function not found")
        $errorId = "Load.Function"
        $errorCategory = 'ObjectNotFound'
        $errorTarget = $file
        $errorItem = New-Object -TypeName System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $errorTarget
        $errorItem.ErrorDetails = "Failed to import function $($file.BaseName)"
        throw $errorItem
    }
}

Export-ModuleMember -Function $PublicScripts.BaseName -Alias *
Export-ModuleMember -Function $PrivateScripts.BaseName -Alias *