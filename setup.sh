#!/bin/bash
# Author: Alberto Padoan https://albertopadoan.netlify.app
# Source: https://riccardo.im/voidlinux/voidsetup.sh
# Void Linux post-install script

bypass() {
  sudo -v
  while true;
  do
    sudo -n true
    sleep 45
    kill -0 "$$" || exit
  done 2>/dev/null &
}

echo "Starting Void Linux post-install script..."
sleep 3s
	bypass

clear
echo "Updating system..."
sleep 3s
	sudo xbps-install -Syu

clear

echo "Installing packages..."
sleep 3s
    # xorg-fonts Try without it
	sudo xbps-install -Sy swaylock swayidle dbus-elogind polkit elogind mesa-dri gvfs fonts-roboto-ttf font-awesome sway git lazygit github-cli qrcp neofetch nano wget firefox alsa-utils brightnessctl tlp tlp-rdw grim htop
	
clear

echo "Create directory..."
sleep 3s
    cd ~ && mkdir -p Code Pics/Screenshots Notes Download .config
    sudo cp -a linux_setup/img/wallpaper/xmas_tree_wp.jpeg ~/Pics/xmas_tree_wp.jpeg
clear

echo "Configuring system..."
sleep 10s
    sudo ln -s /etc/sv/dbus /var/service/
    sudo ln -s /etc/sv/polkitd /var/service/
    sudo ln -s /etc/sv/alsa /var/service/
    sudo ln -s /etc/sv/tlp /var/service/
    
    sudo sv down acpid
    sudo rm /var/service/acpid

	sudo mkdir /etc/sysctl.d/
	echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-swappiness.conf

    echo "# If running from tty1 start sway
        if [ \"\$(tty)\" = \"/dev/tty1\" ]; then
            exec sway
        fi" >> .bashrc

    sudo cp -a linux_setup/dotfiles/.config/. ~/.config/

    cp dotfiles/xkb/symbols/ch_qwerty /usr/share/X11/xkb/symbols/
clear

read -p "Done! Press ENTER to reboot."
	sudo shutdown -r now
