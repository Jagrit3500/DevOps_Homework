# 🌐 Networking Fundamentals Homework

## Overview
This document contains the execution, analysis, outputs, and explanations for essential DevOps networking commands as outlined in **Task 1** and **Task 2**.

---

## 📋 Networking Commands Analysis & Execution

### 1. `ping`
* **Purpose**: Tests end-to-end network connectivity and packet transit round-trip latency between the host and a remote target using ICMP (Internet Control Message Protocol) Echo Request/Reply.
* **DevOps Use Case**: Initial health check when a server or microservice cannot reach an external API or database.
* **Command**:
  ```bash
  ping -c 4 google.com
  ```
* **Sample Output**:
  ```text
  PING google.com (142.250.190.46) 56(84) bytes of data.
  64 bytes from ord38s28-in-f14.1e100.net (142.250.190.46): icmp_seq=1 ttl=117 time=14.2 ms
  64 bytes from ord38s28-in-f14.1e100.net (142.250.190.46): icmp_seq=2 ttl=117 time=13.8 ms
  64 bytes from ord38s28-in-f14.1e100.net (142.250.190.46): icmp_seq=3 ttl=117 time=14.1 ms
  64 bytes from ord38s28-in-f14.1e100.net (142.250.190.46): icmp_seq=4 ttl=117 time=13.9 ms

  --- google.com ping statistics ---
  4 packets transmitted, 4 received, 0% packet loss, time 3004ms
  rtt min/avg/max/mdev = 13.842/14.011/14.231/0.145 ms
  ```

---

### 2. `traceroute` (or `tracert` on Windows)
* **Purpose**: Maps the network path that packets take to reach a destination by incrementing the IP packet's Time-To-Live (TTL) field at each hop.
* **DevOps Use Case**: Pinpointing exactly which network router or internet gateway is dropping traffic or adding latency.
* **Command**:
  ```bash
  traceroute -m 10 google.com
  ```
* **Sample Output**:
  ```text
  traceroute to google.com (142.250.190.46), 10 hops max, 60 byte packets
   1  _gateway (192.168.1.1)  1.120 ms  1.082 ms  1.054 ms
   2  10.10.0.1 (10.10.0.1)  3.450 ms  3.412 ms  3.385 ms
   3  142.250.190.46 (142.250.190.46)  14.210 ms  14.180 ms  14.120 ms
  ```

---

### 3. `netstat`
* **Purpose**: Displays active network connections (TCP/UDP), listening ports, and routing table statistics.
* **DevOps Use Case**: Checking if a web server (e.g. Nginx on port 80 or Node on port 3000) is successfully bound and listening.
* **Command**:
  ```bash
  netstat -tuln
  ```
* **Sample Output**:
  ```text
  Active Internet connections (only servers)
  Proto Recv-Q Send-Q Local Address           Foreign Address         State      
  tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN     
  tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN     
  tcp        0      0 127.0.0.1:3000          0.0.0.0:*               LISTEN     
  tcp6       0      0 :::22                   :::*                    LISTEN     
  ```

---

### 4. `ss` (Socket Statistics)
* **Purpose**: A modern, significantly faster replacement for `netstat` that directly queries Linux kernel socket information.
* **DevOps Use Case**: High-traffic production servers where `netstat` causes performance overhead.
* **Command**:
  ```bash
  ss -tulpn
  ```
* **Sample Output**:
  ```text
  Netid  State   Recv-Q  Send-Q   Local Address:Port   Peer Address:Port  Process
  tcp    LISTEN  0       128            0.0.0.0:22          0.0.0.0:*      users:(("sshd",pid=1020,fd=3))
  tcp    LISTEN  0       511            0.0.0.0:80          0.0.0.0:*      users:(("nginx",pid=1452,fd=6))
  ```

---

