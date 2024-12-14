#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <single_element> <monitor1> [monitor2] [monitor3] ..."
    exit 1
fi

# The first argument is the single element
single_element=$1

echo $single_element
MONITOR=$single_element polybar primary &

# Shift to get the list of monitors as remaining arguments
shift
if [ $# -eq 1 ]; then
    # Single argument, possibly a space-separated string
    monitor_list=($1) # Split the string into an array
else
    # Multiple arguments, already split
    monitor_list=("$@")
fi

if [ ${#monitor_list[@]} -gt 0 ]; then
  # Loop through each monitor in the monitor list
  for monitor in "${monitor_list[@]}"; do
    echo "Setting up monitor: $monitor"
    MONITOR=$monitor polybar secondary &
  done
fi
