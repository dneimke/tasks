function Write-File {
    <#
       .SYNOPSIS
       The Write-DateFile function writes the input message to a target file.
    #>
    
    param (
        [string] $Content,
        [string] $Filepath
    )

    Write-Log -Message "Running Write-File with content: $Content"
    Set-Content -Path $Filepath -Value $Content
}

function Speak($Word) {
    return $Word
}


function Write-Log {
    param (
        [string] $Message
    )

    Write-Host $Message
}

Export-ModuleMember -Function Write-Log
Export-ModuleMember -Function Write-File
Export-ModuleMember -Function Speak