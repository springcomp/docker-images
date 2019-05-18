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

    Copy-Item -Path "C:\Program Files (x86)\Microsoft Keyboard Layout Creator 1.4\*" -Recurse -Force -Filter "*.*" -Destination $context

}