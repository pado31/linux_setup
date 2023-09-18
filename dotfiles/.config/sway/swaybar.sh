#!/bin/sh
### Swaybar status
# The Sway configuration file in ~/.config/sway/config calls this script.

# Date
date_formatted=$(date -u +'%d/%m %H:%M')

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=BAT: $(cat /sys/class/power_supply/BAT0/capacity)%
#battery_power=$(cat /sys/class/power_supply/BAT0/power_now)W

# Emojis and characters for the status bar
echo $battery_status $date_formatted
