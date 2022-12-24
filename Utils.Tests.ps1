BeforeAll {
    Import-Module .\Utils.psm1 -Force
}

Describe "Unit testing the Utils" {
    It 'Speak returns the word that was passed in' {
        $result = Speak "Foo"
        $result | Should -Be "Foo"
    }
}

Describe "Write-File tests" {
    
    # It 'Writes a file' {
    #     Mock -CommandName Set-Content -MockWith {} -ModuleName Utils

    #     Write-File -Content "This is the content" -Filepath "C:\temp\tasks\test-file.txt"

    #     Should -Invoke -CommandName Set-Content -Times 1 -Exactly
    # }
}