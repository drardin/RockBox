#!/bin/bash

# Load variables from config.env
CONFIG_FILE="./config.env"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Error: $CONFIG_FILE file not found."
    exit 1
fi

#### --- FUNCTIONS START --- ####
initialize_dirs() {
    # List of directories to initialize
    DIRECTORIES=("DEBUG" "main" "backups" "tmp")

    # Loop through the directories and check if they exist, if not, create them
    for dir in "${DIRECTORIES[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir "$dir"
            echo "Created directory: $dir"
        else
            echo "Directory already exists: $dir"
        fi
    done
}

#initialize_server() {
    # Create server configuration files, set up properties, etc.
    # Example:
    # echo "server-name=myserver" > server.properties
    # ...
#}
#### --- FUNCTIONS END --- ####



# Main function
main() {
    # Generate directory structure
    initialize_dirs

    # Perform server initialization
    initialize_server

    # Start server using Box64
    box64 $BEDROCK_SERVER_PATH

    # Additional post-server-startup tasks (if needed)
    # ...
}

# Call the main function
main

#### --- DEBUGGING START --- ####
echo "MAIN_PATH: $MAIN_PATH"
echo "DEBUG_PATH: $DEBUG_PATH"
echo "TEMP_PATH: $TEMP_PATH"
echo "BEDROCK_SERVER_PATH: $BEDROCK_SERVER_PATH"
echo "SERVER_NAME: $SERVER_NAME"
echo "MAX_PLAYERS: $MAX_PLAYERS"
echo "SERVER_PORT: $SERVER_PORT"
#### --- DEBUGGING END --- ####