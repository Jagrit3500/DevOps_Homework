#!/usr/bin/env bash
# ==============================================================================
# Script: run_host_apache.sh
# Purpose: Fulfills Task 2: Host Network
# - Pulls Apache2 (httpd) image
# - Runs Apache2 container using host network (--network host)
# - Verifies direct access on host port 80
# ==============================================================================

set -e

echo "=== 1. Pulling Apache2 (httpd) Image from Docker Hub ==="
docker pull httpd:alpine

echo -e "\n=== 2. Creating Apache2 Container using Host Network ==="
# In host network mode, the container shares the host's networking namespace.
# Note: Host network works natively on Linux environments.
docker run -d \
  --name apache-host-container \
  --network host \
  httpd:alpine

echo -e "\n=== 3. Accessing Apache Website Directly on Port 80 ==="
sleep 2
curl -I http://localhost:80 || curl -I http://127.0.0.1:80

echo -e "\nHost network Apache2 container is active and accessible directly on port 80!"
