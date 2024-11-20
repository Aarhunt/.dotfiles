#!/bin/sh

case "$1" in
    --toggle)
        dunstctl set-paused toggle
        ;;
    *)
        if [ "$(dunstctl is-paused)" = "true" ]; then
            echo "\ueaa2"
        else
            echo "\uec08"
        fi
        ;;
esac
