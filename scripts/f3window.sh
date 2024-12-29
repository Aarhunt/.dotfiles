#!/bin/bash

active=$(eww active-windows)

function exists_in_list() {
    LIST=$1
    DELIMITER=$2
    VALUE=$3
    LIST_WHITESPACES=`echo $LIST | tr "$DELIMITER" " "`
    for x in $LIST_WHITESPACES; do
        if [ "$x" = "$VALUE" ]; then
            return 0
        fi
    done
    return 1
}

if exists_in_list "$active" "\n" "f3left"; then
  eww close f3left
  eww close f3right
else
  eww open-many f3left f3right
fi


