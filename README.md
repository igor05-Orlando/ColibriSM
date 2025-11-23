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
2. Run `./deploy.sh` to start the services (it will automatically select free ports if not set and stop any existing containers).
3. Access the application at `https://localhost:<APP_PORT>` (HTTP available on `http://localhost:<HTTP_PORT>`, ports from .env).

## SSL/TLS
The project is configured to use HTTPS with self-signed certificates for local development.
