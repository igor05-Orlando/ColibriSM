# ColibriSM Dockerized

## Overview
This project is a Dockerized version of ColibriSM, a modern social media sharing platform.

## Infrastructure
- **Web Server**: Nginx
- **Application**: PHP 8.2-FPM (Alpine Linux)
- **Database**: MariaDB
- **Process Control**: Supervisor

## Getting Started
1. Ensure Docker and Docker Compose (V2) are installed.
2. Run `./deploy.sh --install` to start the services and get the installation URL.
3. Access the application at the provided URL and complete the setup.

## Commands
- `./deploy.sh`: Start the services with automatic port assignment.
- `./deploy.sh --install`: Start services and display installation URL.
- `./deploy.sh --hard-reset`: Reset everything to factory state (removes all data and configurations).

## SSL/TLS
The project is configured to use HTTPS with self-signed certificates for local development.
