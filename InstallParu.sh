#!/usr/bin/env bash
sudo pacman -S --noconfirm --needed base base-devel;git clone https://aur.archlinux.org/paru.git;cd paru;makepkg -si
echo "Paru Installed"
rm -rf paru
