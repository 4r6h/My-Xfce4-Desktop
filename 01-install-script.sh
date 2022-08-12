#!/usr/bin/env bash

if [ $( whoami ) = "root" ]; then

while true
do

read -p " Please! Enter your normal username: " username

if id "$username" >/dev/null 2>&1; then

hd=$( getent passwd "$username" | cut -d: -f6 )

hdp=$(echo ${hd})

update_mirrors="
pacman --noconfirm --needed -S wget vim reflector
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-locale.sh;chmod +x set-locale.sh;./set-locale.sh
wget -c https://raw.githubusercontent.com/4r6h/ArchyMirrorsBD/main/updatemirrors.sh;chmod +x updatemirrors.sh;./updatemirrors.sh
"
vmmachine="
pacman --noconfirm --needed -S virtualbox-guest-utils
systemctl enable vboxservice.service
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
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-bash.sh;chmod +x set-bash.sh;./set-bash.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-sddm.sh;chmod +x set-sddm.sh;./set-sddm.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-rofi.sh;chmod +x set-rofi.sh;./set-rofi.sh
wget -c https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-alacritty.sh;chmod +x set-alacritty.sh;./set-alacritty.sh
"

vminstall="
 $update_mirrors
 $vmmachine
if [ -x /usr/bin/paru* ]; [ -x /usr/bin/paru* ]; then
	 $yesparu
else 
	 $noparu
fi
 $common
"

normalinstall="
 $update_mirrors
if [ -x /usr/bin/paru* ]; [ -x /usr/bin/paru* ]; then
	 $yesparu
else 
	 $noparu
fi
 $common
"

if [ ! -d $hdp ]; then

    echo "User does not exist. First create a normal user with home dirrectory and give the user sudo or wheel privilages"

else

	if [ ! -d $hdp/My_Xfce4_Desktop_Scripts ]; then

		cd $hdp; mkdir My_Xfce4_Desktop_Scripts; cd My_Xfce4_Desktop_Scripts
	fi

	read -r -p "Are You Installing in Virtual Machine? then press enter [(Y/n) (defult=Y)] " vm

	case $vm in
	    [yY][eE][sS]|[yY]|$ENTER)
                   $vminstall
		  break
		  ;;
            [nN][oO]|[nN])
                   $normalinstall
		  break
		  ;;
            *)
                  echo "Invalid input..."
                  ;;
	esac
	
fi

else

echo "	
	----------------------------------------
	-----------user does not exist----------
	----------------------------------------
						"
fi

done

echo "	
	----------------------------------------
	----------Installation Finished---------
	----------------------------------------
						"
else

echo "	
	----------------------------------------
	-----------Please Run as Root-----------
	----------------------------------------
						"
fi
