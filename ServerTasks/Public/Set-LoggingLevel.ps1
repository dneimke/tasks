function Set-LoggingLevel {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseShouldProcessForStateChangingFunctions', '')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('Error', 'Warning', 'Information', 'Verbose', 'Debug')]
        [string]
        $Level
    )

    begin {
        Write-Log -Message "[$($MyInvocation.MyCommand.Name)] Function started" -Severity "Verbose"
    }

    process {
        $settings = Get-Settings

        Write-Log -Message "The settings file path is $($script:settingsPath)" -Severity "Debug"
        Write-Log -Message "Old LoggingLevel: $($settings.Logging.Level ); New LoggingLevel: $($Level)" -Severity "Debug"

        $settings.Logging.Level = $Level

        Set-Content -Path $script:settingsPath -Value "environment = $($settings.Environment)"
        Add-Content -Path $script:settingsPath -Value "logging-level = $($Level)"
        Add-Content -Path $script:settingsPath -Value "logging-folder-path = $($settings.Logging.FolderPath)"

        Write-Log -Message "Successfully set the logging level to $Level. Settings file saved at: $($script:settingsPath)" -Severity "Verbose"
    }

    end {
        Write-Log -Message "[$($MyInvocation.MyCommand.Name)] Complete" -Severity "Verbose"
    }
}
