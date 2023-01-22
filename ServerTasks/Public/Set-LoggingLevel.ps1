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
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
    }

    process {
        $settings = Get-Settings

        Write-Verbose "The settings file path is $($script:settingsPath)"
        Write-Verbose "Old LoggingLevel: $($settings.Logging.Level ); New LoggingLevel: $($Level)"

        $settings.Logging.Level = $Level

        Set-Content -Path $script:settingsPath -Value "environment = $($settings.Environment)"
        Add-Content -Path $script:settingsPath -Value "logging-level = $($Level)"
        Add-Content -Path $script:settingsPath -Value "logging-folder-path = $($settings.Logging.FolderPath)"
    }

    end {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
    }
}
