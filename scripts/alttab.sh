#!/usr/bin/env bash

theme="$HOME/.config/rofi/config$1.rasi"

rofi \
    -show window \
    -config ${theme} \
    -show-icons \
    -terminal kitty \
    -combi-hide-mode-prefix \
    -kb-row-down 'Super+Tab' \
    -kb-row-up 'Super+ISO_Left_Tab' \
    -kb-accept-entry '!Super-Tab,!Super-Alt_L,!Alt_L' \

