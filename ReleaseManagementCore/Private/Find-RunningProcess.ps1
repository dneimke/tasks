function Find-RunningProcess {

    [CmdletBinding()]
    [OutputType([bool])]
    param (
        [Parameter( Mandatory = $true, ValueFromPipeline)]
        [string] $Name
    )

    Begin {
        $Location = $MyInvocation.MyCommand.Path
        $ScriptName = $MyInvocation.MyCommand.Name
        $Caller = $MyInvocation.MyCommand.PSCommandPath
        
        Write-Log -Message "Starting $ScriptName at $Location. Called from $Caller" -LogLevel Verbose
    }    

    Process {
        $process = Get-Process | Where-Object { $Name -eq $_.ProcessName } 
        if ($process) { return $true } else { return $false }
    }   
    
    End {
        Write-Log -Message "Completed $ScriptName" -LogLevel Verbose 
    }
}
