# 🐳 Docker Fundamentals - Hello World Web Applications

## Overview
This directory contains 6 containerized "Hello World" web applications across multiple runtimes and web servers:
1. **Node.js application** (`nodejs-app/`)
2. **Python application** (`python-app/`)
3. **Java application** (`java-app/`)
4. **Apache HTTPD server** (`Apache-app/`)
5. **React application** (`React-app/`)
6. **Nginx application** (`nginx-app/`)

---

## 🚀 Quick Reference: Build & Run Commands

| Application | Container Port | Host Port | Build Command | Run Command | Browser URL |
| :--- | :---: | :---: | :--- | :--- | :--- |
| **Node.js** | `3000` | `3000` | `docker build -t nodejs-app ./nodejs-app` | `docker run -d -p 3000:3000 --name my-node-app nodejs-app` | [http://localhost:3000](http://localhost:3000) |
| **Python** | `5000` | `5000` | `docker build -t python-app ./python-app` | `docker run -d -p 5000:5000 --name my-python-app python-app` | [http://localhost:5000](http://localhost:5000) |
| **Java** | `8080` | `8082` | `docker build -t java-app ./java-app` | `docker run -d -p 8082:8080 --name my-java-app java-app` | [http://localhost:8082](http://localhost:8082) |
| **Apache** | `80` | `8081` | `docker build -t apache-app ./Apache-app` | `docker run -d -p 8081:80 --name my-apache-app apache-app` | [http://localhost:8081](http://localhost:8081) |
| **React** | `80` | `8083` | `docker build -t react-app ./React-app` | `docker run -d -p 8083:80 --name my-react-app react-app` | [http://localhost:8083](http://localhost:8083) |
| **Nginx** | `80` | `8084` | `docker build -t nginx-app ./nginx-app` | `docker run -d -p 8084:80 --name my-nginx-app nginx-app` | [http://localhost:8084](http://localhost:8084) |

---

## 🛠️ Step-by-Step Instructions

### 1. Node.js Application
```bash
cd nodejs-app
docker build -t nodejs-app .
docker run -d -p 3000:3000 --name nodejs-container nodejs-app
curl http://localhost:3000
```

### 2. Python Flask Application
```bash
cd python-app
docker build -t python-app .
docker run -d -p 5000:5000 --name python-container python-app
curl http://localhost:5000
```

### 3. Java Application
```bash
cd java-app
docker build -t java-app .
docker run -d -p 8082:8080 --name java-container java-app
curl http://localhost:8082
```

### 4. Apache HTTPD Application
```bash
cd Apache-app
docker build -t apache-app .
docker run -d -p 8081:80 --name apache-container apache-app
curl http://localhost:8081
```

### 5. React Application
```bash
cd React-app
docker build -t react-app .
docker run -d -p 8083:80 --name react-container react-app
curl http://localhost:8083
```

### 6. Nginx Application
```bash
cd nginx-app
docker build -t nginx-app .
docker run -d -p 8084:80 --name nginx-container nginx-app
curl http://localhost:8084
```

---

## 🧹 Stop and Cleanup Containers
```bash
docker stop nodejs-container python-container java-container apache-container react-container nginx-container
docker rm nodejs-container python-container java-container apache-container react-container nginx-container
```

---

## 📸 Screenshots & Evidence
> *Paste your browser or terminal screenshots for each running application below:*

### 1. Node.js Hello World Webpage
`[PLACEHOLDER: Insert browser screenshot of http://localhost:3000]`

### 2. Python Flask Hello World Webpage
`[PLACEHOLDER: Insert browser screenshot of http://localhost:5000]`

### 3. Java Hello World Webpage
`[PLACEHOLDER: Insert browser screenshot of http://localhost:8082]`

### 4. Apache Web Server Hello World Webpage
`[PLACEHOLDER: Insert browser screenshot of http://localhost:8081]`

### 5. React Application Hello World Webpage
`[PLACEHOLDER: Insert browser screenshot of http://localhost:8083]`

### 6. Nginx Hello World Webpage
`[PLACEHOLDER: Insert browser screenshot of http://localhost:8084]`
