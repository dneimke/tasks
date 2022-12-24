BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Get-Planet" {
    Context 'no parameters' {
        It 'Given no parameters, it lists all 8 planets' {
            $allPlanets = Get-Planet
            $allPlanets.Count | Should -Be 8
        }

        It 'lists them in the correct order' {
            $allPlanets = Get-Planet
            $planetsInOrder = $allPlanets.Name -join ', '
            $planetsInOrder | Should -Be 'Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune'
        }
    }

    Context 'with -Name' {
        It 'Given "Ea*", it lists 1 planet' {
            $allPlanets = Get-Planet -Name "Ea*"
            $allPlanets.Count | Should -Be 1
        }

        It 'Given "*ur*", it returns Mercury, Saturn, and Uranus' {
            $allPlanets = Get-Planet -Name "*ur*"
            $allPlanets.Count | Should -Be 3
        }

        It "Given valid -Name '<Filter>', it returns '<Expected>'" -TestCases @(
            @{ Filter = 'Earth'; Expected = 'Earth' }
            @{ Filter = 'ne*'  ; Expected = 'Neptune' }
            @{ Filter = 'ur*'  ; Expected = 'Uranus' }
            @{ Filter = 'm*'   ; Expected = 'Mercury', 'Mars' }
        ) {
            param ($Filter, $Expected)

            $planets = Get-Planet -Name $Filter
            $planets.Name | Should -Be $Expected
        }

        It "Given invalid parameter -Name 'Alpha Centauri', it returns `$null" {
            $planets = Get-Planet -Name 'Alpha Centauri'
            $planets | Should -Be $null
        }
    }
    
}