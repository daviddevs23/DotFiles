#!/bin/bash

# Install yay
sudo pacman -S git
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd $HOME
rm -rf yay

# General Setup
yay -S udisks2 slurp grim qt6-wayland qt5-wayland clipman wl-clipboard gvfs thunar xdg-user-dirs
sudo systemctl enable udisks2
xdg-user-dirs-update

yay -S gruvbox-material-gtk-theme-git gruvbox-material-icon-theme-git lxappearance xfce4-settings
yay -S mesa-utils ocrmypdf freecad kicad kicad-library discord firefox chromium

# Apply themes
lxappearance
xfce4-appearance-settings

# set up all sub scripts
for FILE in ./system/*
do
    echo $FILE
    $FILE/install.sh
done
