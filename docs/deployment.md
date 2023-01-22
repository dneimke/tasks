# Deployment

The `ServerTasks` module can be installed by placing the module in a location specified in
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

The first location is a user specific location and is ideal to use for development purposes. The next 3 locations are also suitable paths to use.

After placing the module into a valid module location, you can import the module and use it from any script running on the machine like so.

```ps
Import-Module ServerTasks -Force
```