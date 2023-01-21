function Get-Config {

    [CmdletBinding()]
    [OutputType([psobject])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateScript({
                if (-Not($_ | Test-Path)) {
                    throw "Path does not exist"
                }
                return $true
            })]
        [string] $Path
    )

    Begin {
        $Location = $MyInvocation.MyCommand.Path
        $ScriptName = $MyInvocation.MyCommand.Name
        $Caller = $MyInvocation.MyCommand.PSCommandPath

        WriteLog -Message "Starting $ScriptName at $Location. Called from $Caller" -LogLevel Verbose
    }

    Process {
        $settings = Get-Content -Path $Path -Raw | ConvertFrom-Json
        $settings
    }

    End {
        WriteLog -Message "Completed $ScriptName" -LogLevel Verbose
    }
}