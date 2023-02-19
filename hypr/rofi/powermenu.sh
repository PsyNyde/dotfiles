#!/bin/bash
 
lock=" Lock"
logout=" Logout"
shutdown="襤 Poweroff"
reboot=" Reboot"
sleep=" Suspend"
 
selected_option=$(echo "$shutdown
$reboot
$lock
$sleep
$logout" | rofi -dmenu -i -p "Powermenu" \
		  -theme "~/.config/hypr/rofi/powermenu.rasi")

if [ "$selected_option" == "$lock" ]
then
    swaylock --config ~/.config/hypr/swaylock/config
elif [ "$selected_option" == "$logout" ]
then
    hyprctl kill
elif [ "$selected_option" == "$shutdown" ]
then
  poweroff --poweroff
elif [ "$selected_option" == "$reboot" ]
then
  poweroff --reboot
elif [ "$selected_option" == "$sleep" ]
then
  loginctl suspend
else
  echo "No match"
fi
