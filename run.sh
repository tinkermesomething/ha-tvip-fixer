#!/usr/bin/with-contenv bashio
CONFIG_FILE="/config/.storage/core.config_entries"
FIXED_IP="10.0.28.120" #change this to your TV's static IP

while true; do
    inotifywait -e modify "$CONFIG_FILE"
    sed -i 's/"host":"[^"]*"/"host":"'$FIXED_IP'"/' "$CONFIG_FILE"
done