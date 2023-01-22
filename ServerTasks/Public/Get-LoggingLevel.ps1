function Get-LoggingLevel {

    [CmdletBinding()]
    [OutputType([System.String])]
    param()

    begin {
        Write-Log -Message "[$($MyInvocation.MyCommand.Name)] Function started" -Severity "Verbose"
    }

    process {
        $settings = Get-Settings
        $settings.Logging.Level
    }

    end {
        Write-Log -Message "[$($MyInvocation.MyCommand.Name)] Complete" -Severity "Verbose"
    }
}
