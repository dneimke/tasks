# ServerTasks

[![CI Tests](https://github.com/dneimke/tasks/actions/workflows/run-build.yml/badge.svg)](https://github.com/dneimke/tasks/actions/workflows/run-build.yml)

Tasks is a project to demonstrate 'good practices' when working with PowerShell. It includes:

- Demonstration of using modules to bootstrap loading of dependencies
- Layout of public and private functions
- Testing using [Pester](https://pester.dev/)
- Build and test using [Github actions](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-powershell)

Logging and configuration are also implemented. Refer to the docs pages to learn more about the implementation of these.

## Example usage

Use the `ServerTasks` framework to implement your own task-based applications to get the benefits of logging, testing, configuration, and a modular architecture.

Build your Public tasks and wrap them with controller tasks in a `\Tasks` folder and then call your tasks via:

- Configured as Windows Scheduled Tasks
- Octopus runbooks
- From a PowerShell console on a host
- From a CI build process

## Install dependencies

The `ServerTasks` module has the following dependencies that need to be installed on your development machine.

Note: Use the scope of _CurrentUser_ to avoid needing administrator privileges when installing modules.

```ps
Install-Module Pester -Force -Scope CurrentUser -SkipPublisherCheck
Install-Module -Name PSScriptAnalyzer -Force -Scope CurrentUser
```

Refer to [the docs](./docs/deployment.md) for additional information on deploying the ServerTasks module.

## Running tests

The module is covered by unit tests written using [Pester](https://github.com/pester/Pester). You can invoke the tests from the root folder by running the following command.

```ps
Invoke-Pester -Output Detailed
```

You can also run static code analysis checks locally by running the following command.

```ps
Invoke-ScriptAnalyzer -Path .\ServerTasks\ -Recurse
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

Test that the `TargetFolder` is not created when a given proces is running. Start `Calculator` and re-run the command. You should see that the
source folder is not copied while the configured `ProcessName` process is running.

## Useful links

**Creating and working with modules**
- [PowerShellGallery Publishing Guidelines and Best Practices](https://learn.microsoft.com/en-us/powershell/scripting/gallery/concepts/publishing-guidelines?view=powershell-7.3)
- [Understanding and Building PowerShell Modules](https://adamtheautomator.com/powershell-modules)

**Using Pester for testing PS**
- [Pester on Github](https://github.com/pester/Pester) (example showing build server integration and code coverage reporting)
- [Mocking](https://dev.to/azure/test-your-powershell-code-with-pester-4hlc)
- [Advanced usage](https://www.red-gate.com/simple-talk/sysadmin/powershell/advanced-testing-of-your-powershell-code-with-pester/) e.g. running Unit, Integration, and Acceptance tests
- [Should Operators](https://pester.dev/docs/assertions/) and [Custom Assertions](
https://pester.dev/docs/assertions/custom-assertions)


**Useful Github repos**
- [AtlassianPS/Configuration](https://github.com/AtlassianPS/Configuration)
- [AtlassianPS/JiraPS](https://github.com/AtlassianPS/JiraPS)
