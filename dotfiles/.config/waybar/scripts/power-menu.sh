#!/bin/bash

entries="⇠ Logout\n💤  Suspend\n🔄 Reboot\n⛔️ Shutdown"

selected=$(echo -e $entries|wofi --width 250 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

set $term foot
exec $term

case $selected in
  logout)
    exec swaymsg exit;;
  suspend)
    exec loginctl suspend;;
  reboot)
    exec loginctl reboot;;
  shutdown)
    exec loginctl poweroff ;;
esac