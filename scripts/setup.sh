# Installs
pacman -S base-devel blueman bluez bluez-utils btop clipcat dunst discord evince feh firefox freerdp fzf gimp git i3-wm imagemagick imv intel-ucode iwd keepassxc kitty less libreoffice libvirt lshw maim mdp mpv ncdu neovim obsidian openssh pavucontrol picom pulseaudio polybar python remmina rofi rsync rustup sddm signal-desktop spotify-launcher stow thefuck thunderbird tmux ttf-jetbrains-mono-nerd virt-manager vlc xclip zoxide zsh
 
oh_my_posh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
autotrash -d 30 --install
git clone https://aur.archlinux.org/paru.git
cd paru 
makepg -si

curl -s https://ohmyposh.dev/install.sh | bash -s

paru -S xidlehook snapd tmux-bash-completion-git autotrash i3lock-color light mons onedrive-abraunegg pkgtop spicetify-cli whatsdesk-bin xrdp
# Fun
pacman -S asciiquarium cmatrix cowsay espeak figlet neofetch nyancat sl
