#!/bin/bash

# Load variables from config.env
CONFIG_FILE="./config.env"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Error: $CONFIG_FILE file not found."
    exit 1
fi

# Check for command line arguments
if [[ "$#" -gt 0 && "$1" == "--debug" ]]; then
    DEBUG=true
else
    DEBUG=false
fi

#### --- FUNCTIONS START --- ####
debug() {
    if [ "$DEBUG" = true ]; then
        echo "MAIN_PATH: $MAIN_PATH"
        echo "DEBUG_PATH: $DEBUG_PATH"
        echo "TEMP_PATH: $TEMP_PATH"
        echo "LOG_PATH: $LOG_PATH"
        echo "SERVER_DOWNLOAD_LOG: $SERVER_DOWNLOAD_LOG"
        echo "LATEST_VER: $LATEST_VER"
        echo "LATEST_URL: $LATEST_URL"
        echo "BEDROCK_SERVER_PATH: $BEDROCK_SERVER_PATH"
        echo "SERVER_NAME: $SERVER_NAME"
        echo "MAX_PLAYERS: $MAX_PLAYERS"
        echo "SERVER_PORT: $SERVER_PORT"
    fi
}

initDirs() {
    IFS=',' read -ra DIR_ARRAY <<< "$DIRECTORIES"
    for dir in "${DIR_ARRAY[@]}"; do
        dir_path="$APP_HOME/$dir"
        if [ ! -d "$dir_path" ]; then
            mkdir -p "$dir_path"
            echo "Created directory: $dir_path"
        else
            echo "Directory already exists (skipping creation): $dir_path"
        fi
    done
}

getLatestBDSVersion() {
    local download_page
    download_page=$(curl -H "Accept-Encoding: identity" -H "Accept-Language: en" -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36" --no-progress-meter -s https://www.minecraft.net/en-us/download/server/bedrock)

    local latest_url
    latest_url=$(echo "$download_page" | grep -o 'https://minecraft.azureedge.net/bin-linux/bedrock-server-[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\.zip' | head -n 1)

    if [ -n "$latest_url" ]; then
        export LATEST_URL="$latest_url"
        export LATEST_VER=$(basename "$latest_url" | sed 's/bedrock-server-\(.*\)\.zip/\1/')
    else
        echo "Failed to fetch Minecraft Bedrock server download link."
        exit 1
    fi
}


extractBDS() {
    local zip_file="$1"

    if [ ! -e "$FIRST_RUN_FLAG" ]; then
        # First run: Extract all files to the destination folder
        unzip -o "$DOWNLOADS_PATH/$zip_file" -d "$MAIN_PATH" > /dev/null 2>&1
        touch "$FIRST_RUN_FLAG"  # Create the first run flag file
        echo "First run: All files extracted to $MAIN_PATH."
    else
        # Subsequent runs: Extract all files to $TEMP_PATH for staging
        unzip -o "$DOWNLOADS_PATH/$zip_file" -d "$TEMP_PATH/extracted" > /dev/null 2>&1
        
        if [ $? -ne 0 ]; then
            echo "Failed to extract files."
            exit 1
        fi
        
        # Move only non-protected files from $TEMP_PATH to $MAIN_PATH
        rsync -a --ignore-existing "$TEMP_PATH/extracted/" "$MAIN_PATH/"
        
        # Clean up extracted files
        rm -rf "$TEMP_PATH/extracted"
        echo "Subsequent run: Non-protected files extracted and moved successfully."
    fi
}


updateBDS() {
    local download_filename="bedrock-server-$LATEST_VER.zip"

    # Check if SERVER_DOWNLOAD_LOG file exists
    if [ ! -f "$SERVER_DOWNLOAD_LOG" ]; then
        echo "$LATEST_VER" > "$SERVER_DOWNLOAD_LOG"
        # Download latest version of BDS
        echo "Downloading Minecraft Bedrock server version: $LATEST_VER from $LATEST_URL"
        curl -o "$DOWNLOADS_PATH/$download_filename" "$LATEST_URL"
        extractBDS "$download_filename"
    else
        # Check if an update is needed
        local last_version
        last_version=$(tail -n 1 "$SERVER_DOWNLOAD_LOG")

        if [ "$LATEST_VER" != "$last_version" ]; then
            # Download latest version of BDS
            echo "Downloading Minecraft Bedrock server version: $LATEST_VER from $LATEST_URL"
            curl -o "$DOWNLOADS_PATH/$download_filename" "$LATEST_URL"
            echo "$LATEST_VER" >> "$SERVER_DOWNLOAD_LOG"
            extractBDS "$download_filename"
        else
            echo "Server is already up to date. Skipping download."
        fi
    fi
}


initBDS() {
cd "$MAIN_PATH" || exit
getLatestBDSVersion
updateBDS
}
#### --- FUNCTIONS END --- ####



# Main function
main() {
    # Generate directory structure
    initDirs

    # Perform server initialization
    initBDS

    # Start server using Box64
    #box64 $BEDROCK_SERVER_PATH

    # Additional post-server-startup tasks (if needed)
    # ...
}

# Call the main function
main