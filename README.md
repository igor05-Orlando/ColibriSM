# ColibriSM Dockerized

## Overview
This project is a Dockerized version of ColibriSM, a modern social media sharing platform.

## Infrastructure
- **Web Server**: Nginx
- **Application**: PHP 8.2-FPM (Alpine Linux)
- **Database**: MariaDB
- **Process Control**: Supervisor

## Getting Started
1. Ensure Docker and Docker Compose are installed.
2. Run `./deploy.sh` to start the services (it will automatically select a free port if not set).
3. Access the application at `https://localhost:<APP_PORT>` (or your configured IP and port from .env).

## SSL/TLS
The project is configured to use HTTPS with self-signed certificates for local development.
