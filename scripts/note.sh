#!/bin/bash

# Check if xpad is already running
if pgrep -x "xpad" > /dev/null
then
    # If running, kill the process
    pkill xpad
else
    # If not running, start xpad with a single note
    xpad --new-note &
    sleep 0.5  # Wait for the window to open

    # Get the window title of the newly created xpad window
    WINDOW_TITLE=$(xdotool search --name "xpad")

    # If using i3
    i3-msg "[title=\"$WINDOW_TITLE\"] floating enable; move position center"
fi
