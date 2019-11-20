#!/bin/bash
set -e
set -x
mkdir temp
cd temp
curl -LO https://sourceforge.net/projects/mscorefonts2/files/cabs/PowerPointViewer.exe
cabextract -L -F ppviewer.cab PowerPointViewer.exe
cabextract ppviewer.cab
sudo mkdir -p /usr/share/fonts/truetype/consolas
sudo cp CONSOLA*.TTF /usr/share/fonts/truetype/consolas
sudo fc-cache -fv