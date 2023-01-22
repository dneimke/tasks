<#
    .Description
    Retrieves the module settings as a PSCustomObject.

    Note: don't use Write-Log in this function as it will cause recursive calls and
    the application will hang.
#>

function Get-Settings {

    [CmdletBinding()]
    [OutputType([psobject])]
    param (
        [switch] $UseDefaults
    )

    Process {
        $defaults = GetDefaults

        if($UseDefaults.IsPresent) { return $defaults }
        if(!(Test-Path $script:settingsPath))  { return $defaults }

        Get-Content $script:settingsPath | ForEach-Object {

            Write-Verbose "The line item is: $($_)"
            $arr = $_.Split("=")


            if($arr.Length -ne 2) { continue }

            $name = $arr[0].Trim()
            $val = $arr[1].Trim()

            Write-Verbose "name: $name; val: $val"

            switch ($name) {
                "environment" { $defaults.Environment = $val }
                "logging-level" { $defaults.Logging.Level = $val }
                "logging-folder-path" { $defaults.Logging.FolderPath = $val }
                Default {}
            }
        }

        Write-Verbose $defaults.Logging

        $defaults
    }
}


function GetDefaults {
    $defaults = [pscustomobject]@{
        Environment = 'Development'
        Logging = & {
            Write-Output ([pscustomobject]@{
                Level = 'Warning'
                FolderPath = ("{0}/ServerTasks/logs" -f [Environment]::GetFolderPath('ApplicationData'))
            })
        }
    }
    $defaults
}