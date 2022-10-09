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
			 A Minimal Xfce4 Desktop Install Script.
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

dir="$PWD/Xfce4_Scripts"

get_scripts() {
	
	if [ ! -f packages.txt ]; then
		
		wget -c -q https://raw.githubusercontent.com/4r6h/My-Xfce4-Desktop/main/packages.txt
	fi


	if [ ! -d $dir ]; then
		
		mkdir $dir
	else
		rm -rf $dir/*
	fi

		for link_scripts in "${link_scripts[@]}";	do
		
			wget -c -q -P $dir "$link_scripts"
			
			chmod +x $dir/*
								done
}

update_mirrors() {

	sudo pacman --noconfirm --needed -S wget vim reflector
	bash $dir/set-locale.sh
	sudo bash $dir/updatemirrors.sh
}

vmmachine() {

	sudo pacman --noconfirm --needed -S virtualbox-guest-utils
	sudo systemctl enable vboxservice.service
}

noparu() {

	bash $dir/InstallParu.sh
	paru -Syu - <packages.txt --noconfirm --needed 
}

yesparu() {

	paru -Syu - <packages.txt --noconfirm --needed
}

common() {

	bash $dir/InstallFonts.sh
	bash $dir/set-bash.sh
	bash $dir/set-sddm.sh
	bash $dir/set-rofi.sh
	bash $dir/set-alacritty.sh
}

vminstall() {
	
	waitmsg
	
	get_scripts
	
	update_mirrors

	vmmachine

	if [[ -z $(which paru) ]]; then

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

	if [[ -z $(which paru) ]]; then

		yesparu
	else 
		noparu
	fi
		common
}

main() {

if [[ $(whoami) -ne "root" ]]; then

	welmsg

while true 

do

home_dir=$(echo $HOME)


	if [[ -d $home_dir ]]; then

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
	else
		echo "Home directory not found!"
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
	-----------Cannot Run as Root-----------
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
						"
fi

}

main
