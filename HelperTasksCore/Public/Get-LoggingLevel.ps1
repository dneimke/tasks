function Get-LoggingLevel {

    [CmdletBinding()]
    [OutputType([System.String])]
    param()

    begin {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
    }

    process {
        return $script:LoggingLevel
    }

    end {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
    }
}
