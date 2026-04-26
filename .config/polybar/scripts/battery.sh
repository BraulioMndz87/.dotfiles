#!/usr/bin/env bash

COLOR="#7daea3"

# Get battery percentage and status
info=$(acpi -b)
percent=$(echo "$info" | grep -oP '[0-9]+(?=%)')
status=$(echo "$info" | cut -d: -f2 | awk '{print $1}')

# Choose icon based on percentage / status
if [ "$status" = "charging" ]; then
    icon="󰂄"
elif [ "$percent" -ge 100 ]; then
    icon="󰁹"
elif [ "$percent" -ge 80 ]; then
    icon="󰂁"
elif [ "$percent" -ge 60 ]; then
    icon="󰁿"
elif [ "$percent" -ge 40 ]; then
    icon="󰁽"
elif [ "$percent" -ge 20 ]; then
    icon="󰁻"
else
    icon="󰂎"
fi

# Output icon + percentage
echo "%{F$COLOR}$icon %{F$WHITE}$percent%%{F-}"
