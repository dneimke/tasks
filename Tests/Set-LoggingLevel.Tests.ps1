BeforeAll {
    Import-Module .\ServerTasks -Force
}

Describe "Set Logging-Level" {
    Context "When setting a valid Log Level" {
        BeforeEach {
            $originalLevel = Get-LoggingLevel
        }

        AfterEach {
            Set-LoggingLevel -Level $originalLevel
        }

         It "Setting to Error updates as expected" {
            Set-LoggingLevel -Level "Error"

            $result = Get-LoggingLevel
            $result | Should -Be "Error"
        }

        It "Setting to Information updates as expected" {
            Set-LoggingLevel -Level "Information"

            $result = Get-LoggingLevel
            $result | Should -Be "Information"
        }

        It "Setting to Warning updates as expected" {
            Set-LoggingLevel -Level "Warning"

            $result = Get-LoggingLevel
            $result | Should -Be "Warning"
        }

        It "Setting to Verbose updates as expected" {
            Set-LoggingLevel -Level "Verbose"

            $result = Get-LoggingLevel
            $result | Should -Be "Verbose"
        }

        It "Setting to Debug updates as expected" {
            Set-LoggingLevel -Level "Debug"

            $result = Get-LoggingLevel
            $result | Should -Be "Debug"
        }
    }

    Context "When the logging level is set to an invalid level" {
        BeforeEach {
            $originalLevel = Get-LoggingLevel
        }

        AfterEach {
            Set-LoggingLevel -Level $originalLevel
        }

        It "throws exception when given 'InvalidValue'" {

            { Set-LoggingLevel -Level "InvalidValue" } |
                Should -Throw -ExceptionType ([Exception])

            $result = Get-LoggingLevel
            $result | Should -Be $originalLevel
        }

        It "throws exception when given `$null" {
             { Set-LoggingLevel -Level $null } |
                Should -Throw -ExceptionType ([Exception])

            $result = Get-LoggingLevel
            $result | Should -Be $originalLevel
        }
    }
}