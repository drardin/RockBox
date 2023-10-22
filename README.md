# RockBox
A Simple Minecraft Bedrock Dedicated Server Docker Container

## Description
RockBox is a minimal vanilla Bedrock Dedicated Server instance. Through the power of Docker, it's easily transportable, configurable and deployable. It stays up to date with automatic downloading and installation of Bedrock Dedicated Server, while archiving previously downloaded versions for local versioning. It has support for all property values in `server.properties`. There's also file and directory protection, for individual file/directory persistence when upgrading and downgrading. *(downgrading and versioning currently not implemented)*

**Currently only amd64 is supported, but I'm working on arm64 support.**

Follow the project on Docker Hub: https://hub.docker.com/r/rardind/rockbox
Visit my website: https://nimble-nimbus.com/

## Instructions
 1. Install Docker *https://docs.docker.com/get-docker/*
 2. Pull rockbox Docker Image
    `docker pull rardind/rockbox:latest`
 3. Create Docker Volume
    `docker volume create rockbox` 
 4. Create Container
```
docker run -itd -v rockbox:/LZ -p 19132:19132/udp rardind/rockbox:latest
```

## Environment Variables
All container runtime variables are mapped to server.properties value pairs

### Example Usage
#### Setting a Single Property
If you want to set the server-name property at runtime:
```
docker run -itd -v rockbox:/LZ -p 19132:19132/udp -e SERVER_NAME="Your Server Name" rardind/rockbox:latest
```

#### Setting Multiple Properties
An `-e` flag must be set for *each* environment variable

If you want to set the server-name and server-port properties at runtime:
```
docker run -itd -v rockbox:/LZ -p 25255:25255/udp -e SERVER_NAME="Your Server Name" -e SERVER_PORT="25255" rardind/rockbox:latest
```

You can also use backslashes, like in this example:
```
docker run -itd -p 25255:25255/udp \
-e SERVER_NAME="Your Server Name" \
-e LEVEL_NAME="A World Name" \
rardind/rockbox:latest
```
*Note: The last line must not include a backslash*

### Property Mapping Table
The docker container runtime variables are mapped to server.properties value pairs nearly identically, other than being uppercase and `-` being replaced with `_`. If the default value is acceptable, then the variable doesn't need to be defined at runtime.

| Docker Container Runtime Environment Variable| Default Value     | Acceptable Options                                      |
|----------------------------------------------|-------------------|---------------------------------------------------------|
| SERVER_NAME                                  | Dedicated Server  | Any string (Cannot contain ":")                         |
| GAMEMODE                                     | survival          | "survival", "creative", "adventure"                     |
| FORCE_GAMEMODE                               | false             | "true" or "false"                                       |
| DIFFICULTY                                   | easy              | "peaceful", "easy", "normal", "hard"                    |
| ALLOW_CHEATS                                 | false             | "true" or "false"                                       |
| MAX_PLAYERS                                  | 10                | Any positive integer                                    |
| ONLINE_MODE                                  | true              | "true" or "false"                                       |
| ALLOW_LIST                                   | false             | "true" or "false"                                       |
| SERVER_PORT                                  | 19132             | Integers in the range [1, 65535]                        |
| SERVER_PORTV6                                | 19133             | Integers in the range [1, 65535]                        |
| ENABLE_LAN_VISIBILITY                        | true              | "true" or "false"                                       |
| VIEW_DISTANCE                                | 32                | Positive integer equal to 5 or greater                  |
| PLAYER_IDLE_TIMEOUT                          | 30                | Any non-negative integer                                |
| MAX_THREADS                                  | 8                 | Any non-negative integer                                |
| LEVEL_NAME                                   | Bedrock level     | Any string (Cannot contain ":" or illegal chars)        |
| LEVEL_TYPE                                   | DEFAULT           | "DEFAULT", "FLAT", "LEGACY"                             |
| LEVEL_SEED                                   |                   | Any string                                              |
| DEFAULT_PLAYER_PERMISSION_LEVEL              | member            | "visitor", "member", "operator"                         |
| TEXTUREPACK_REQUIRED                         | false             | "true" or "false"                                       |
| CONTENT_LOG_FILE_ENABLED                     | false             | "true" or "false"                                       |
| COMPRESSION_THRESHOLD                        | 1                 | Integers in the range [1, 65535]                        |
| COMPRESSION_ALGORITHM                        | zlib              | "zlib", "snappy"                                        |
| SERVER_AUTHORITATIVE_MOVEMENT                | server-auth       | "client-auth", "server-auth", "server-auth-with-rewind" |
| PLAYER_MOVEMENT_SCORE_THRESHOLD              | 20                | Any positive integer                                    |
| PLAYER_MOVEMENT_ACTION_DIRECTION_THRESHHOLD  | 0.85              | Any value in the range [0, 1]                           |
| PLAYER_MOVEMENT_DISTANCE_THRESHOLD           | 0.3               | Any positive number                                     |
| PLAYER_MOVEMENT_DURATION_THRESHOLD_IN_MS     | 500               | Any positive number                                     |
| CORRECT_PLAYER_MOVEMENT                      | false             | "true" or "false"                                       |
| SERVER_AUTHORITATIVE_BLOCK_BREAKING          | false             | "true" or "false"                                       |
| CHAT_RESTRICTION                             | None              | "None", "Dropped", "Disabled"                           |
| DISABLE_PLAYER_INTERACTION                   | false             | "true" or "false"                                       |
| CLIENT_SIDE_CHUNK_GENERATION_ENABLED         | true              | "true" or "false"                                       |
| BLOCK_NETWORK_IDS_ARE_HASHES                 | true              | "true" or "false"                                       |
| DISABLE_PERSONA                              | false             | Internal Use Only                                       |
| DISABLE_CUSTOM_SKINS                         | false             | "true" or "false"                                       |
| SERVER_BUILD_RADIUS_RATIO                    | Disabled          | "Disabled" or any value in the range [0.0, 1.0]         |
| EMIT_SERVER_TELEMETRY                        | false             | "true" or "false"                                       |

