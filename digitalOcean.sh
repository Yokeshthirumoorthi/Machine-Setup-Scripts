#!/bin/bash
git clone https://github.com/Yokeshthirumoorthi/Machine-Setup-Scripts.git
cd Machine-Setup-Scripts

chmod +x ../update.sh
chmod +x ../ohmyzsh.sh
chmod +x ../languages.sh
chmod +x ../git.sh
chmod +x ../photoprism.sh

yes | ./update.sh
yes | ./ohmyzsh.sh
yes | ./languages.sh
yes | ./git.sh
yes | ./photoprism.sh
# yes | ./docker.sh
# cd ~
# source ~/.zshrc