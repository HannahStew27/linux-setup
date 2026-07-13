#!/bin/bash
set -e

sudo apt update
sudo apt upgrade -y

sudo apt install -y gnome-session

sudo apt remove -y gnome-shell-extension-ubuntu-dock
sudo apt remove -y gnome-shell-extension-appindicator
sudo apt install -y gnome-shell-extension-manager

sudo apt remove -y ubuntu-session
sudo apt remove -y xorg xserver-xorg

sudo apt remove -y fonts-*

sudo apt install -y ttf-mscorefonts-installer
sudo apt install -y fonts-noto-color-emoji

mkdir -p ~/.config/fontconfig

cat > ~/.config/fontconfig/fonts.conf << 'EOF'
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <alias>
    <family>sans-serif</family>
    <prefer>
      <family>Verdana</family>
      <family>Noto Color Emoji</family>
    </prefer>
  </alias>
  <alias>
    <family>serif</family>
    <prefer>
      <family>Verdana</family>
      <family>Noto Color Emoji</family>
    </prefer>
  </alias>
  <alias>
    <family>monospace</family>
    <prefer>
      <family>Verdana</family>
      <family>Noto Color Emoji</family>
    </prefer>
  </alias>
</fontconfig>
EOF

fc-cache -fv
