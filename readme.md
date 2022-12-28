# Tasks

[![CI Tests](https://github.com/dneimke/tasks/actions/workflows/run-build.yml/badge.svg)](https://github.com/dneimke/tasks/actions/workflows/run-build.yml)

Tasks is a project to demonstrate 'good practices' when working with PowerShell. It includes:

- Demonstration of using modules to bootstrap loading of dependencies
- Layout of public and private functions
- Testing using [Pester](https://pester.dev/)
- Loading configuration using [Configuration](https://github.com/AtlassianPS/Configuration)
- Build and test using [Github actions](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-powershell)

## Getting started

You can run `Test-Script.ps1` locally to exercise the logic.  You can also run `Invoke-Pester` from the root folder to run unit tests.

## Useful links

**Using Pester for testing PS**
- [Pester on Github](https://github.com/pester/Pester) (example showing build server integration and code coverage reporting)
- [Mocking](https://dev.to/azure/test-your-powershell-code-with-pester-4hlc)
- [Advanced usage](https://www.red-gate.com/simple-talk/sysadmin/powershell/advanced-testing-of-your-powershell-code-with-pester/) e.g. running Unit, Integration, and Acceptance tests
- [Should Operators](https://pester.dev/docs/assertions/) and [Custom Assertions](
https://pester.dev/docs/assertions/custom-assertions)

**Useful Github repos**
- [AtlassianPS/Configuration](https://github.com/AtlassianPS/Configuration)
- [AtlassianPS/JiraPS](https://github.com/AtlassianPS/JiraPS)