#!/usr/bin/env bash
echo "Installing wget & vim"
sudo pacman -S --noconfirm wget vim reflector
echo "Updating Mirrors"
#wget https://raw.githubusercontent.com/4r6h/ArchyMirrorsBD/main/updatemirrors.sh;sh updatemirrors.sh
#sudo vim /etc/pacman.d/mirrorlist
#wait
echo "Installing Paru"
sh InstallParu.sh
echo "Installing Packages"
paru -Syu - <packages.txt --noconfirm
echo "Installing Fonts"
sh Fonts.sh
echo downloading xresources
wget https://raw.githubusercontent.com/4r6h/mybash/main/.Xresources
echo "Copying .Xresouces"
mv -u .Xresources $HOME/
echo downloading bashrc
wget https://raw.githubusercontent.com/4r6h/mybash/main/.bashrc
echo "Copying .bashrc"
mv -u .bashrc $HOME/
source $HOME/.bashrc
echo "Sddm Configure"
sh set-sddm.sh
echo "Setting Rofi"
sh set-rofi.sh
echo "Setting Alacritty"
sh set-alacritty.sh
echo "Finsh"
