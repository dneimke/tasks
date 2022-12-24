<#
    .Description
    Test-Task writes content to a designated file.

    .PARAMETER Path
    Specifies the path to write the file. "C:\temp\tasks\log.txt" is the default.

    .PARAMETER Message
    Specifies a message to write into the file. This is a required parameter.
#>
[CmdletBinding()]
param (
    [string] $Path = "C:\temp\tasks\log.txt",
    [string] $Message #= $(throw "Message parameter is required.")
)

Import-Module .\Utils.psm1 -Force

function Test-Task {

    [CmdletBinding()]
    param (
        [string] $Filepath,
        [string] $Content 
    )

    Write-File -Content $Message -Filepath $Filepath
}

Test-Task -Filepath $Path -Content $Message