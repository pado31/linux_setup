#!/bin/sh
### Swaybar status
# The Sway configuration file in ~/.config/sway/config calls this script.

# The abbreviated weekday (e.g., "Fri"), followed by the ISO-formatted date
date_formatted=$(date +'%a %F %H:%M')

# TODO: Improve
# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Emojis and characters for the status bar
echo $uptime_formatted $battery_status $date_formatted
