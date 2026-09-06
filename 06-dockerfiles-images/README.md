# Dockerfiles and Images

## Run All

```bash
docker compose up -d --build
docker compose ps
```

| App | URL |
| --- | --- |
| Multi-stage | http://localhost:8080 |
| Node.js | http://localhost:8201 |
| Python | http://localhost:8202 |
| Java | http://localhost:8203 |

Stop all apps:

```bash
docker compose down
```

## Deployment Evidence

<!-- Save your deployment screenshots here -->
![Node.js deployment](nodejs-deployment_screenshot.png)

![Python deployment](python-deployment_screenshot.png)

![Java deployment](java-deployment_screenshot.png)
