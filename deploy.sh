#!/bin/bash

# Function to find a free port
find_free_port() {
    for port in $(seq 8000 9000); do
        if ! lsof -Pi :$port -sTCP:LISTEN -t >/dev/null 2>&1; then
            echo $port
            return 0
        fi
    done
    echo "No free port found in range 8000-9000" >&2
    return 1
}

# Create .env if it doesn't exist
if [ ! -f .env ]; then
    touch .env
fi

# Check if APP_PORT is already set
if ! grep -q "^APP_PORT=" .env; then
    PORT=$(find_free_port)
    if [ $? -eq 0 ]; then
        echo "APP_PORT=$PORT" >> .env
        echo "Selected free port: $PORT"
    else
        echo "Failed to find a free port"
        exit 1
    fi
else
    echo "APP_PORT already set in .env"
fi

# Load environment variables from .env
export $(grep -v '^#' .env | xargs)

# Run docker-compose
docker-compose up -d