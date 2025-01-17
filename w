@echo off
:: Get the device serial number
for /f "tokens=2 delims==" %%I in ('wmic bios get serialnumber /value') do set SN=%%I

:: Check if SN is empty
if "%SN%"=="" set SN=Serial number not found

:: Set the Telegram Bot API Token and chat_id
set TELEGRAM_BOT_API_TOKEN=TOKEN
set TELEGRAM_CHAT_ID=CHAT_ID

:: URL encode the message to avoid issues with special characters
set MESSAGE=Serial number: %SN%

:: URL encode the message (replace spaces with %20)
set MESSAGE=%MESSAGE: =%%20%

:: Construct the Telegram send message URL
set TELEGRAM_URL=https://api.telegram.org/bot%TELEGRAM_BOT_API_TOKEN%/sendMessage?chat_id=%TELEGRAM_CHAT_ID%^&text=%MESSAGE%

:: Use curl to send the message to Telegram
curl -s "%TELEGRAM_URL%"

:: Output the result
echo The device serial number has been sent to Telegram.
pause
