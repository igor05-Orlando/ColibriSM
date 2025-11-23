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
2. Run `docker-compose up -d` to start the services.
3. Access the application at `https://localhost` (or your configured IP).

## SSL/TLS
The project is configured to use HTTPS with self-signed certificates for local development.