# RockBox
A Simple Minecraft Bedrock Dedicated Server Docker Container

View Docker Hub repo: https://hub.docker.com/r/rardind/rockbox

Run `docker pull rardind/rockbox:latest`

## Usage
Normal Usage:
```
docker run -itd -p 19132:19132/udp rardind/rockbox:latest
```

## Environment Variables
All value pairs in server.properties are mapped to container runtime variables.

### Example Usage
#### Setting A Single Property
If you want to set the server-name property at runtime:
```
docker run -itd -p 19132:19132/udp -e SERVER_NAME="Your Server Name" rardind/rockbox:latest
```

#### Setting Multiple Properties
An `-e` flag must be set for *each* environment variable

If you want to set the server-name and server-port properties at runtime:
```
docker run -itd -p 25255:25255/udp -e SERVER_NAME="Your Server Name" -e SERVER_PORT="25255" rardind/rockbox:latest
```

You can also use backslashes, like in this example:
```
docker run -itd -p 25255:25255/udp \
-e SERVER_NAME="Your Server Name" \
-e LEVEL_NAME="A World Name" \
rardind/rockbox:latest
```

### Property Variable Mapping Table
The docker container runtime variables are mapped nearly identically, other than being uppercase and `-` being replaced with `_`. If the default value is acceptable, then the variable doesn't need to be defined at runtime.

| Docker Container Runtime Environment Variable| Default Value     | Acceptable Options                                      |
|----------------------------------------------|-------------------|---------------------------------------------------------|
| SERVER_NAME                                  | Dedicated Server  | Any string (Cannot contain ":")                         |
| GAMEMODE                                     | survival          | "survival", "creative", "adventure"                     |
| FORCE_GAMEMODE                               | false             | "true" or "false"                                       |
| DIFFICULTY                                   | easy              | "peaceful", "easy", "normal", "hard"                    |
| ALLOW_CHEATS                                 | false             | "true" or "false"                                       |
| MAX_PLAYERS                                  | 10                | Any positive integer                                    |
| ONLINE_MODE                                  | true              | "true" or "false"                                       |
| ALLOW_LIST                                   | false             | "true" or "false"                                       |
| SERVER_PORT                                  | 19132             | Integers in the range [1, 65535]                        |
| SERVER_PORTV6                                | 19133             | Integers in the range [1, 65535]                        |
| ENABLE_LAN_VISIBILITY                        | true              | "true" or "false"                                       |
| VIEW_DISTANCE                                | 32                | Positive integer equal to 5 or greater                  |
| PLAYER_IDLE_TIMEOUT                          | 30                | Any non-negative integer                                |
| MAX_THREADS                                  | 8                 | Any non-negative integer                                |
| LEVEL_NAME                                   | Bedrock level     | Any string (Cannot contain ":" or illegal chars)        |
| LEVEL_TYPE                                   | DEFAULT           | "DEFAULT", "FLAT", "LEGACY"                             |
| LEVEL_SEED                                   |                   | Any string                                              |
| DEFAULT_PLAYER_PERMISSION_LEVEL              | member            | "visitor", "member", "operator"                         |
| TEXTUREPACK_REQUIRED                         | false             | "true" or "false"                                       |
| CONTENT_LOG_FILE_ENABLED                     | false             | "true" or "false"                                       |
| COMPRESSION_THRESHOLD                        | 1                 | Integers in the range [1, 65535]                        |
| COMPRESSION_ALGORITHM                        | zlib              | "zlib", "snappy"                                        |
| SERVER_AUTHORITATIVE_MOVEMENT                | server-auth       | "client-auth", "server-auth", "server-auth-with-rewind" |
| PLAYER_MOVEMENT_SCORE_THRESHOLD              | 20                | Any positive integer                                    |
| PLAYER_MOVEMENT_ACTION_DIRECTION_THRESHHOLD  | 0.85              | Any value in the range [0, 1]                           |
| PLAYER_MOVEMENT_DISTANCE_THRESHOLD           | 0.3               | Any positive number                                     |
| PLAYER_MOVEMENT_DURATION_THRESHOLD_IN_MS     | 500               | Any positive number                                     |
| CORRECT_PLAYER_MOVEMENT                      | false             | "true" or "false"                                       |
| SERVER_AUTHORITATIVE_BLOCK_BREAKING          | false             | "true" or "false"                                       |
| CHAT_RESTRICTION                             | None              | "None", "Dropped", "Disabled"                           |
| DISABLE_PLAYER_INTERACTION                   | false             | "true" or "false"                                       |
| CLIENT_SIDE_CHUNK_GENERATION_ENABLED         | true              | "true" or "false"                                       |
| BLOCK_NETWORK_IDS_ARE_HASHES                 | true              | "true" or "false"                                       |
| DISABLE_PERSONA                              | false             | Internal Use Only                                       |
| DISABLE_CUSTOM_SKINS                         | false             | "true" or "false"                                       |
| SERVER_BUILD_RADIUS_RATIO                    | Disabled          | "Disabled" or any value in the range [0.0, 1.0]         |
| EMIT_SERVER_TELEMETRY                        | false             | "true" or "false"                                       |
