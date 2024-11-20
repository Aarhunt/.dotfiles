#!/bin/sh

systemctl --user start fluidsynth

aconnect 28 128

autorandr -l 3screen

MONITOR=DVI-D-1-0 polybar secondary &
