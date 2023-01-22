
function Find-RunningProcess {
    [CmdletBinding()]
    [OutputType([bool])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline)]
        [string] $Name
    )

    Begin {
        Write-Log -Message "[$($MyInvocation.MyCommand.Name)] Function started" -Severity "Verbose"
    }

    Process {
        $process = Get-Process | Where-Object { $_.ProcessName -eq $Name }
        if ($process) { return $true } else { return $false }
    }

    End {
        Write-Log -Message "[$($MyInvocation.MyCommand.Name)] Complete" -Severity "Verbose"
    }
}
