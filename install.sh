#!/bin/bash

# Set keyboard maps 
localectl set-x11-keymap us "" colemak_dh 

# Update
sudo pacman -Syyu

# Install paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd .. && rm -rf paru # Cleanup

sudo cp ./scripts/i3lock.sh /bin/i3lockcolor

# Install packages
sudo pacman -S --needed --noconfirm - < ./.vars/pacman.txt 
paru -S - < ./.vars/aur.txt

# Install non-package software
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# SDDM theme
if [ ! -d "/usr/share/sddm/themes/"]; then
  sudo mkdir /usr/share/sddm/themes/
fi
sudo git clone https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/custom
sudo cp /usr/share/sddm/themes/custom/Fonts/* /usr/share/fonts/
sudo cp -r ./.vars/sddm.conf.d/ /etc/

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh-My-Posh
curl -s https://ohmyposh.dev/install.sh | zsh -s

# Grub theme
git clone https://github.com/Lxtharia/minegrub-theme.git
cd ./minegrub-theme
sudo cp -ruv ./minegrub /boot/grub/themes/
cd .. && rm -rf minegrub-theme
if grep -q "GRUB_THEME" /etc/default/grub; then
 sudo sed -i "s:.*GRUB_THEME.*:GRUB_THEME=/boot/grub/themes/minegrub/theme.txt:" /etc/default/grub
else
  sudo echo "GRUB_THEME=/boot/grub/theme/minegrub/theme.txt:" >> /etc/default/grub
fi
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Install zsh-autosugestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# GTK theme?
