#!/bin/bash

# Install yay
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd $HOME

yay -S udisks2 xdg-desktop-portal xdg-desktop-portal-wlr grim qt6-wayland qt5-wayland xdg-desktop-portal-gnome
sudo systemctl enable udisks2

yay -S easyeffects nfs-utils freecad kicad kicad-library gruvbox-material-gtk-theme-git gruvbox-material-icon-theme-git
yay -S mesa-utils vulkan-tools btop

# etc/fstab additions
# 10.18.39.3:/export/Mass /Mass  nfs      defaults    0       0
# 10.18.39.3:/export/backups /backups  nfs      defaults    0       0

# Notifications in sway
# https://github.com/ErikReider/SwayNotificationCenter
