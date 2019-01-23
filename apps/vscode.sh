

function install_extensions {
    echo "Installing Extenstions for VS Code..."
    code --install-extension james-yu.latex-workshop
    code --install-extension zetta.react-native-vscode-extensionpack
    code --install-extension ms-python.python
    code --install-extension pkief.material-icon-theme
    echo "Extenstions for VS Code Installed"
}

function install_vs_code {
    echo "Installing VSCode..."
    # Next, import the Microsoft GPG key using the following wget command:
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

    # And enable the Visual Studio Code repository by typing:
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

    # Once the repository is enabled, install the latest version of Visual Studio Code with:
    sudo apt install code
    echo "VSCode Installed"
}

function main {
    install_vs_code
    install_extensions
}

main