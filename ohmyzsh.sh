#!/bin/bash
function install_prezto {
    #prezto is zsh theme

    # Get prezto
    git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

    # Backup zsh config if it exists
    if [ -f ~/.zshrc ];
       then
           mv ~/.zshrc ~/.zshrc.backup
    fi

    # Create links to zsh config files
    ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin
    ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout
    ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
    ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile
    ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv
    ln -s ~/.zprezto/runcoms/zshrc ~/.zshrc
}

function install_ohmyzsh {
    echo "Installing OhMyZSH..."
    sudo apt-get install -y zsh
    wget –no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O – | sh
    chsh -s /bin/zsh
    wget --no-check-certificate http://install.ohmyz.sh -O - | sh
    echo "Restart the system"
    echo "OhMyZSH Installed"
}

function main {
    install_ohmyzsh
    # install_prezto
}

main
