#!/bin/sh
# first run xrandr -q 

# you should see output like, <DVI-0 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 473mm x 296mm> or if you are in virtual machine as I am. You should see Virtual1 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 473mm x 296mm

# then, copy this command below, and paste under it. Without # symbol.

# change the part <your-display-name> to output from xrandr -q command.

# xrandr --output <your-display-name> --primary --mode 1920x1080

# as I am in virtual machine then I will use Virtulal1 in the command. 

# like this.

xrandr --output Virtual1 --primary --mode 1920x1080

# then save this file and rename to lightdm-fix.sh
# then run command <chmod a+rx lightdm-fix.sh>
# then run this command <sudo mv lightdm-fix.sh /usr/share>
# then run command <sudo nano /etc/lightdm/lightdm.conf
# you should <#display-setup-script=> copy this line and delete #. 
# write after =/usr/share/fix-lightdm.sh
# reboot and enjoy.
