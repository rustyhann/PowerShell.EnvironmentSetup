
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
    scoop install 'git-lfs'

    # Dependencies
    scoop install 'vcredist'
    scoop install 'dotnet'
    scoop install 'dotnet-sdk'
    scoop install 'dotnet-sdk-lts'

    # PowerShell Core
    scoop install 'pwsh'

    # Windows Terminal
    scoop install 'windows-terminal'

    # Vagrant
    scoop install 'portable-virtualbox'
    scoop install 'vagrant'

    # Docker
    scoop install 'docker'
    scoop install 'docker-compose'
    scoop install 'docker-machine'
    scoop install 'posh-docker'

    # Browsers and Email
    scoop install 'opera'
    scoop install 'firefox'
    scoop install 'thunderbird'

    # Tools
    scoop install 'sysinternals'

    # Jekyll
    scoop install 'ruby'
    Invoke-Expression -Command 'ridk install 3'
    Invoke-Expression -Command 'gem install jekyll bundler'

    # Python
    # Anaconda includes Python
    scoop install 'anaconda3'

    # R
    # RStudio includes R
    scoop install 'rstudio'

    # Azure Tools
    scoop install 'azure-ps'
    scoop install 'azure-cli'
    scoop install 'azuredatastudio'
    scoop install 'azure-functions-core-tools'
    scoop install 'storageexplorer'

    # MSBuild
    scoop install 'msbuild-structgured-log-viewer'

    # Go
    scoop install 'go'

    # Rust
    scoop install 'rust'
    scoop install 'rustup'
    scoop install 'rusty-msvc'

    # Java
    scoop install 'openjdk'
    # scoop install 'oraclejdk'
}
End {
    Set-Location -Path $start
}
