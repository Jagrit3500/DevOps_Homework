# 🚀 DevOps Comprehensive Homework Portfolio

Welcome to the complete **DevOps Homework** repository. This repository is organized into distinct, modular directories corresponding to each homework section, containing source code, Dockerfiles, automation scripts, test suites, and documentation with screenshots.

---

## 📂 Repository Directory Structure

```text
DevOps_Homework/
├── 01_Linux_Fundamentals/                     # Linux Links, Users, Journalctl & Cheat Sheet
│   ├── README.md                              # Theory, Interview Q&A, and Cheat Sheet
│   └── practice_commands.sh                   # Hands-on practice automation script
│
├── 02_Shell_Scripting/                        # System Information & Process Logger Script
│   ├── system_info.sh                         # Interactive Bash script (date, host, df, ps, variables, etc.)
│   └── README.md                              # Execution guide, command output & screenshot section
│
├── 03_Networking_Fundamentals/                # Networking commands, analysis & diagnostics
│   ├── README.md                              # Detailed command analysis (ping, traceroute, netstat, curl, etc.)
│   └── run_network_checks.sh                  # Quick networking check script
│
├── 04_Git_GitHub/                             # Git internals, commit workflows & cherry-pick
│   ├── README.md                              # git commit -a -m vs -m & Step-by-step cherry-pick guide
│   └── setup_cherry_pick_demo.sh              # Reproducible Cherry-Pick scenario demo script
│
├── 05_Docker_Fundamentals/                    # 6 Hello World Web Applications
│   ├── README.md                              # Multi-app reference, build/run commands & port mappings
│   ├── nodejs-app/                            # Node.js Hello World web app (Port 3000)
│   ├── python-app/                            # Python Flask Hello World web app (Port 5000)
│   ├── java-app/                              # Java lightweight HTTP server (Port 8080 -> 8082)
│   ├── Apache-app/                            # Apache HTTPD web server (Port 80 -> 8081)
│   ├── React-app/                             # React 18 Single Page App (Port 80 -> 8083)
│   └── nginx-app/                             # Nginx Web server (Port 80 -> 8084)
│
├── 06_Docker_MultiStage_Build/                # Multi-Stage Build and 8080 Deployment
│   ├── Dockerfile                             # Multi-stage Dockerfile serving on port 8080
│   ├── nginx.conf                             # Port 8080 server configuration
│   ├── src/index.html                         # "Hello World from Docker multi-stage build"
│   └── README.md                              # Student Info, docker ps verification & 3 deployed apps
│
├── 07_Docker_Networking_and_Volumes/          # Container Networking & Storage
│   ├── README.md                              # Topology, execution guide & verification
│   ├── task1_container_networking/            # 3 containers (Frontend, Backend, DB) & 3 networks
│   ├── task2_host_network/                    # Apache2 on host network mode
│   ├── task3_bind_mount/                      # Bind mount "Hello students" & live edit test
│   └── task4_overlay_network/                 # In-depth Docker Overlay Network research
│
└── README.md                                  # Master Hub & Navigation (This file)
```

---

## 🎯 Quick Navigation & Task Mapping

| Folder | Homework Topic | Key Files & Deliverables |
| :--- | :--- | :--- |
| **[01_Linux_Fundamentals](./01_Linux_Fundamentals/)** | Linux Core Concepts | Soft vs Hard links interview prep, `adduser` vs `useradd`, `journalctl`, Linux command cheat sheet. |
| **[02_Shell_Scripting](./02_Shell_Scripting/)** | System Information Script | `system_info.sh` satisfying all flags (`date`, `hostname`, `df`, `ps`, `read -p`, `mkdir`, `touch`, `>`). |
| **[03_Networking_Fundamentals](./03_Networking_Fundamentals/)** | Networking Diagnostics | `ping`, `traceroute`, `netstat`, `ss`, `curl`, `nslookup`, `dig`, `ip`, `lsof`, `nc`. |
| **[04_Git_GitHub](./04_Git_GitHub/)** | Git Workflows & Cherry-Pick | `git commit -a -m` vs `git commit -m` analysis and hands-on Git Cherry-Pick demo with commit graphs. |
| **[05_Docker_Fundamentals](./05_Docker_Fundamentals/)** | Containerized Web Apps | 6 Hello World apps: Node.js, Python, Java, Apache, React, and Nginx with Dockerfiles. |
| **[06_Docker_MultiStage_Build](./06_Docker_MultiStage_Build/)** | Multi-Stage Builds | Multi-stage Dockerfile on port 8080, student info document, and 3 app deployment architectures. |
| **[07_Docker_Networking_and_Volumes](./07_Docker_Networking_and_Volumes/)** | Networks & Volumes | 3-tier container networking, host network Apache, bind mount live editing, and overlay network study. |

---

## 📸 Taking and Uploading Screenshots

Every module's `README.md` includes dedicated **`[PLACEHOLDER: Insert screenshot ...]`** markers:

1. **Run the commands** in your terminal or view the webpages in your browser.
2. **Take a screenshot** on Windows using `Win + Shift + S` or the Snipping Tool.
3. **Save your screenshots** into an `images/` or `screenshots/` folder inside each module (or paste them directly if you use GitHub Web / Markdown editors).
4. Replace the placeholder text in the `.md` file with standard markdown image links:
   ```markdown
   ![Terminal Output](./screenshots/task1_output.png)
   ```

---

## 🚀 Pushing to a Public GitHub Repository

Follow these commands to push this entire homework to your personal GitHub account:

```bash
# 1. Open terminal inside DevOps_Homework
cd c:\Users\jagri\DevOps_Homework

# 2. Initialize git (if not already initialized)
git init -b main

# 3. Add all homework files and folders
git add .

# 4. Create initial commit
git commit -m "feat: complete devops homework portfolio (linux, shell, networking, git, docker)"

# 5. Create a new public repository on GitHub (e.g. named "DevOps_Homework")
# 6. Link your local repo to GitHub:
git remote add origin https://github.com/<your-username>/DevOps_Homework.git

# 7. Push to GitHub
git push -u origin main
```
