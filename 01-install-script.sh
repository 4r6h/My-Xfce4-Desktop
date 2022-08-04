#!/usr/bin/env bash

while true
do
read -p "Enter your username: " username

vminstall="
pacman --needed --noconfirm -S wget vim reflector
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-locale.sh;chmod +x set-locale.sh;./set-locale.sh
wget -c https://raw.githubusercontent.com/4r6h/ArchyMirrorsBD/main/updatemirrors.sh;chmod +x updatemirrors.sh;./updatemirrors.sh
sudo pacman --needed --noconfirm -S virtualbox-guest-utils
sudo systemctl enable vboxservice.service
su ${username}
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/InstallParu.sh;chmod +x InstallParu.sh;./InstallParu.sh
paru -Syu - <packages.txt --needed --noconfirm
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/InstallFonts.sh;chmod +x InstallFonts.sh;./InstallFonts.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/mybash.sh;chmod +x mybash.sh;./mybash.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-sddm.sh;chmod +x set-sddm.sh;./set-sddm.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-rofi.sh;chmod +x set-rofi.sh;./set-rofi.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-alacritty.sh;chmod +x set-alacritty.sh;./set-alacritty.sh
"

normalinstall="
pacman --needed --noconfirm -S wget vim reflector
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-locale.sh;chmod +x set-locale.sh;./set-locale.sh
wget -c https://raw.githubusercontent.com/4r6h/ArchyMirrorsBD/main/updatemirrors.sh;chmod +x updatemirrors.sh;./updatemirrors.sh
su ${username}
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/InstallParu.sh;chmod +x InstallParu.sh;./InstallParu.sh
paru -Syu - <packages.txt --needed --noconfirm
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/InstallFonts.sh;chmod +x InstallFonts.sh;./InstallFonts.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/mybash.sh;chmod +x mybash.sh;./mybash.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-sddm.sh;chmod +x set-sddm.sh;./set-sddm.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-rofi.sh;chmod +x set-rofi.sh;./set-rofi.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-alacritty.sh;chmod +x set-alacritty.sh;./set-alacritty.sh
"

if [ ! -d /home/$username ]
then
    echo "User does not exist. First create a normal user with home dirrectory and give the user sudo or wheel privilages"
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
