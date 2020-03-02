Begin {
    $ErrorActionPreference = 'Stop'
    $url = 'https://get.scoop.sh'
    $start = $PWD
    Set-Location -Path "$env:HOMEDRIVE\$env:HOMEPATH"
}
Process {
    If ((Test-Path -Path .\scoop) -eq $false){
        Set-ExecutionPolicy RemoteSigned -scope CurrentUser
        $command = (new-object net.webclient).downloadstring($url)
        Invoke-Expression -Command $command
    }

    # Visual Studio Code
    scoop install 'vscode'

    # Theme
    code --install-extension 'jdinhlife.gruvbox'

    # General
    code --install-extension 'stkb.rewrap'
    code --install-extension 'Tyriar.sort-lines'

    # PowerShell
    code --install-extension 'ms-vscode.powershell'

    # Python
    code --install-extension 'ms-python.python'

    # Rust
    code --install-extension 'wolfulus.rust-extension-pack'

    # GO
    code --install-extension 'ms-vscode.Go'

    # Markdown
    code --install-extension 'DavidAnson.vscode-markdownlint'
    code --install-extension 'shd101wyy.markdown-preview-enhanced'
    code --install-extension 'yzane.markdown-pdf'

    # YAML
    code --install-extension 'redhat.vscode-yaml'

    # Latex
    code --install-extension 'James-Yu.latex-workshop'
    code --install-extension 'tecosaur.latex-utilities'

    # Typescript
    code --install-extension 'ms-vscode.vscode-typescript-next'

    # Data
    code --install-extension 'janisdd.vscode-edit-csv'
    code --install-extension 'RandomFractalsInc.vscode-data-preview'\
}
End {
    Set-Location -Path $start
}
