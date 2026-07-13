#!/bin/bash
set -e

cd /tmp
wget https://raw.githubusercontent.com/HannahStew27/linux-setup/refs/heads/main/Login.png
sudo mv Login.png /usr/share/backgrounds/login.png

sudo apt install -y libglib2.0-dev dconf-cli git

git clone --depth=1 https://github.com/realmazharhussain/gdm-tools.git
cd gdm-tools
./install.sh

set-gdm-theme backup update
set-gdm-theme set Yaru-dark /usr/share/backgrounds/login.png
