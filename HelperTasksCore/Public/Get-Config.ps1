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
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
    }

    Process {
        $settings = Get-Content -Path $Path -Raw | ConvertFrom-Json
        $settings
    }

    End {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
    }
}