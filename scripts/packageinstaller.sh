#!/bin/zsh

# Open a rofi input box to get the package name from the user
package=$(rofi -dmenu -p "Enter package name")

# Check if the user provided input
if [[ -z "$package" ]]; then
    echo "No package entered. Exiting..."
    exit 1
fi

# Check if the package is available in the official repositories
if pacman -Si "$package" > /dev/null 2>&1; then
    echo "$package found in official repositories."
    # Install the package using sudo pacman
    sudo pacman -S "$package"
elif paru -Si "$package" > /dev/null 2>&1; then
    echo "$package found in AUR."
    # Install the package using paru
    paru -S "$package"
else
    echo "Package not found in official repositories or AUR."
    exit 1
fi
