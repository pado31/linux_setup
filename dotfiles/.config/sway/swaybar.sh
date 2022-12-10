#!/bin/sh
### Swaybar status
# The Sway configuration file in ~/.config/sway/config calls this script.

# The abbreviated weekday (e.g., "Fri"), followed by the ISO-formatted date
date_formatted=$(date -u +'%a %F %H:%M')

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(cat /sys/class/power_supply/BAT0/capacity)%
#battery_power=$(cat /sys/class/power_supply/BAT0/power_now)W

# Emojis and characters for the status bar
echo $date_formatted $battery_status 
