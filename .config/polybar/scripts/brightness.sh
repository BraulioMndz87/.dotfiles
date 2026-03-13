#!/bin/bash

# Get brightness as percentage
BRIGHTNESS=$(brightnessctl get)
MAX=$(brightnessctl max)
PERCENT=$((BRIGHTNESS * 100 / MAX))

ICON_COLOR="#7daea3"     
PERCENT_COLOR="#d8dee9" 

# Output percentage
echo "%{F$ICON_COLOR}%{F-} %{F$PERCENT_COLOR}$PERCENT%%{F-}"

# Detect mouse scroll
if [[ $1 == "--up" ]]; then
    brightnessctl set +5% > /dev/null
    dunstify -h int:value:$((PERCENT + 5)) -u low "Brightness" -h string:bgcolor:#32302f -h string:fgcolor:#7daea3
elif [[ $1 == "--down" ]]; then
    brightnessctl set 5%- > /dev/null
    dunstify -h int:value:$((PERCENT - 5)) -u low "Brightness" -h string:bgcolor:#32302f -h string:fgcolor:#7daea3
fi

