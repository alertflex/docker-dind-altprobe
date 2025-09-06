# Altprobe Container Deployment

This guide demonstrates how to deploy and run Altprobe in a Docker container.

## Prerequisites

- Docker installed on your system
- Access to an ActiveMQ controller
- Properly configured environment variables

## Quick Start Guide

### 1. Build the Docker Image

```bash
docker build . -t altprobe-dind
```

### 2. Create Required Volumes

```bash
mkdir -p /tmp/altprobe-workspace
mkdir -p /tmp/altprobe-output
```

### 3. Run the Container

```bash
docker run -it --privileged \
    -v /tmp/altprobe-workspace:/altprobe_workspace/:rw \
    -v /tmp/altprobe-output:/altprobe_output/:rw \
    -e ALTPROBE_PROJECT_ID=5a50c6fe-ef05-49b8-9d21-14567b58d4e7 \
    -e ALTPROBE_PROBE_NAME=altprobe-dind \
    -e ALTPROBE_SENSORS_GROUP=zone-dind \
    -e ALTPROBE_TIMEZONE_OFFSET=0 \
    -e ALTPROBE_REPORT_INTERVAL=30 \
    -e CONTROLLER_URL=tcp://192.168.1.20:61616 \
    -e CONTROLLER_USER=admin \
    -e CONTROLLER_PWD=***** \
    -e CONTROLLER_ENABLE_ALERTS=false \
    -e CONTROLLER_ENABLE_LOGS=true \
    -e SCANNERS_WORKSPACE=/altprobe_workspace \
    -e SCANNERS_OUTPUT=/altprobe_output \
    -e SENSORS_APP_LOG=indef \
    -e SENSORS_APP_REDIS=indef \
    -e SENSORS_FALCO_LOG=indef \
    -e SENSORS_FALCO_REDIS=indef \
    -e SENSORS_SURICATA_LOG=indef \
    -e SENSORS_SURICATA_REDIS=indef \
    -e SENSORS_REDIS_HOST=127.0.0.1 \
    -e SENSORS_REDIS_PORT=6379 \
    altprobe-dind:latest
```
