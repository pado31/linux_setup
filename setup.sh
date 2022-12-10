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
	sudo xbps-install -Sy swaylock swayidle dbus-elogind polkit elogind mesa-dri gvfs fonts-roboto-ttf sway git lazygit github-cli qrcp neofetch nano wget firefox alsa-utils brightnessctl
	
clear

echo "Create directory..."
sleep 3s
    cd ~ && mkdir Code Pics Notes Download .config
clear

echo "Configuring system..."
sleep 10s
    sudo ln -s /etc/sv/dbus /var/service/
    sudo ln -s /etc/sv/polkitd /var/service/
    sudo ln -s /etc/sv/alsa /var/service/
    
    sudo sv down acpid
    sudo rm /var/service/acpid

	sudo mkdir /etc/sysctl.d/
	echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-swappiness.conf

    echo "# If running from tty1 start sway
        if [ \"\$(tty)\" = \"/dev/tty1\" ]; then
            exec sway
        fi" >> .bashrc

    sudo cp -a linux_setup/dotfiles/.config/. ~/.config/
    sudo chmod +x ~/.config/sway/swaybar.sh
    cp dotfiles/xkb/symbols/ch_qwerty /usr/share/X11/xkb/symbols/
clear

read -p "Done! Press ENTER to reboot."
	sudo shutdown -r now
