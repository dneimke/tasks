Import-Module Configuration

function Get-Config {
    Import-Configuration
}

function Write-File {
    <#
       .SYNOPSIS
       The Write-DateFile function writes the input message to a target file.
    #>
    
    param (
        [string] $Content,
        [string] $Path
    )

    Write-Log -Message "Running Write-File with content: $Content"
    Set-Content -Path $Path -Value $Content
}



function Write-Log {
    param (
        [string] $Message
    )

    Write-Host $Message
}


$PublicFunctions = @( Get-ChildItem -Path "$($PSScriptRoot)\..\Public\*.ps1" -ErrorAction SilentlyContinue )

# Dot source the functions
foreach ($file in @($PublicFunctions)) {
    try {
        . $file.FullName
    }
    catch {
        $exception = ([System.ArgumentException]"Function not found")
        $errorId = "Load.Function"
        $errorCategory = 'ObjectNotFound'
        $errorTarget = $file
        $errorItem = New-Object -TypeName System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $errorTarget
        $errorItem.ErrorDetails = "Failed to import function $($file.BaseName)"
        throw $errorItem
    }
}

Export-ModuleMember -Function $PublicFunctions.BaseName -Alias *
Export-ModuleMember -Function Get-Config, Write-File, Write-Log