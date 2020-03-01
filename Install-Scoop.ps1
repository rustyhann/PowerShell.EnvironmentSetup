
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

    # Dependencies
    scoop install 'vcredist'
    scoop install 'dotnet'
    scoop install 'dotnet-sdk'
    scoop install 'dotnet-sdk-lts'

    # PowerShell Core
    scoop install 'pwsh'

    # Python
    # Anaconda includes Python
    scoop install 'anaconda3'

    # Windows Terminal
    scoop install 'windows-terminal'

    # R
    # RStudio includes R
    scoop install 'rstudio'

    # Machine Learning
    scoop install 'cuda'

    # Rust
    scoop install 'rust'
    scoop install 'rustup'
    scoop install 'rust-msvc'

    # Azure Tools
    scoop install 'azure-ps'
    scoop install 'azure-cli'
    scoop install 'azuredatastudio'
    scoop install 'azure-functions-core-tools'

    # MSBuild
    scoop install 'msbuild-structgured-log-viewer'

    # Docker
    scoop install 'docker'
    scoop install 'docker-compose'
    scoop install 'docker-machine'
    scoop install 'posh-docker'

    # Mozilla
    scoop install 'firefox'
    scoop install 'thunderbird'

    # Tools
    scoop install 'sysinternals'
}
End {
    Set-Location -Path $start
}
