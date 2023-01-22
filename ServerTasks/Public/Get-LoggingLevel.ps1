function Get-LoggingLevel {

    [CmdletBinding()]
    [OutputType([System.String])]
    param()

    begin {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
    }

    process {
        $settings = Get-Settings
        $level = $settings.Logging.Level
        Write-Verbose "Returning a logging level of $level"
        $level
    }

    end {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
    }
}
