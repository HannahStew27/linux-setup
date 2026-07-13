#!/bin/bash
set -e

sudo apt install -y gnome-shell-extensions
gnome-extensions enable user-theme@gnome-shell-extensions.gnome.org

mkdir -p ~/.themes/PinkBar/gnome-shell

cat > ~/.themes/PinkBar/gnome-shell/gnome-shell.css << 'EOF'
#panel {
    background-color: #f15797 !important;
}
#panel .panel-button,
#panel .panel-button:hover,
#panel .panel-button:active,
#panel .panel-button:focus,
#panel .panel-button:checked {
    color: #000000;
}
EOF

echo "On extension Manager, select the User Themes extension settings and select PinkBar"
