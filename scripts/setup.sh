# Update
pacman -Syyu

# Installs
pacman -S base-devel blueman bluez bluez-utils btop clipcat dunst discord evince feh firefox freerdp fzf gimp git i3-wm imagemagick imv intel-ucode iwd keepassxc kitty less libreoffice libvirt lshw maim mdp mpv ncdu neovim obsidian openssh pavucontrol picom pulseaudio polybar python remmina rofi rsync rustup sddm signal-desktop spotify-launcher stow thefuck thunderbird tmux ttf-jetbrains-mono-nerd virt-manager vlc xclip zoxide zsh fontconfig

paru -S xidlehook snapd tmux-bash-completion-git autotrash i3lock-color light mons onedrive-abraunegg pkgtop spicetify-cli whatsdesk-bin xrdp

# Install Paru
git clone https://aur.archlinux.org/paru.git
cd paru 
makepg -si

# Use zsh
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install autotrash
autotrash -d 30 --install

# Oh-My-Posh install
curl -s https://ohmyposh.dev/install.sh | bash -s

# Fun
pacman -S asciiquarium cmatrix cowsay espeak figlet neofetch nyancat sl
