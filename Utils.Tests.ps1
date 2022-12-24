BeforeAll {
    Import-Module .\Utils.psm1 -Force
}

Describe "Unit testing the Utils" {
    It 'Speak returns the word that was passed in' {
        $result = Speak "Foo"
        $result | Should -Be "Foo"
    }
}