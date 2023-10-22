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
The docker container runtime variables are mapped nearly identically, other than being uppercase and dashes being replaced with underscores
`docker variable:server.properties variable`

| Setting Name                                 | Description                                        |
|-----------------------------------------------|----------------------------------------------------|
| SERVER_NAME                                  | server-name                                       |
| GAMEMODE                                    | gamemode                                          |
| FORCE_GAMEMODE                              | force-gamemode                                    |
| DIFFICULTY                                  | difficulty                                        |
| ALLOW_CHEATS                                | allow-cheats                                      |
| MAX_PLAYERS                                 | max-players                                       |
| ONLINE_MODE                                 | online-mode                                       |
| ALLOW_LIST                                  | allow-list                                        |
| SERVER_PORT                                 | server-port                                       |
| SERVER_PORTV6                               | server-portv6                                     |
| ENABLE_LAN_VISIBILITY                       | enable-lan-visibility                              |
| VIEW_DISTANCE                               | view-distance                                     |
| PLAYER_IDLE_TIMEOUT                         | player-idle-timeout                               |
| MAX_THREADS                                 | max-threads                                       |
| LEVEL_NAME                                  | level-name                                        |
| LEVEL_TYPE                                  | level-type                                        |
| LEVEL_SEED                                  | level-seed                                        |
| DEFAULT_PLAYER_PERMISSION_LEVEL             | default-player-permission-level                   |
| TEXTUREPACK_REQUIRED                        | texturepack-required                               |
| CONTENT_LOG_FILE_ENABLED                    | content-log-file-enabled                           |
| COMPRESSION_THRESHOLD                       | compression-threshold                              |
| COMPRESSION_ALGORITHM                       | compression-algorithm                              |
| SERVER_AUTHORITATIVE_MOVEMENT               | server-authoritative-movement                       |
| PLAYER_MOVEMENT_SCORE_THRESHOLD             | player-movement-score-threshold                   |
| PLAYER_MOVEMENT_ACTION_DIRECTION_THRESHHOLD  | player-movement-action-direction-threshold       |
| PLAYER_MOVEMENT_DISTANCE_THRESHOLD          | player-movement-distance-threshold                 |
| PLAYER_MOVEMENT_DURATION_THRESHOLD_IN_MS    | player-movement-duration-threshold-in-ms           |
| CORRECT_PLAYER_MOVEMENT                     | correct-player-movement                             |
| SERVER_AUTHORITATIVE_BLOCK_BREAKING          | server-authoritative-block-breaking                |
| CHAT_RESTRICTION                            | chat-restriction                                   |
| DISABLE_PLAYER_INTERACTION                   | disable-player-interaction                          |
| CLIENT_SIDE_CHUNK_GENERATION_ENABLED         | client-side-chunk-generation-enabled                |
| BLOCK_NETWORK_IDS_ARE_HASHES                 | block-network-ids-are-hashes                       |
| DISABLE_PERSONA                             | disable-persona                                    |
| SERVER_BUILD_RADIUS_RATIO                    | server-build-radius-ratio                           |
| EMIT_SERVER_TELEMETRY                       | emit-server-telemetry                               |


The following are default property values and don't need to be defined at container runtime

 - server-name=RockBox
 - gamemode=survival
 - force-gamemode=false
 - difficulty=easy
 - allow-cheats=false
 - max-players=10
 - online-mode=true
 - allow-list=false
 - server-port=19132
 - server-portv6=19133
 - enable-lan-visibility=true
 - view-distance=32
 - tick-distance=4
 - player-idle-timeout=30
 - max-threads=8
 - level-name=Bedrock level
 - level-type=DEFAULT
 - level-seed=
 - default-player-permission-level=member
 - texturepack-required=false
 - content-log-file-enabled=false
 - compression-threshold=1
 - compression-algorithm=zlib
 - server-authoritative-movement=server-auth
 - player-movement-score-threshold=20
 - player-movement-action-direction-threshold=0.85
 - player-movement-distance-threshold=0.3
 - player-movement-duration-threshold-in-ms=500
 - correct-player-movement=false
 - server-authoritative-block-breaking=false
 - chat-restriction=None
 - disable-player-interaction=false
 - client-side-chunk-generation-enabled=true
 - block-network-ids-are-hashes=true
 - disable-persona=false
 - server-build-radius-ratio=Disabled
 - emit-server-telemetry=false