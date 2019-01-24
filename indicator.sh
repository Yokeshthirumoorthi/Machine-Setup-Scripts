function install_indicator_multiload {
    sudo add-apt-repository --remove -y ppa:indicator-multiload/stable-daily;
	sudo add-apt-repository -y ppa:indicator-multiload/stable-daily;
    sudo apt-get install -y indicator-multiload;
}

function main {
    install_indicator_multiload
}

main