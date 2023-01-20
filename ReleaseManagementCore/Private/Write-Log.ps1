function Write-Log {

    [CmdletBinding()] 
    param (
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $Message,

        [Parameter(Mandatory = $false, Position = 1)]
        [ValidateSet('Error', 'Warning', 'Information', 'Verbose', 'Debug')]
        [string] $LogLevel = 'Information'
    )

    Process {
        
        switch ($LogLevel) {
            'Error' { Write-Error $Message }
            'Warning' { Write-Warning $Message }
            'Information' { Write-Host $Message }
            'Verbose' { Write-Verbose $Message }
            'Debug' { Write-Debug $Message }
            default { throw "Invalid log level: $_" }
        }
    }

}