#!/bin/bash
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
    # Ref: https://hoverbear.org/2017/03/03/setting-up-a-rust-devenv/

    # To download Rustup and install Rust, run the following in your terminal.
    curl https://sh.rustup.rs -sSf | sh -0

    # To configure your current shell run 
    source $HOME/.cargo/env

    # install the Rust source and documentation locally for later use when offline or for tools such as the autocompletion 
    rustup component add rust-src
    rustup component add rust-docs

    # update toolchain
    rustup update

    # install the nightly (or beta) version alongside stable
    rustup toolchain install nightly

    # can change the default toolchain of the system
    # rustup default stable or rustup default nightly,
    # rustup override set nightly

    # Valuable Tools

    # rust-clippy - A linter.
    # rustfmt - A code formatter.
    # racer - An autocompletion utility.
    # rls - A language server (for symbol search etc.)

    rustup component add clippy-preview
    cargo install rustfmt
    cargo install racer
    
    sudo apt install libpq-dev libsqlite3-dev
    cargo install diesel_cli
    
    # Extension: LLDB Debugger
    pip install six

}

function main {
    install_python
    install_java
    install_rust
}

main