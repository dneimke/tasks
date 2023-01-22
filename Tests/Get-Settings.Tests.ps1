BeforeAll {
    Import-Module .\ServerTasks -Force

    $defaultLoggingPath = ("{0}/ServerTasks/logs" -f [Environment]::GetFolderPath('ApplicationData'))
}

Describe "Get settings" {
    Context "When the default settings are returned" {
        It "The values are as expected" {
            $settings = Get-Settings -UseDefaults
            $settings.Environment | Should -Be "Development"
            $settings.Logging.Level | Should -Be "Warning"
            $settings.Logging.FolderPath | Should -Be $defaultLoggingPath
        }
    }
}