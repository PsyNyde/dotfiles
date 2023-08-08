#!/bin/bash

lock=" Lock"
logout="󰗼 Logout"
shutdown="󰐥 Poweroff"
reboot="󰦛 Reboot"
sleep=" Suspend"

selected_option=$(echo "$shutdown
$reboot
$lock
$sleep
$logout" | rofi -x11 -dmenu -i -p "Goodbye ${USER}" \
		  -theme "~/.config/hypr/rofi/powermenu.rasi")

if [ "$selected_option" == "$lock" ]
then
    swaylock --config ~/.config/hypr/swaylock/config
elif [ "$selected_option" == "$logout" ]
then
    hyprctl dispatch exit
elif [ "$selected_option" == "$shutdown" ]
then
  systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
  systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
  systemctl suspend
else
  echo "No match"
fi
