#!/bin/bash

# Check if the rofi window is already open
if xdotool search --name "translate" > /dev/null; then
    # Close the window if it's open
    xdotool search --name "translate" windowkill
else
    # Prompt the user to input text for translation without an empty scroll part
    input_text=$(rofi -dmenu -p "Translate" -lines 0 -theme-str 'listview {lines: 0;}')

    # If the input is not empty, perform the translation
    if [ -n "$input_text" ]; then
        # Perform the translation and store the result
        trans_result=$(trans -brief $1 "$input_text")
        
        # Copy the result to the clipboard
        echo -n "$trans_result" | xclip -selection clipboard
        
        # Show a notification with the translation result
        notify-send "Translation: " "$trans_result"
    fi
fi
