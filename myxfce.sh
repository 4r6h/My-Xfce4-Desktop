#!/usr/bin/env bash
mkdir $HOME/.config/xfce4/
git clone https://github.com/4r6h/myxfce.git
wait
mv -u myxfce/* $HOME/.config/xfce4/