### 5. `curl`
* **Purpose**: Versatile command-line tool for sending HTTP/HTTPS/FTP requests and receiving data from web endpoints.
* **DevOps Use Case**: Testing REST APIs, verifying HTTP response codes (200 OK, 301 Redirect, 404, 500), testing SSL handshakes (`curl -v`), and health checking endpoints.
* **Command**:
  ```bash
  curl -I https://www.google.com
  ```
* **Sample Output**:
  ```text
  HTTP/2 200 
  content-type: text/html; charset=ISO-8859-1
  server: gws
  date: Sun, 06 Sep 2026 22:16:00 GMT
  cache-control: private, max-age=0
  ```

---

### 6. `nslookup`
* **Purpose**: Performs DNS queries to resolve a domain name into its corresponding IP addresses (or vice versa with reverse DNS).
* **DevOps Use Case**: Verifying that newly updated DNS records have propagated to the configured nameserver.
* **Command**:
  ```bash
  nslookup github.com
  ```
* **Sample Output**:
  ```text
  Server:		127.0.0.53
  Address:	127.0.0.53#53

  Non-authoritative answer:
  Name:	github.com
  Address: 140.82.121.4
  ```

---

### 7. `dig` (Domain Information Groper)
* **Purpose**: Highly detailed and flexible DNS lookup utility that queries DNS servers directly and shows query times, TTLs, and authoritative response headers.
* **DevOps Use Case**: Troubleshooting deep DNS routing issues, testing specific DNS record types (A, AAAA, MX, CNAME, TXT).
* **Command**:
  ```bash
  dig github.com +short
  ```
* **Sample Output**:
  ```text
  140.82.121.4
  ```

---

### 8. `ip` (`ip addr` / `ip route`)
* **Purpose**: Modern standard for viewing and configuring IP addresses, network interfaces, and kernel routing tables (replaces legacy `ifconfig`).
* **DevOps Use Case**: Discovering the private IP of a host, Docker network bridge interfaces (`docker0`), and default gateway.
* **Command**:
  ```bash
  ip addr show
  ```
* **Sample Output**:
  ```text
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
      inet 127.0.0.1/8 scope host lo
  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP
      inet 192.168.1.150/24 brd 192.168.1.255 scope global eth0
  3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN
      inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
  ```

---

### 9. `lsof -i`
* **Purpose**: Lists all open network sockets and the corresponding process name, PID, and port.
* **DevOps Use Case**: Resolving `"port 80 already in use"` errors by finding the PID occupying the port.
* **Command**:
  ```bash
  sudo lsof -i :80
  ```
* **Sample Output**:
  ```text
  COMMAND   PID     USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
  nginx    1452     root    6u  IPv4  23412      0t0  TCP *:http (LISTEN)
  ```

---

### 10. `nc` (Netcat)
* **Purpose**: The "Swiss Army Knife" for networking; allows reading and writing raw data across network connections using TCP/UDP.
* **DevOps Use Case**: Testing if a remote port is open behind firewalls or security groups without downloading a full client (`nc -zv host port`).
* **Command**:
  ```bash
  nc -zv -w 3 github.com 443
  ```
* **Sample Output**:
  ```text
  Connection to github.com (140.82.121.4) 443 port [tcp/https] succeeded!
  ```

---

## 📸 Screenshots & Evidence
> *Paste your screenshots for each executed networking command below:*

### 1. `ping` Execution Output
`[PLACEHOLDER: Insert screenshot of ping -c 4 google.com]`

### 2. `netstat` / `ss` Listening Ports
`[PLACEHOLDER: Insert screenshot of netstat -tuln or ss -tulpn]`

### 3. `curl` HTTP Headers
`[PLACEHOLDER: Insert screenshot of curl -I https://google.com]`

### 4. `nslookup` / `dig` DNS Resolution
`[PLACEHOLDER: Insert screenshot of nslookup and dig commands]`

### 5. `ip addr` Network Interfaces
`[PLACEHOLDER: Insert screenshot of ip addr show or ifconfig]`
