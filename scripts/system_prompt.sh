#!/usr/bin/zsh

theme="$XDG_CONFIG_HOME/rofi/config$1.rasi"

res=$(echo \
"Poweroff
Reboot
Lock
Suspend
Exit" \
  | rofi -dmenu -p "system" )

login_manager="systemctl"

case $res in
"Lock")
    sleep 0.5;
    ~/.dotfiles/scripts/i3lock;;
"Exit")
    i3-msg exit;;
"Poweroff")
    $login_manager poweroff;;
"Reboot")
    $login_manager reboot;;
"Suspend")
    $login_manager suspend;;
esac 
