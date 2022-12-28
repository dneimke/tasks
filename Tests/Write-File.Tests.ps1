BeforeAll {
    . .\Private\Write-File.ps1
}

Describe "Test-Task" {
    
    It 'Given message, and a filepath, it writes the message to the file' {
        Write-Log "Starting"
        $path = "TestDrive:\$([Guid]::NewGuid()).txt"
        Write-File -Path $path -Content "Written from tests"
        $path | Should -Exist
    }
}