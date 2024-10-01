#!/usr/bin/zsh

res=$(echo \
"Save
Save (Active)
Save (Selection)
Clip
Clip (Active)
Clip (Selection)" \
| rofi -dmenu -p "screenshot")

case $res in
"Save")
    maim "/home/$USER/Pictures/Screenshots/$(date)";;
"Save (Active)")
    maim --window $(xdotool getactivewindow) "/home/$USER/Pictures/Screenshots/$(date)";;
"Save (Selection)")
    maim --select "/home/$USER/Pictures/Screenshots/$(date)";;
"Clip")
    maim | xclip -selection clipboard -t image/png;;
"Clip (Active)")
    maim --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png;;
"Clip (Selection)")
    maim --select | xclip -selection clipboard -t image/png;;
esac 
