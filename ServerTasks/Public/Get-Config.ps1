<#
    .Description
    Retrieves a JSON configuration file as a PSCustomObject from a designation
    filepath.
#>

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
        Write-Log -Message "[$($MyInvocation.MyCommand.Name)] Function started" -Severity "Verbose"
    }

    Process {
        $settings = Get-Content -Path $Path -Raw | ConvertFrom-Json
        $settings
    }

    End {
        Write-Log -Message "[$($MyInvocation.MyCommand.Name)] Complete" -Severity "Verbose"
    }
}