#!/bin/sh

echo "=-=-= Telegram Media Downloader =-=-="

if [ "$DUMMY" == "1" ]; then
    echo "Entering dummy mode... zZzZzZzZ"
    tail -f /dev/null
fi

if [ "$ENV_MODE" == "dev" ]; then
    echo "Starting in DEVELOPMENT mode!"
else
    echo "Starting in PRODUCTION mode!"
fi

python3 media_downloader.py
