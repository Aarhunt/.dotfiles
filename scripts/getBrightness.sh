#!/bin/bash

# Path to the brightness file (adjust based on your system)
BRIGHTNESS_PATH="/sys/class/backlight/intel_backlight/brightness"
MAX_BRIGHTNESS_PATH="/sys/class/backlight/intel_backlight/max_brightness"

echo "$(brightnessctl -m)"

# Infinite loop to watch for changes
while true; do
  # Wait for a change to the brightness file (any modification)
  inotifywait -qq -e modify $BRIGHTNESS_PATH

  # Output the updated brightness percentage to EWW
  echo "$(brightnessctl -m)"
done

