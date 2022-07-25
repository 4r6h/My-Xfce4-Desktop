#!/usr/bin/env bash

while true
do
      read -r -p "Are You Installing in VM? [Y/n] " input
      case $input in
            [yY][eE][sS]|[yY])
                  sh 02-Fix-display-resolution-in-Arch-Linux-VM.sh
                  break
                  ;;
            [nN][oO]|[nN])                                                                                                                                                        
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "------------------------------------Installing wget & vim-------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
sudo pacman --needed --noconfirm -S wget vim reflector
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "---------------------------------------Updating Mirrors---------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
wget https://raw.githubusercontent.com/4r6h/ArchyMirrorsBD/main/updatemirrors.sh;chmod +x updatemirrors.sh;sh updatemirrors.sh
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "------------------------------------------Installing Paru-------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
su ${users};sh InstallParu.sh
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------Installing Packages-----------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
paru -Syu - <packages.txt --noconfirm --needed
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "-----------------------------------------Installing Fonts-------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
sh Fonts.sh
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "--------------------------------------Downloading .Xresources----------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
wget https://raw.githubusercontent.com/4r6h/mybash/main/.Xresources
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------Moving .Xresouces-------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
mv -u .Xresources $HOME/
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "---------------------------------------Downloading .bashrc------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
wget https://raw.githubusercontent.com/4r6h/mybash/main/.bashrc
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "-----------------------------------------Moving .bashrc---------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
mv -u .bashrc $HOME/
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------Sourcing .bashrc--------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
source $HOME/.bashrc
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "-----------------------------------------Sddm Configure---------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
sh set-sddm.sh
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "------------------------------------------Setting Rofi----------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
sh set-rofi.sh
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------Setting Alacritty-------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
sh set-alacritty.sh
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "--------------------------------------------Finshed-------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------------"

break
                  ;;
            *)
                  echo "Invalid input..."
                  ;;
      esac      
done
