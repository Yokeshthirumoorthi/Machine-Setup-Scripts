#!/bin/bash
git clone https://github.com/Yokeshthirumoorthi/Machine-Setup-Scripts.git
cd Machine-Setup-Scripts
chmod +x ./machine-setup.sh

yes | ./update.sh
yes | ./ohmyzsh.sh
yes | ./languages.sh
yes | ./git.sh
yes | ./photoprism.sh
# yes | ./docker.sh
# cd ~
# source ~/.zshrc