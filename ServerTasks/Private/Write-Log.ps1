Function Write-Log()
{
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Message,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('Information','Warning','Error','Verbose')]
        [string]$Severity = 'Information'
    )

    begin {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
    }

    process {
        $settings = Get-Settings
        $level = $settings.Logging.Level

        if($Severity -eq "Error") {
            Write-Host $Message -ForegroundColor Red
        }

        if ($Severity -eq "Warning") {
            if($level -ne "Error") {
                Write-Host $Message -ForegroundColor Yellow
            }
            else {
                return
            }
        }

        if ($Severity -eq "Information") {
            if($level -eq "Information" -or $level -eq "Verbose") {
                Write-Host $Message
            }
            else {
                return
            }
        }

        if ($Severity -eq "Verbose") {
            if($level -eq "Verbose") {
                Write-Host $Message -ForegroundColor Yellow
            }
            else {
                return
            }
        }

        $logFolder = $settings.Logging.FolderPath
        $logFilename = "LogFile.csv"

        if(!(Test-Path $logFolder)) {
            New-Item $logFolder -ItemType Directory
            Write-Host "Log folder successfully created at $logFolder"
        }

        [pscustomobject]@{
            Time = (Get-Date -f g)
            Message = $Message
            Severity = $Severity
        } | Export-Csv -Path "$logFolder\$logFilename" -Append -NoTypeInformation
    }

    end {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
    }
}
