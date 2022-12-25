BeforeAll {
    Import-Module .\Utils.psm1 -Force
}

Describe "Unit testing the Utils" -Tag 'Unit' {
    It 'Speak returns the word that was passed in' {
        $result = Speak "Foo"
        $result | Should -Be "Foo"
    }
}

Describe "Write-File tests" {
    
    It 'Writes a file' {
        $testPath = "$($TestDrive)\test.txt"

        Write-File -Content "This is the content" -Filepath $testPath

        $testPath | Should -Exist
    }
}