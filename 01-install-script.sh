#!/usr/bin/env bash

# ***************************************
# * Author: 4r6h/Rahat		        *
# * github: https://www.github.com/4r6h *
# ***************************************

shopt -s extglob

link_scripts=(
'https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-locale.sh'
'https://raw.githubusercontent.com/4r6h/ArchyMirrorsBD/main/updatemirrors.sh'
'https://raw.githubusercontent.com/4r6h/Dot4iles/main/InstallParu.sh'
'https://raw.githubusercontent.com/4r6h/Dot4iles/main/InstallFonts.sh'
'https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-bash.sh'
'https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-sddm.sh'
'https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-rofi.sh'
'https://raw.githubusercontent.com/4r6h/Dot4iles/main/set-alacritty.sh'
)

get_scripts() {

	if [ ! -f packages.txt ]; then

                wget -c -q https://raw.githubusercontent.com/4r6h/My-Xfce4-Desktop/main/packages.txt
        fi

	
	if [ -d My_Xfce4_Desktop_Scripts ]; then

		rm -rf My_Xfce4_Desktop_Scripts
	fi

	
	if [ ! -d My_Xfce4_Desktop_Scripts ]; then

                mkdir My_Xfce4_Desktop_Scripts
		cd My_Xfce4_Desktop_Scripts
        fi

		for link_scripts in "${link_scripts[@]}"; do
		wget -c -q "$link_scripts"
		chmod +x *
							done
		mv ../packages.txt ./
}

update_mirrors() {

	pacman --noconfirm --needed -S wget vim reflector
	./set-locale.sh
	./updatemirrors.sh
}

vmmachine() {

	pacman --noconfirm --needed -S virtualbox-guest-utils
	systemctl enable vboxservice.service
}

noparu() {

	su ${username}
	./InstallParu.sh
	paru -Syu - <packages.txt --noconfirm --needed 
}

yesparu() {

	su ${username}
	paru -Syu - <packages.txt --noconfirm --needed
}

common() {

	./InstallFonts.sh
	./set-bash.sh
	./set-sddm.sh
	./set-rofi.sh
	./set-alacritty.sh
}

vminstall() {

	update_mirrors

	vmmachine

	if [ -x /usr/bin/paru* ]; then
		yesparu
	else 
		noparu
	fi
		get_scripts
		common
}

normalinstall() {

	update_mirrors

	if [ -x /usr/bin/paru* ]; then
		yesparu
	else 
		noparu
	fi
		get_scripts
		common
}


if [ $( whoami ) = "root" ]; then


	echo "
		 +-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
		 |W|e|l|c|o|m|e| |m|y| |M|y|-|X|f|c|e|4|-|D|e|s|k|t|o|p|
		 +-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
				Please Wait Don't Panic.
			    This Might Take a While to Load.
			 A minimal Xfce4 Desktop Install Script.
		
	"

while true 

do

read -p " Please! Enter your normal username: " username

if id "$username" >/dev/null 2>&1; then

hd=$( getent passwd "$username" | cut -d: -f6 )

hdp=$(echo ${hd})


	if [ ! -d $hdp ]; then

		echo -e "\n User does not exist. First create a normal user with home dirrectory

					and give the user sudo or wheel privilages 
	
				check the guid in https://github.com/4r6h/My-Xfce4-Desktop \n"

	else
		echo -e "\n Are You Installing in Virtual Machine? \n"
		
		read -r -p " then press enter [(Y/n) (defult=Y)] " vm

		case $vm in

	    		[yY][eE][sS]|[yY]|$ENTER)

				vminstall
			
			break ;;

			
			[nN][oO]|[nN])

				normalinstall
			
			break ;;

			
			*)
				echo "Invalid input..." ;;
		esac
	fi

else

echo "	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	-----------user does not exist----------
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	-----------Please Run as Root-----------
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
						"
fi
