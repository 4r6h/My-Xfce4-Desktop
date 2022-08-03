#!/usr/bin/env bash

while true
do
read -p "Enter your username: " username

vminstall="
pacman --needed --noconfirm -S wget vim reflector
wget -c https://raw.githubusercontent.com/4r6h/ArchyMirrorsBD/main/updatemirrors.sh;chmod +x updatemirrors.sh;sh updatemirrors.sh
su ${username}
sh InstallParu.sh
paru -Syu - <packages.txt --needed --noconfirm
sh InstallFonts.sh
wget -c https://raw.githubusercontent.com/4r6h/mybash/main/mybash.sh;chmod +x mybash.sh;sh mybash.sh
sh set-sddm.sh
sh set-rofi.sh
sh set-alacritty.sh
sh set-locale.sh
sh 02-Fix-display-resolution-in-Arch-Linux-VM.sh"

normalinstall="
pacman --needed --noconfirm -S wget vim reflector
wget -c https://raw.githubusercontent.com/4r6h/ArchyMirrorsBD/main/updatemirrors.sh;chmod +x updatemirrors.sh;sh updatemirrors.sh
su ${username}
sh InstallParu.sh
paru -Syu - <packages.txt --needed --noconfirm
sh InstallFonts.sh
wget -c https://raw.githubusercontent.com/4r6h/mybash/main/mybash.sh;chmod +x mybash.sh;sh mybash.sh
sh set-sddm.sh
sh set-rofi.sh
sh set-alacritty.sh 
sh set-locale.sh"

if [ ! -d /home/$username ]
then
    echo "User does not exist. First create a normal user with sudo or wheel privilages"
else
	read -r -p "Are You Installing in Virtual Machine? then press enter [(defult=Y) Y/n] " vm
    case $vm in
	    [yY][eE][sS]|[yY]|$ENTER)
                  exec $vminstall
		  break
		  ;;
            [nN][oO]|[nN])
                  exec $normalinstall
		  break
		  ;;
            *)
                  echo "Invalid input..."
                  ;;
      esac      
fi
done
