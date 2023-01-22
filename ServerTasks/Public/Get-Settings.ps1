function Get-Settings {

    [CmdletBinding()]
    [OutputType([psobject])]
    param (
        [switch] $UseDefaults
    )

    Begin {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
    }

    Process {
        $defaults = GetDefaults

        Write-Verbose $defaults

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

    End {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
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