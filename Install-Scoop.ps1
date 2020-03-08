
[CmdletBinding()]
Param()
Begin {
    $ErrorActionPreference = 'Stop'
    $url = 'https://get.scoop.sh'
    $start = $PWD
    Set-Location -Path $env:HOMEPATH
}
Process {
    If ((Test-Path -Path .\scoop) -eq $false){
        Set-ExecutionPolicy RemoteSigned -scope CurrentUser
        $command = (new-object net.webclient).downloadstring($url)
        Invoke-Expression -Command $command
    }

    # Buckets
    scoop bucket add 'versions'
    scoop bucket add 'extras'
    scoop bucket add 'java'

    # Base packages
    scoop install '7zip'
    scoop install 'git'

    # PowerShell Core
    scoop install 'pwsh'

    # Windows Terminal
    scoop install 'windows-terminal'

    # Vagrant
    scoop install 'vagrant'

    # Docker
    scoop install 'docker'
    scoop install 'docker-compose'
    scoop install 'docker-machine'

    # Browsers and Email
    scoop install 'firefox'
    scoop install 'thunderbird'

    # Fun
    scoop install steam
    scoop install discord
}
End {
    Set-Location -Path $start
}
