[CmdletBinding()]
param()

BEGIN{

    Function Get-ScriptDirectory
    {
        Write-Output $PSScriptRoot
    }

    $context = Join-Path -Path (Get-ScriptDirectory) -ChildPath "context"

}

PROCESS{
    
    docker build --tag springcompdocker/msklc:1.4 --file .\Dockerfile $context
}