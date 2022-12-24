BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}


Describe "Get-Planet" {
    It 'Given no parameters, it lists all 8 planets' {
        $allPlanets = Get-Planet
        $allPlanets.Count | Should -Be 8
    }
}