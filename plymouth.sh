#!/bin/bash
set -e

sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo apt install -y thunar
sudo apt install -y plymouth plymouth-themes

sudo mkdir -p /usr/share/plymouth/themes/parrot

cd /tmp
wget https://raw.githubusercontent.com/HannahStew27/linux-setup/refs/heads/main/Loader-1.png
wget https://raw.githubusercontent.com/HannahStew27/linux-setup/refs/heads/main/Loader-2.png
wget https://raw.githubusercontent.com/HannahStew27/linux-setup/refs/heads/main/Loader-3.png
wget https://raw.githubusercontent.com/HannahStew27/linux-setup/refs/heads/main/Loader-4.png
wget https://raw.githubusercontent.com/HannahStew27/linux-setup/refs/heads/main/Loader-5.png
sudo mv Loader-*.png /usr/share/plymouth/themes/parrot

sudo tee /usr/share/plymouth/themes/parrot/parrot.plymouth > /dev/null << 'EOF'
[Plymouth Theme]
Name=Parrot
Description=From the world famous parrot game
ModuleName=script
[script]
ImageDir=/usr/share/plymouth/themes/parrot
ScriptFile=/usr/share/plymouth/themes/parrot/parrot.script
EOF

sudo tee /usr/share/plymouth/themes/parrot/parrot.script > /dev/null << 'EOF'
screen_width = Window.GetWidth();
screen_height = Window.GetHeight();
Window.SetBackgroundTopColor(0, 0, 0);
Window.SetBackgroundBottomColor(0, 0, 0);
frame_count = 5;
for (i = 1; i <= frame_count; i++) {
  raw = Image("Loader-" + i + ".png");
  images[i] = raw.Scale(screen_width, screen_height);
}
sprite = Sprite();
sprite.SetX(0);
sprite.SetY(0);
frame_num = 1;
fps = 10;
fun refresh_callback() {
  sprite.SetImage(images[frame_num]);
  frame_num++;
  if (frame_num > frame_count) {
    frame_num = 1;
  }
}
Plymouth.SetRefreshFunction(refresh_callback);
Plymouth.SetRefreshRate(fps);
EOF

sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/parrot/parrot.plymouth 100
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u

sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/' /etc/default/grub

sudo update-grub
