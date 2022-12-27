BeforeAll {
    . .\Public\Test-Task.ps1
}

Describe "Test-Task" {
    
    It 'Given message, and a filepath, it writes the message to the file' {
        Write-Host "Starting"
        $path = "TestDrive:\$([Guid]::NewGuid()).txt"
        Test-Task -Path $path -Content "Written from tests"
        $path | Should -Exist
    }
}