#!/bin/bash

SELECTION="$(printf "󰌾 Lock
󰤄 Suspend
󰍃 Log out
 Reboot
 Reboot to UEFI
󰐥 Shutdown" | fuzzel --dmenu -a top-right -l 6 -w 22 -p "Select an option: ")"

confirm_action() {
    local action="$1"
    OPTIONS="No
Yes"
    CONFIRMATION="$(printf '%s' "$OPTIONS" | fuzzel --dmenu -a top-right -l 2 -w 20 -p "$action?")"
    [[ "$CONFIRMATION" == *"Yes"* ]]
}

case $SELECTION in
*"Lock"*)
    swaylock
    ;;
*"Suspend"*)
    if confirm_action "Suspend"; then
        systemctl suspend
    fi
    ;;
*"Log out"*)
    if confirm_action "Log out"; then
        swaymsg exit
    fi
    ;;
*"Reboot to UEFI"*)
    if confirm_action "Reboot to UEFI"; then
        systemctl reboot --firmware-setup
    fi
    ;;
*"Reboot"*)
    if confirm_action "Reboot"; then
        systemctl reboot
    fi
    ;;

*"Shutdown"*)
    if confirm_action "Shutdown"; then
        systemctl poweroff
    fi
    ;;
esac
