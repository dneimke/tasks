BeforeAll {
    Import-Module .\HelperTasksCore -Force
}

Describe "Set Logging-Level" {
    Context "When the logging level is set to a valid level" {
        BeforeEach {
            $originalLevel = Get-LoggingLevel
        }

        AfterEach {
            Set-LoggingLevel -Level $originalLevel
        }

        It "The logging level is updated to the new value" {
            Set-LoggingLevel -Level "Information"

            $result = Get-LoggingLevel
            $result | Should -Be "Information"
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

        It "throws exception when given $null" {
             { Set-LoggingLevel -Level $null } |
                Should -Throw -ExceptionType ([Exception])

            $result = Get-LoggingLevel
            $result | Should -Be $originalLevel
        }
    }
}