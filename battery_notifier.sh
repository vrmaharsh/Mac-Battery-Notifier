#!/bin/bash

BOT_TOKEN="7919802715:AAFI0Evw46WQCii4q4lK_xFCP6KkLNL79Ts"
CHAT_ID="942279686"

battery=$(pmset -g batt | grep -o "[0-9]\+%")
battery_level=$(echo $battery | tr -d '%')  # Remove % sign to get numeric value
charge_status=$(pmset -g batt | grep "AC Power")

# Only send a message if charging
if [[ -n "$charge_status" ]]; then
    message="🔋 Mac Battery: $battery (Charging)"
    
# Send special alert only when battery is exactly 99%
if [[ "$battery_level" -eq 99 ]]; then
    message="⚡ Battery Almost Full! (99%) 🔥⚡"
fi

# Send Telegram Notification
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d "chat_id=$CHAT_ID&text=$message"

