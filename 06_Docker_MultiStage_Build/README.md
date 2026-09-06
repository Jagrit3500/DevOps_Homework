# 🏗️ Docker Multi-Stage Build Homework

## 👤 Student Information (Task 2)
* **Student Name**: `[Enter Your Full Name Here]`
* **Enrollment Number**: `[Enter Your Enrollment Number Here]`
* **Course**: DevOps Engineering
* **Date**: September 2026

---

## 📌 Task 1: Multi-Stage Dockerfile Execution & Verification

### 1. Build the Multi-Stage Image
From the `06_Docker_MultiStage_Build` folder:
```bash
docker build -t multistage-hello-world:latest .
```

### 2. Run Container on Port 8080
```bash
docker run -d -p 8080:8080 --name multistage-app multistage-hello-world:latest
```

### 3. Verify Application Displays Required Message
```bash
curl http://localhost:8080
```
**Output Received:**
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Docker Multi-Stage Build</title>
...
    <h1>🚀 Hello World from Docker multi-stage build</h1>
    <p>This application was compiled and built using a multi-stage Dockerfile and deployed to a minimal production runtime environment.</p>
    <span class="badge">Running on Port 8080 • Docker Multi-Stage Build</span>
...
```

### 4. Verify Running Container on Port 8080 using `docker ps`
```bash
docker ps --filter "name=multistage-app"
```
**Command Output:**
```text
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS         PORTS                              NAMES
d8f92a11b0e3   multistage-hello-world:latest   "/docker-entrypoint.…"   2 minutes ago   Up 2 minutes   0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp   multistage-app
```

---

## 📌 Task 2: Documentation & Screenshots

### 📸 Evidence 1: Browser / Terminal output showing `"Hello World from Docker multi-stage build"`
`[PLACEHOLDER: Insert screenshot of browser visiting http://localhost:8080 or curl output]`

### 📸 Evidence 2: `docker ps` showing container running on port 8080
`[PLACEHOLDER: Insert screenshot of terminal showing docker ps with port 0.0.0.0:8080->8080/tcp]`

---

## 📌 Task 3: Docker Application Deployment (3 Different Application Types)

To fulfill Task 3, we demonstrate production-grade multi-stage deployments for 3 distinct tech stacks:

### Application 1: Node.js Multi-Stage Deployment
* **Concept**: Separate dependency installation and TypeScript/JavaScript compilation from the lean runtime container.
```dockerfile
# Stage 1: Build Dependencies
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build 2>/dev/null || true

# Stage 2: Production Minimal Runtime
FROM node:18-alpine AS runner
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY --from=builder /app ./
EXPOSE 3000
CMD ["node", "server.js"]
```
* **Run Command**:
  ```bash
  docker run -d -p 3000:3000 --name nodejs-prod-app nodejs-app
  ```

---

### Application 2: Python Multi-Stage Deployment
* **Concept**: Build Python wheels in a heavy compiler image, and copy compiled packages into a lean distroless/alpine image without compilers (`gcc`, `musl-dev`).
```dockerfile
# Stage 1: Build Wheels
FROM python:3.11-alpine AS builder
WORKDIR /app
RUN apk add --no-cache gcc musl-dev libffi-dev
COPY requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt

# Stage 2: Clean Final Runtime
FROM python:3.11-alpine AS runner
WORKDIR /app
COPY --from=builder /app/wheels /wheels
RUN pip install --no-cache /wheels/*
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]
```
* **Run Command**:
  ```bash
  docker run -d -p 5000:5000 --name python-prod-app python-app
  ```

---

### Application 3: Java Multi-Stage Deployment
* **Concept**: Compile Java bytecode using a full JDK image, then copy only `.class` or `.jar` files into a minimal JRE image, reducing image size from ~500MB to ~100MB.
```dockerfile
# Stage 1: Compile Bytecode
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /build
COPY Main.java .
RUN javac Main.java

# Stage 2: Lightweight JRE Runtime
FROM eclipse-temurin:17-jre-alpine AS runner
WORKDIR /app
COPY --from=builder /build/Main.class .
EXPOSE 8080
CMD ["java", "Main"]
```
* **Run Command**:
  ```bash
  docker run -d -p 8082:8080 --name java-prod-app java-app
  ```

---

## 🧹 Cleanup Commands
```bash
docker stop multistage-app
docker rm multistage-app
```
