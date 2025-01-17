#!/bin/bash

# Get the macOS device serial number
SN=$(system_profiler SPHardwareDataType | grep "Serial Number" | awk -F: '{print $2}' | sed 's/^ *//g')

# Check if SN is found
if [ -z "$SN" ]; then
    SN="Serial number not found"
fi

# Set Telegram Bot API Token and chat_id
TELEGRAM_BOT_API_TOKEN="7661657034:AAE-8jaW460052tsoXSIi88NcKX-Duo5F-Q"
TELEGRAM_CHAT_ID="-4610377580"

# Construct the Telegram message URL
MESSAGE="Serialnumber:$SN"
TELEGRAM_URL="https://api.telegram.org/bot$TELEGRAM_BOT_API_TOKEN/sendMessage?chat_id=$TELEGRAM_CHAT_ID&text=$MESSAGE"

# Use curl to send the message to Telegram
curl -s "$TELEGRAM_URL"

# Output the result
echo "$TELEGRAM_URL"
