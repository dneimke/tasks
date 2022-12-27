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