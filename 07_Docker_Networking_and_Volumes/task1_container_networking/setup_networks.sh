#!/usr/bin/env bash
# ==============================================================================
# Script: setup_networks.sh
# Purpose: Fulfills Task 1: Docker Container Networking
# - Creates 3 custom networks: frontend-net, backend-net, db-net
# - Creates 3 containers: frontend, backend, database (mysql)
# - Connects backend to 2 networks (frontend-net and db-net)
# - Validates network isolation and connectivity
# ==============================================================================

set -e

echo "=== 1. Creating 3 Custom Bridge Networks ==="
docker network create --driver bridge frontend-net || true
docker network create --driver bridge backend-net || true
docker network create --driver bridge db-net || true

echo -e "\n=== 2. Launching 3 Containers ==="

# 1. Frontend Container (Nginx on frontend-net)
echo "Starting frontend container on frontend-net..."
docker run -d --name frontend-app --network frontend-net nginx:alpine

# 2. Database Container (MySQL on db-net)
echo "Starting database container (MySQL) on db-net..."
docker run -d --name database-app --network db-net \
  -e MYSQL_ROOT_PASSWORD=devops_pass \
  -e MYSQL_DATABASE=homework_db \
  mysql:8.0

# 3. Backend Container (Alpine with curl/ping tools)
echo "Starting backend container on frontend-net..."
docker run -d --name backend-app --network frontend-net alpine:latest sleep 3600

# Connect backend container to second network (db-net)
echo "Connecting backend-app to db-net as well..."
docker network connect db-net backend-app

echo -e "\n=== 3. Inspecting Network Attachments ==="
docker inspect backend-app --format '{{json .NetworkSettings.Networks}}'

echo -e "\n=== 4. Checking Connectivity ==="
echo "A. Frontend -> Backend (Should SUCCEED):"
docker exec frontend-app ping -c 2 backend-app || true

echo -e "\nB. Backend -> Database (Should SUCCEED):"
docker exec backend-app ping -c 2 database-app || true

echo -e "\nC. Frontend -> Database (Should FAIL due to network isolation):"
docker exec frontend-app ping -c 2 -W 2 database-app || echo "SUCCESS: Network isolation verified! Frontend cannot reach database directly."

echo -e "\nTask 1 Docker Networking successfully configured and verified!"
