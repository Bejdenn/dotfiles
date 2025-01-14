#!/bin/sh
python ~/.config/waybar/scripts/keyhint.py | yad --title="EndeavourOS Sway-WM keybindings:" --homogenous --no-buttons --geometry=500x345-15-400 --list --column=Key --column=Description --column=Command
