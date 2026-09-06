#!/usr/bin/env bash
# ==============================================================================
# Script: run_network_checks.sh
# Purpose: Executes core networking commands and displays formatted results
# ==============================================================================

echo "=== 1. Testing Reachability (ping) ==="
ping -c 3 8.8.8.8 || true

echo -e "\n=== 2. DNS Lookup (nslookup) ==="
nslookup google.com || true

echo -e "\n=== 3. HTTP Header Inspection (curl -I) ==="
curl -I https://www.google.com || true

echo -e "\n=== 4. Active Listening Ports (ss) ==="
ss -tuln 2>/dev/null || netstat -tuln 2>/dev/null || echo "Socket statistics command finished"

echo -e "\n=== 5. Local IP and Interfaces (ip addr) ==="
ip addr 2>/dev/null || ifconfig 2>/dev/null || true

echo -e "\nNetworking diagnostic check completed!"
