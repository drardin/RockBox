# RockBox
A Simple Minecraft Bedrock Dedicated Server Docker Container

## Usage
Normal Usage:
```
docker run -itd -p 19132:19132/udp rockbox:latest
```

## Environment Variables
All value pairs in server.properties are mapped to container runtime variables.

### Example Usage
#### Setting A Single Property
If you want to set the server-name property at runtime:
```
docker run -itd -p 19132:19132/udp -e SERVER_NAME="Your Server Name" rockbox:latest
```

#### Setting Multiple Properties
An `-e` flag must be set for *each* environment variable

If you want to set the server-name and server-port properties at runtime:
```
docker run -itd -p 25255:25255/udp -e SERVER_NAME="Your Server Name" -e SERVER_PORT="25255" rockbox:latest
```

You can also use backslashes, like in this example:
```
docker run -itd -p 25255:25255/udp \
-e SERVER_NAME="Your Server Name" \
-e LEVEL_NAME="A World Name" \
rockbox:latest
```

### Property Variable Mapping Table
The docker container runtime variables are mapped nearly identically, other than being uppercase and `-` being replaced with `_`

| Docker Container Runtime Environment Variable | server.properties Property Name | server.properties Property Value | Acceptable Options |
|-----------------------------------------------|-------------------|-------------------|------------------------------------------------------|
| SERVER_NAME                                  | server-name       | Dedicated Server  | Any string without semicolon symbol.                  |
| GAMEMODE                                     | gamemode          | survival          | "survival", "creative", or "adventure"                |
| FORCE_GAMEMODE                               | force-gamemode    | false             | "true" or "false"                                    |
| DIFFICULTY                                   | difficulty        | easy              | "peaceful", "easy", "normal", or "hard"               |
| ALLOW_CHEATS                                 | allow-cheats      | false             | "true" or "false"                                    |
| MAX_PLAYERS                                  | max-players       | 10                | Any positive integer                                 |
| ONLINE_MODE                                  | online-mode       | true              | "true" or "false"                                    |
| ALLOW_LIST                                   | allow-list        | false             | "true" or "false"                                    |
| SERVER_PORT                                  | server-port       | 19132             | Integers in the range [1, 65535]                     |
| SERVER_PORTV6                                | server-portv6     | 19133             | Integers in the range [1, 65535]                     |
| ENABLE_LAN_VISIBILITY                        | enable-lan-visibility | true          | "true" or "false"                                    |
| VIEW_DISTANCE                                | view-distance     | 32                | Positive integer equal to 5 or greater                |
| PLAYER_IDLE_TIMEOUT                          | player-idle-timeout | 30               | Any non-negative integer                             |
| MAX_THREADS                                  | max-threads       | 8                 | Any positive integer                                 |
| LEVEL_NAME                                   | level-name        | Bedrock level     | Any string without semicolon symbol or illegal characters |
| LEVEL_TYPE                                   | level-type        |                   | Any string                                           |
| LEVEL_SEED                                   | level-seed        |                   | Any string                                           |
| DEFAULT_PLAYER_PERMISSION_LEVEL              | default-player-permission-level | member | "visitor", "member", "operator"                    |
| TEXTUREPACK_REQUIRED                         | texturepack-required | false          | "true" or "false"                                    |
| CONTENT_LOG_FILE_ENABLED                     | content-log-file-enabled | false        | "true" or "false"                                    |
| COMPRESSION_THRESHOLD                        | compression-threshold | 1               | 0-65535                                              |
| COMPRESSION_ALGORITHM                        | compression-algorithm | zlib           | "zlib", "snappy"                                     |
| SERVER_AUTHORITATIVE_MOVEMENT                | server-authoritative-movement | server-auth | "client-auth", "server-auth", "server-auth-with-rewind" |
| PLAYER_MOVEMENT_SCORE_THRESHOLD              | player-movement-score-threshold | 20      | Disabled by server-authoritative-movement            |
| PLAYER_MOVEMENT_ACTION_DIRECTION_THRESHHOLD   | player-movement-action-direction-threshold | 0.85 | Any value in the range of [0, 1] where 1 means exact match |
| PLAYER_MOVEMENT_DISTANCE_THRESHOLD           | player-movement-distance-threshold | 0.3   | Disabled by server-authoritative-movement            |
| PLAYER_MOVEMENT_DURATION_THRESHOLD_IN_MS     | player-movement-duration-threshold-in-ms | 500 | Defined in milliseconds                              |
| CORRECT_PLAYER_MOVEMENT                      | correct-player-movement | false         | "true" or "false"                                    |
| SERVER_AUTHORITATIVE_BLOCK_BREAKING           | server-authoritative-block-breaking | false | "true" or "false"                                    |
| CHAT_RESTRICTION                             | chat-restriction | None                | "None", "Dropped", "Disabled"                        |
| DISABLE_PLAYER_INTERACTION                    | disable-player-interaction | false     | "true" or "false"                                    |
| CLIENT_SIDE_CHUNK_GENERATION_ENABLED          | client-side-chunk-generation-enabled | true | "true" or "false"                                  |
| BLOCK_NETWORK_IDS_ARE_HASHES                 | block-network-ids-are-hashes | true    | "true" or "false"                                    |
| DISABLE_PERSONA                              | disable-persona   | false             | Internal Use Only                                    |
| DISABLE_CUSTOM_SKINS                         | disable-custom-skins | false           | "true" or "false"                                    |
| SERVER_BUILD_RADIUS_RATIO                     | server-build-radius-ratio | Disabled   | "Disabled" or any value in range [0.0, 1.0]          |
| EMIT_SERVER_TELEMETRY                        | emit-server-telemetry |                  | Any string                                           |
