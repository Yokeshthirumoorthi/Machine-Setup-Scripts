function install_python {
    sudo apt -y upgrade
    sudo apt install -y python3-pip
    sudo apt install python3-dev
}

function install_java {
    sudo apt install default-jre
    sudo apt install default-jdk
}

function install_rust {
    # To download Rustup and install Rust, run the following in your terminal.
    curl https://sh.rustup.rs -sSf | sh
}

function main {
    install_rust
    install_java
    install_python
}

main