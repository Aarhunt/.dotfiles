#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

screens=$(xrandr --query | grep " connected" | cut -d" " -f1)
amt=$(echo $screens | wc -l)

PRIMARY=$(xrandr -q | grep 'primary' | cut -d" " -f1)
SECONDARY=$(xrandr -q | grep ' connected' | grep -v 'primary' |cut -d" " -f1)

case $amt in 
  1)
    PRIMARY=$screens
    xrandr --output $PRIMARY --primary
    ;;
  2)
    xrandr --output $PRIMARY --primary --output $SECONDARY
    mons -e right
    MONITOR=$SECONDARY polybar secondary &
    ;;
  *)
    echo "oei dat snap ik niet"
esac 

MONITOR=$PRIMARY polybar primary &
