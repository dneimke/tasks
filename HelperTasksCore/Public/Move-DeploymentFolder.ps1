<#
    .Description
    The Move-DeploymentFolder function copies a source folder to a target location.
    If the target folder exists, we check to see if process is running and, if the
    process is running, we do not replace the existing folder.

    If the process is not running, we delete the target folder and then copy the
    source folder to the target destination.
#>

function Move-DeploymentFolder {

    [CmdletBinding()]
    [OutputType([bool])]
    param (
        [Parameter( Mandatory = $true )]
        [ValidateScript({
                if ( -Not ($_ | Test-Path) ) {
                    throw "Source folder does not exist"
                }
                return $true
            })]
        [string] $SourceDir,

        [Parameter( Mandatory = $true )]
        [string] $TargetDir,

        [Parameter( Mandatory = $true )]
        [string] $ProcessName
    )

    Begin {
        $Location = $MyInvocation.MyCommand.Path
        $ScriptName = $MyInvocation.MyCommand.Name
        $Caller = $MyInvocation.MyCommand.PSCommandPath

        WriteLog -Message "Starting $ScriptName at $Location. Called from $Caller" -LogLevel Verbose
    }

    Process {
        Write-Host "Module message is $($script:moduleMessage)"

        $result = Find-RunningProcess -Name $ProcessName

        if ($result -eq $true) {
            return $false
        }

        if (Test-Path $TargetDir) {
            Remove-Item $TargetDir -Force -Recurse
        }

        Copy-Item -path $SourceDir -Destination $TargetDir -Recurse

        return $true
    }

    End {
        WriteLog -Message "Completed $ScriptName" -LogLevel Verbose
    }
}
