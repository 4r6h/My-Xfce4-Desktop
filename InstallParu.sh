#!/usr/bin/env bash
sudo pacman -S --noconfirm --needed git base base-devel;git clone https://aur.archlinux.org/paru.git;cd paru;makepkg -si --noconfirm
echo"-------------------------------------------------------------------"
echo"-------------------------------------------------------------------"
echo"--------------------------Paru Installed---------------------------"
echo"-------------------------------------------------------------------"
echo"-------------------------------------------------------------------"
rm -rf paru
