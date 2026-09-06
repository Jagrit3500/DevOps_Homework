# 🔌 Docker Networking & Volumes Homework

## Overview
This module covers container isolation, multi-network topology, host networking, storage bind mounts with live-reloading, and overlay network architecture.

---

## 📌 Task 1: Docker Container Networking

### Architecture
* **Networks**:
  1. `frontend-net` (Bridge)
  2. `backend-net` (Bridge)
  3. `db-net` (Bridge)
* **Containers**:
  - `frontend-app` (Nginx, connected to `frontend-net`)
  - `backend-app` (Alpine, connected to **both** `frontend-net` and `db-net`)
  - `database-app` (MySQL, connected to `db-net`)
* **Security & Routing Logic**:
  - `frontend-app` can reach `backend-app`
  - `backend-app` can reach `database-app`
  - `frontend-app` **CANNOT** reach `database-app` (database is protected behind backend tier)

```
[ frontend-app ] 
       | (frontend-net)
[ backend-app ]
       | (db-net)
[ database-app ]
```

### Execution Script
Run the automated setup script:
```bash
chmod +x task1_container_networking/setup_networks.sh
./task1_container_networking/setup_networks.sh
```

### Connectivity Verification Commands
```bash
# 1. Test Frontend -> Backend (Expected: SUCCESS)
docker exec frontend-app ping -c 2 backend-app

# 2. Test Backend -> Database (Expected: SUCCESS)
docker exec backend-app ping -c 2 database-app

# 3. Test Frontend -> Database (Expected: FAILS / TIMEOUT - Network Isolation)
docker exec frontend-app ping -c 2 -W 2 database-app
```

---

## 📌 Task 2: Host Network

### Concept
In Docker's `--network host` mode, the container shares the network namespace of the host machine directly. Port mapping (`-p`) is not used because container ports bind directly to host interfaces.

### Execution
Run the script or individual commands:
```bash
chmod +x task2_host_network/run_host_apache.sh
./task2_host_network/run_host_apache.sh
```

Or manually:
```bash
# Pull Apache image
docker pull httpd:alpine

# Run container on host network
docker run -d --name apache-host-app --network host httpd:alpine

# Verify direct access on port 80
curl -I http://localhost:80
```

---

## 📌 Task 3: Bind Mount

### Concept
A bind mount maps a directory on the host machine directly into the container's filesystem. Changes made on the host are immediately reflected inside the running container without requiring an image rebuild or container restart.

### Execution & Verification
```bash
chmod +x task3_bind_mount/run_bind_mount.sh
./task3_bind_mount/run_bind_mount.sh
```

### Manual Step-by-Step Walkthrough:
1. **Prepare Host Directory & File**:
   ```bash
   mkdir -p ./html
   echo "<h1>Hello students</h1>" > ./html/index.html
   ```

2. **Launch Nginx with Bind Mount**:
   ```bash
   docker run -d --name nginx-bindmount -p 8085:80 -v "$(pwd)/html:/usr/share/nginx/html" nginx:alpine
   ```

3. **Verify Initial Webpage**:
   ```bash
   curl http://localhost:8085
   # Output: <h1>Hello students</h1>
   ```

4. **Edit File on Host (WITHOUT restarting container)**:
   ```bash
   echo "<h1>Hello students - Live Update Working!</h1>" > ./html/index.html
   ```

5. **Verify Updated Content Immediately**:
   ```bash
   curl http://localhost:8085
   # Output: <h1>Hello students - Live Update Working!</h1>
   ```

---

## 📌 Task 4: Overlay Network Research
Comprehensive research on Docker Overlay Networks, VXLAN encapsulation, Docker Swarm routing mesh, IPSec encryption, and production use cases is documented in:
📄 [task4_overlay_network/overlay_network_research.md](task4_overlay_network/overlay_network_research.md)

---

## 📸 Screenshots & Evidence
> *Paste your screenshots for each task below:*

### Task 1: Docker Container Networks & Connectivity Checks
`[PLACEHOLDER: Insert screenshot showing docker network ls, docker inspect backend-app, and ping test results]`

### Task 2: Apache2 Running on Host Network
`[PLACEHOLDER: Insert screenshot showing docker run --network host and curl http://localhost:80]`

### Task 3: Bind Mount Initial "Hello students" & Live Host Edit
`[PLACEHOLDER: Insert screenshot showing curl output of 'Hello students' followed by live file edit and immediate curl verification without restart]`

### Task 4: Overlay Network Setup / Documentation
`[PLACEHOLDER: Insert screenshot of overlay network research or docker network create -d overlay output]`
