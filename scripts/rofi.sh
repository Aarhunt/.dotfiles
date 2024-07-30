#!/usr/bin/env bash

theme="$XDG_CONFIG_HOME/rofi/config$1.rasi"
# Theme 9
## Run
rofi \
    -show combi \
    -config ${theme} \
    -terminal kitty \
    -combi-hide-mode-prefix \ 
