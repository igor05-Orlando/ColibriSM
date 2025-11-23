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

# Function to check if a port is free
is_port_free() {
    local port=$1
    if lsof -Pi :$port -sTCP:LISTEN -t >/dev/null 2>&1; then
        return 1  # not free
    else
        return 0  # free
    fi
}

# Stop any existing containers
docker compose down

# Create .env if it doesn't exist
if [ ! -f .env ]; then
    touch .env
fi

# Check if HTTP_PORT is already set
if ! grep -q "^HTTP_PORT=" .env; then
    PORT=$(find_free_port)
    if [ $? -eq 0 ]; then
        echo "HTTP_PORT=$PORT" >> .env
        echo "Selected free HTTP port: $PORT"
    else
        echo "Failed to find a free HTTP port"
        exit 1
    fi
else
    echo "HTTP_PORT already set in .env"
fi

# Check if APP_PORT is already set
if ! grep -q "^APP_PORT=" .env; then
    PORT=$(find_free_port)
    if [ $? -eq 0 ]; then
        echo "APP_PORT=$PORT" >> .env
        echo "Selected free HTTPS port: $PORT"
    else
        echo "Failed to find a free HTTPS port"
        exit 1
    fi
else
    echo "APP_PORT already set in .env"
fi

# Load environment variables from .env
export $(grep -v '^#' .env | xargs)

# Verify and reassign ports if necessary
if [ -n "$HTTP_PORT" ] && ! is_port_free "$HTTP_PORT"; then
    echo "HTTP_PORT $HTTP_PORT is not free, reassigning..."
    NEW_PORT=$(find_free_port)
    if [ $? -eq 0 ]; then
        sed -i.bak "s/^HTTP_PORT=.*/HTTP_PORT=$NEW_PORT/" .env
        HTTP_PORT=$NEW_PORT
        echo "Reassigned HTTP port to: $NEW_PORT"
    else
        echo "Failed to reassign HTTP port"
        exit 1
    fi
fi

if [ -n "$APP_PORT" ] && ! is_port_free "$APP_PORT"; then
    echo "APP_PORT $APP_PORT is not free, reassigning..."
    NEW_PORT=$(find_free_port)
    if [ $? -eq 0 ]; then
        sed -i.bak "s/^APP_PORT=.*/APP_PORT=$NEW_PORT/" .env
        APP_PORT=$NEW_PORT
        echo "Reassigned HTTPS port to: $NEW_PORT"
    else
        echo "Failed to reassign HTTPS port"
        exit 1
    fi
fi

# Re-export after potential changes
export $(grep -v '^#' .env | xargs)

# Run docker compose
docker compose up -d