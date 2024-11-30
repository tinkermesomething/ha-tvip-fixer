#!/usr/bin/with-contenv bashio
CONFIG_FILE="/homeassistant/.storage/core.config_entries"

if [ ! -f /app/.env ]; then
    echo "Error: .env file not found"
    exit 1
fi

# Load environment variables
source /app/.env

if [ -z "$TV_FIXED_IP" ] || [ -z "$TV_ENTRY_ID" ]; then
    echo "Error: Required environment variables not set"
    exit 1
fi

while true; do
    inotifywait -e modify "$CONFIG_FILE"
    jq --arg ip "$TV_FIXED_IP" --arg id "$TV_ENTRY_ID" \
    '(.data.entries[] | select(.domain=="androidtv_remote" and .entry_id==$id).data.host) = $ip' \
    "$CONFIG_FILE" > "$CONFIG_FILE.tmp"
    mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
done