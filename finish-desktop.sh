#!/bin/bash
set -e

sudo apt install -y gnome-session gnome-terminal adwaita-icon-theme-full gnome-backgrounds

sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

cd /tmp
wget https://github.com/Schneegans/Desktop-Cube/releases/download/v31/desktop-cube@schneegans.github.com.zip
gnome-extensions install desktop-cube@schneegans.github.com.zip
rm -f desktop-cube@schneegans.github.com.zip
gnome-extensions enable desktop-cube@schneegans.github.com
