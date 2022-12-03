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
	sudo xbps-install -Sy dbus-elogind polkit elogind mesa-dri gvfs sway git qrcp screenFetch nano wget 
	
clear

echo "Create directory..."
sleep 3s
    cd ~ && mkdir code pics notes download
    cd ~ && mkdir -p .config/sway
clear

echo "Configuring system..."
sleep 10s
    sudo ln -s /etc/sv/dbus /var/service/
    sudo ln -s /etc/sv/polkitd /var/service/
    sudo sv down acpid
    sudo rm /var/service/acpid
	sudo mkdir /etc/sysctl.d/
	echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-swappiness.conf

    echo "# If running from tty1 start sway
        if [ \"\$(tty)\" = \"/dev/tty1\" ]; then
            exec sway
        fi" >> .bashrc

clear

read -p "Done! Press ENTER to reboot."
	sudo shutdown -r now