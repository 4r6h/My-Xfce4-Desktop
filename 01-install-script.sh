#!/usr/bin/env bash

# ***************************************
# * Author: 4r6h/Rahat		        *
# * github: https://www.github.com/4r6h *
# ***************************************

shopt -s extglob

welmsg() {

	echo "
		 +-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
		 |W|e|l|c|o|m|e| |m|y| |M|y|-|X|f|c|e|4|-|D|e|s|k|t|o|p|
		 +-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
			 A minimal Xfce4 Desktop Install Script.
				Please Wait Don't Panic.
			    This Might Take a While to Load.

	    "
}

waitmsg() {
	echo "			Please Wait Don't Panic.
			    This Might Take a While to Load.
	"
}

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

dir="$PWD/Xfce4_Scripts/"

get_scripts() {
	
	if [ ! -f packages.txt ]; then
		
		wget -c -q https://raw.githubusercontent.com/4r6h/My-Xfce4-Desktop/main/packages.txt
	fi


	if [ ! -d $dir ]; then
		
		mkdir $dir
	else
		rm -rf $dir*
	fi

		for link_scripts in "${link_scripts[@]}";	do
		
			wget -c -q -P $dir "$link_scripts"
			
			chmod +x $dir*
								done
}

update_mirrors() {

	pacman --noconfirm --needed -S wget vim reflector
	./$dir/set-locale.sh
	./$dir/updatemirrors.sh
}

vmmachine() {

	pacman --noconfirm --needed -S virtualbox-guest-utils
	systemctl enable vboxservice.service
}

noparu() {

	su ${username}
	./$dir/InstallParu.sh
	paru -Syu - <packages.txt --noconfirm --needed 
}

yesparu() {

	su ${username}
	paru -Syu - <packages.txt --noconfirm --needed
}

common() {

	./$dir/InstallFonts.sh
	./$dir/set-bash.sh
	./$dir/set-sddm.sh
	./$dir/set-rofi.sh
	./$dir/set-alacritty.sh
}

vminstall() {
	
	waitmsg
	
	get_scripts
	
	update_mirrors

	vmmachine

	if [ -x /usr/bin/paru* ]; then
		yesparu
	else 
		noparu
	fi
		common
}

normalinstall() {
	
	waitmsg
	
	get_scripts
	
	update_mirrors

	if [ -x /usr/bin/paru* ]; then
		yesparu
	else 
		noparu
	fi
		common
}


if [ $( whoami ) = "root" ]; then

	welmsg

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
