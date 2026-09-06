#!/usr/bin/env bash
# ==============================================================================
# Script: run_bind_mount.sh
# Purpose: Fulfills Task 3: Bind Mount
# - Runs Nginx with a local folder bind mounted to /usr/share/nginx/html
# - Verifies initial content "Hello students"
# - Modifies index.html and verifies changes reflect immediately without restarting
# ==============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HTML_DIR="${SCRIPT_DIR}/html"

echo "=== 1. Starting Nginx Container with Bind Mount ==="
docker run -d \
  --name nginx-bindmount \
  -p 8085:80 \
  -v "${HTML_DIR}:/usr/share/nginx/html" \
  nginx:alpine

echo "Waiting for container to initialize..."
sleep 2

echo -e "\n=== 2. Verifying Initial Content (Should be 'Hello students') ==="
curl -s http://localhost:8085 | grep -i "Hello students"

echo -e "\n=== 3. Modifying index.html on the Host Filesystem ==="
cat << 'EOF' > "${HTML_DIR}/index.html"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Docker Bind Mount Demo</title>
  <style>
    body { font-family: sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; background: #0f172a; color: #fff; }
    h1 { color: #38bdf8; }
    p { color: #94a3b8; }
  </style>
</head>
<body>
  <div>
    <h1>Hello students - Live Update Successful!</h1>
    <p>Modified on host and reflected instantly WITHOUT restarting container.</p>
  </div>
</body>
</html>
EOF

echo -e "\n=== 4. Verifying Changes WITHOUT Container Restart ==="
curl -s http://localhost:8085 | grep -i "Live Update Successful"

echo -e "\n✔ SUCCESS: Bind mount verified! Content changed dynamically without restarting container."
