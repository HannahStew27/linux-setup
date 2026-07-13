#!/bin/bash
set -e

cd /tmp
wget https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v105.shell-extension.zip
gnome-extensions install dash-to-dockmicxgx.gmail.com.v105.shell-extension.zip
rm -f dash-to-dockmicxgx.gmail.com.v105.shell-extension.zip
gnome-extensions enable dash-to-dock@micxgx.gmail.com

echo "Log out and in then:"
echo "- Right click on dock > edit settings"
echo "- Position and size: Enable on all monitors, show on side left"
echo "- Appearance: Customise background opacity > 0%, show rubbish bin > false"
