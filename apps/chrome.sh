#!/bin/bash

# Google Chrome
function install_chrome {
    # Download the latest Google Chrome .deb package with wget:
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    # Install the Google Chrome .deb package by typing:
    sudo dpkg -i google-chrome-stable_current_amd64.deb
}

install_chrome