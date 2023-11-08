#!/bin/bash
LOG_PATH="$1"
PATTERN="\[([0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}:[0-9]{3}) INFO\] Player Spawned: (.*) xuid:"

tail -n 0 -f "$LOG_PATH" | \
    while IFS= read -r line; do
        if [[ "$line" =~ $PATTERN ]]; then
            player_name="${BASH_REMATCH[2]}"
            echo "Detected player spawn: $player_name"
            BDS "say $GREETING $player_name"
        fi
    done
