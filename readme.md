# Release Management

This repo is used for handy scripts and tasks and other reusable PowerShell code and artifacts for our DevOps processes.

We can use this project to write scripts and have them tested using Pester. This gives us increased confidence about the quality of the code that we are using and sharing.

## Best Practices and Style Guide

per: [The PowerShell Best Practices and Style Guide](https://github.com/PoshCode/PowerShellPracticeAndStyle)

## Install dependencies

The `ReleaseManagementCore` module has the following dependencies that need to be installed on your development machine.

Note: Use the scope of _CurrentUser_ to avoid needing administrator privileges when installing modules.

```ps
Install-Module Pester -Force -Scope CurrentUser -SkipPublisherCheck
Install-Module -Name PSScriptAnalyzer -Force
```

## Running tests

The module is covered by unit tests written using [Pester](https://github.com/pester/Pester). You can invoke the tests from the root folder
by running the following command.

```ps
Invoke-Pester -Output Detailed
```

You can also run static code analysis checks locally by running the following command.

```ps
Invoke-ScriptAnalyzer -Path .\ReleaseMangementCore\ -Recurse
```

## Running the samples

There is a sample named `Invoke-MoveDeploymentFolder` that reads from a configuration file and then calls the Move-DeploymentFolder module command.

To use it create a folder at the location specified by SourceFolder in the configuration file

```json
{
    "SourceFolder": "\\temp\\source-folder",
    "TargetFolder": "\\temp\\target-folder",
    "ProcessName": "CalculatorApp"
}
```

You can then run the following command to invoke the sample

```ps
.\Invoke-MoveDeploymentFolder.ps1
```

After running the command, the `SourceFolder` should be copied to the `TargetFolder` location. 

Test that the `TargetFolder` is not created by starting `Calculator` and re-running the command.

## Deployment

The `ReleaseManagementCore` module can be installed by placing the module in a location specified in 
`$env:PSModulePath`.

You can run the following command to get a list of the valid module locations: 

```ps
 $env:PSModulePath -Split ';'
 ```

On my local machine, the following locations were returned:

```cmd
C:\Users\darre\OneDrive\Documents\PowerShell\Modules
C:\Program Files\PowerShell\Modules
c:\program files\powershell\7\Modules
C:\Program Files\WindowsPowerShell\Modules
C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
C:\Program Files (x86)\Microsoft SQL Server\150\Tools\PowerShell\Modules\
```

The first location is a user specific location but the following 3 locations are suitable paths to use.

After placing the module into a valid module location, you can import the module and use it from any
script running on the machine:


