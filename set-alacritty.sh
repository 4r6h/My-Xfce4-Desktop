#!/usr/bin/env bash
mkdir $HOME/.config/alacritty/
paru -S --noconfirm alacritty;wget https://raw.githubusercontent.com/4r6h/AlacrittyConfig/main/alacritty.yml;wget https://raw.githubusercontent.com/dracula/alacritty/master/dracula.yml;mv -u alacritty.yml $HOME/.config/alacritty/alacritty.yml && mv -u dracula.yml $HOME/.config/alacritty/dracula.yml
