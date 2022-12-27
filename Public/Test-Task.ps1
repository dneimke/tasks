function Test-Task {

    [CmdletBinding()]
    param (
        [string] $Path,
        [string] $Content 
    )

    Write-File -Content $Content -Path $Path
}
