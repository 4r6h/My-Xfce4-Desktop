paru -S --noconfirm sddm sddm-theme-sugar-candy-git
wait
sudo systemctl enable sddm
wait
wget https://raw.githubusercontent.com/4r6h/mysddm/main/sddm.conf
wait
wget https://raw.githubusercontent.com/4r6h/mysddm/main/theme.conf
wait
sudo mv -u sddm.conf /etc/sddm.conf && sudo mv -u theme.conf /usr/share/sddm/themes/Sugar-Candy/theme.conf
