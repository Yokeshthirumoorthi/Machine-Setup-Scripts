
function install_latex {
    echo "Installing Latex..."
    # To install Tex Live LaTeX distribution on ubuntu
    sudo apt-get install texlive-full

    # To edit LaTeX documents
    sudo apt-get install texmaker
    echo "Latex Installed"
}

function main {
    install_latex
}

main