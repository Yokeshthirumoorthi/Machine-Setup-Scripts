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

    # install oh-my-zsh plugins
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.oh-my-zsh/themes/spaceship-prompt"
    ln -s "$HOME/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme"

    git clone https://github.com/djui/alias-tips.git $HOME/.oh-my-zsh/custom/plugins/alias-tips
    git clone https://github.com/supercrabtree/k $HOME/.oh-my-zsh/custom/plugins/k
    git clone https://github.com/rupa/z $HOME/.oh-my-zsh/custom/plugins/z
    git clone https://github.com/Valiev/almostontop.git $HOME/.oh-my-zsh/custom/plugins/almostontop

    git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone  https://github.com/zsh-users/zsh-history-substring-search $HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search

    wget -O $HOME/.zshrc https://gist.githubusercontent.com/Yokeshthirumoorthi/3686d075a3da7b498343b91345b62c12/raw/25b386a9cdfd60248dcd7696f797c42997a2c71f/zshrc

    echo "Restart the system"
    echo "OhMyZSH Installed"
}

function main {
    install_ohmyzsh
    # install_prezto
}

main
