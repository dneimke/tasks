Import-Module ..\ServerTasks -Force

$config = Get-Config -Path ./Invoke-MoveDeploymentFolder.json

Move-DeploymentFolder -SourceDir $config.SourceFolder `
    -TargetDir $config.TargetFolder `
    -ProcessName $config.ProcessName `
    -Verbose
