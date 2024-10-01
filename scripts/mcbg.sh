#!/bin/sh

export DISPLAY=:0.0

time=$(date +%H)

feh --bg-scale $HOME/.dotfiles/wallpapers/mc/$time.png

