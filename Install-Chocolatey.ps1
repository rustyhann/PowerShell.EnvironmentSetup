[CmdletBinding()]
Param()
Begin {
    $ErrorActionPreference = 'Stop'
    $url = 'https://chocolatey.org/install.ps1'
    $start = $PWD
    Set-Location -Path "$($env:HOMEDRIVE)\$($env:HOMEPATH)"
}
Process {
    try {
        # Find a better means of testing if chocolatey is installed
        choco /? | Out-Null
    }
    catch{
        Set-ExecutionPolicy -ExecutionPolicy 'RemoteSigned' -Scope Process
        $command = (New-Object System.Net.WebClient).DownloadString($url)
        Invoke-Expression -Command $command
    }

    # .Net DevPacks
    choco install -y 'netfx-4.0.1-devpack'
    choco install -y 'netfx-4.0.2-devpack'
    choco install -y 'netfx-4.0.3-devpack'
    choco install -y 'netfx-4.5.1-devpack'
    choco install -y 'netfx-4.5.2-devpack'
    choco install -y 'netfx-4.6-devpack'
    choco install -y 'netfx-4.6.1-devpack'
    choco install -y 'netfx-4.6.2-devpack'
    choco install -y 'netfx-4.7-devpack'
    choco install -y 'netfx-4.7.1-devpack'
    choco install -y 'netfx-4.7.2-devpack'
    choco install -y 'netfx-4.8-devpack'

    # MSBuild Tools
    choco install -y 'visualstudio2017buildtools'
    choco install -y 'visualstudio2019buildtools'

    # LogParser
    choco install -y 'logparser'
    choco install -y 'logparserstudio'
}
End {
    Set-Location -Path $start
}
