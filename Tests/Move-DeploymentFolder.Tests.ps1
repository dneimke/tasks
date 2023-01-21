BeforeAll {
    Import-Module .\HelperTasksCore -Force

    Write-Host "From Tests: Module message is $($script:moduleMessage)"

    $SourcePath = "TestDrive:\$([Guid]::NewGuid())"
    New-Item -Path $SourcePath -ItemType Directory
}

Describe "Move deployment folder" {
    Context "When the process is running" {
        BeforeEach {
            Mock -CommandName Find-RunningProcess -ModuleName "HelperTasksCore" -MockWith { return $true }
        }

        It "Given a process is running, the deployment folder is not moved" {

            $targetPath = "TestDrive:\$([Guid]::NewGuid())"
            $process = "dummy"

            $result = Move-DeploymentFolder -SourceDir $SourcePath -TargetDir $targetPath -ProcessName $process
            $result | Should -Be $false
        }
    }

    Context "When the process is not running" {
        BeforeEach {
            Mock -CommandName Find-RunningProcess -ModuleName "HelperTasksCore" -MockWith { return $false }
        }

        It "Given a process is not running, the deployment folder is moved" {

            $targetPath = "TestDrive:\$([Guid]::NewGuid())"
            $process = "dummy"

            $result = Move-DeploymentFolder -SourceDir $SourcePath -TargetDir $targetPath -ProcessName $process
            $result | Should -Be $true
        }
    }
}