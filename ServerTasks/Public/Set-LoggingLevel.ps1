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
        $script:LoggingLevel = $Level
        Set-Content -Value $Level -Path "$script:loggingConfig"
    }

    end {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
    }
}
