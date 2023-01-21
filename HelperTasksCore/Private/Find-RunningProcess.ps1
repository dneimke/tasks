
function Find-RunningProcess {
    [CmdletBinding()]
    [OutputType([bool])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline)]
        [string] $Name
    )

    Begin {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
    }

    Process {
        $process = Get-Process | Where-Object { $_.ProcessName -eq $Name }
        if ($process) { return $true } else { return $false }
    }

    End {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
    }
}
