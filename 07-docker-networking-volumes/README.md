# Docker Networking and Volumes

Name: Jagrit Dharewa  
Roll number: **10642**

## Container Networking

The frontend, backend, and database use three Docker networks. The backend can
connect to both the frontend and database.

<!-- Save screenshot in container-networking/ as container-networking_screenshot.png -->
![Container networking](container-networking/container-networking_screenshot.png)

## Host Network

Apache uses the host network and is available on port `80`.

<!-- Save screenshots in host-network/ as host-network-started_screenshot.png and host-network-page_screenshot.png -->
![Host-network container](host-network/host-network-started_screenshot.png)

![Apache on port 80](host-network/host-network-page_screenshot.png)

## Bind Mount

The page changes after editing the mounted `index.html` file. The container is
not restarted.

<!-- Save screenshots in bind-mount/ as bind-mount-before_screenshot.png and bind-mount-after_screenshot.png -->
![Bind mount before update](bind-mount/bind-mount-before_screenshot.png)

![Bind mount after update](bind-mount/bind-mount-after_screenshot.png)

## Overlay Network

The overlay-network explanation and commands are in
[overlay-network/README.md](overlay-network/README.md).
