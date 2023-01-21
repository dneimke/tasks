
function Find-RunningProcess {
    [CmdletBinding()]
    [OutputType([bool])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline)]
        [string] $Name
    )

    Begin {
        $Location = $MyInvocation.MyCommand.Path
        $ScriptName = $MyInvocation.MyCommand.Name
        $Caller = $MyInvocation.MyCommand.PSCommandPath

        WriteLog -Message "Starting $ScriptName at $Location. Called from $Caller" -LogLevel Verbose
    }


    Process {

        $process = Get-Process | Where-Object { $_.ProcessName -eq $Name }
        if ($process) { return $true } else { return $false }
    }

    End {
        WriteLog -Message "Completed $ScriptName" -LogLevel Verbose
    }
}
