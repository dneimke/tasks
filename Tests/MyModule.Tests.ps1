BeforeAll {
    Import-Module .\MyModule\MyModule.psm1 -Force
}


Describe "Write-File tests" {
    
    It 'Writes a file' {
        $testPath = "$($TestDrive)\test.txt"

        Write-Log -Message "About to write the file"
        Write-File -Content "This is the content" -Path $testPath

        $testPath | Should -Exist
    }
}

Describe "Configuration tests" {
    
    It 'Can read configuration' {
        $config = Get-Config

        $config.WorkingFolder | Should -Be "\temp\data"
    }
}