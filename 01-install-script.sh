#!/usr/bin/env bash

while true
do
read -p "Enter your username: " username

update_mirrors="
pacman --noconfirm --needed -S wget vim reflector
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-locale.sh;chmod +x set-locale.sh;./set-locale.sh
wget -c https://raw.githubusercontent.com/4r6h/ArchyMirrorsBD/main/updatemirrors.sh;chmod +x updatemirrors.sh;./updatemirrors.sh
"
vmmachine="
sudo pacman --noconfirm --needed -S virtualbox-guest-utils
sudo systemctl enable vboxservice.service
"
noparu="
su ${username}
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/InstallParu.sh;chmod +x InstallParu.sh;./InstallParu.sh
paru -Syu - <packages.txt --noconfirm --needed 
"
yesparu="
su ${username}
paru -Syu - <packages.txt --noconfirm --needed
"
common="
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/InstallFonts.sh;chmod +x InstallFonts.sh;./InstallFonts.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/mybash.sh;chmod +x mybash.sh;./mybash.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-sddm.sh;chmod +x set-sddm.sh;./set-sddm.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-rofi.sh;chmod +x set-rofi.sh;./set-rofi.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-alacritty.sh;chmod +x set-alacritty.sh;./set-alacritty.sh
"
vminstall="
exec $update_mirrors
exec $vmmachine
if [ -f /bin/paru* ]; then
	exec $yesparu
else 
	exec $noparu
fi
exec $common
"

normalinstall="
exec $update_mirrors
if [ -f /bin/paru* ]; then
	exec $yesparu
else 
	exec $noparu
fi
exec $common
"

if [ ! -d /home/$username ]
then
    echo "User does not exist. First create a normal user with home dirrectory and give the user sudo or wheel privilages"
else
cd /home/$username; mkdir My_Xfce4_Desktop_Scripts; cd My_Xfce4_Desktop_Scripts
	read -r -p "Are You Installing in Virtual Machine? then press enter [(Y/n) (defult=Y)] " vm
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
