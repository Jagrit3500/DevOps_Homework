# 🐧 Linux Fundamentals Homework

This document covers all tasks for the **Linux Fundamentals** homework, including interview questions, command syntax, step-by-step practice instructions, and a categorized Linux command cheat sheet.

---

## 📌 Task 1: Soft Link (Symbolic Link) vs Hard Link

### 1. Conceptual Difference

| Feature | Soft Link (Symbolic Link / Symlink) | Hard Link |
| :--- | :--- | :--- |
| **Definition** | A shortcut pointer containing the path to the original file. | An additional directory entry pointing directly to the same **inode** as the original file. |
| **Inode Number** | Has its **own unique inode**. | Shares the **exact same inode** as the target file. |
| **Filesystem Boundaries** | Can cross different filesystems / partitions. | **Cannot** cross filesystems; must reside on the same partition. |
| **Directory Linking** | Can link to directories and files. | Typically **cannot** link to directories (to prevent infinite loops). |
| **Original File Deletion** | If the original file is deleted, the symlink becomes a **broken / dangling link**. | If the original file is deleted, the data is **still accessible** through the hard link until all links are removed. |
| **Size** | Small (size equals the length of the path string). | Same size as the original file (they are the same underlying data). |
| **Creation Command** | `ln -s <target> <link_name>` | `ln <target> <link_name>` |

---

### 2. Commands & Practice Walkthrough

#### Step 1: Create a sample file
```bash
echo "DevOps Linux Homework - Original File" > original.txt
ls -l -i original.txt
```
*Note the first column output is the **inode number** (e.g., `14258932`).*

#### Step 2: Create a Hard Link
```bash
ln original.txt hardlink.txt
ls -l -i original.txt hardlink.txt
```
*Notice both files have the **same inode number** and the link counter increases to `2`.*

#### Step 3: Create a Soft Link (Symlink)
```bash
ln -s original.txt softlink.txt
ls -l -i original.txt softlink.txt
```
*Notice `softlink.txt` has a **different inode number**, shows an arrow `softlink.txt -> original.txt`, and has permission `lrwxrwxrwx`.*

#### Step 4: Verify Deletion Behavior
```bash
# Delete original file
rm original.txt

# Try reading both links:
cat hardlink.txt
# Output: DevOps Linux Homework - Original File (Still works!)

cat softlink.txt
# Output: cat: softlink.txt: No such file or directory (Dangling symlink!)
```

#### Step 5: Clean Up
```bash
rm hardlink.txt softlink.txt
```

---

### 3. Interview Preparation Q&A

**Q1: What is an Inode in Linux?**
> **Answer:** An inode (index node) is a data structure on a Unix filesystem that stores all metadata about a file (file size, permissions, owner, timestamps, location of data blocks on disk) *except* its filename and file content.

**Q2: What happens when you delete a file with multiple hard links?**
> **Answer:** The file data is not removed from the disk immediately. Deleting a hard link simply decrements the inode's link counter (`st_nlink`). The filesystem only frees the data blocks when the link count reaches `0` AND no process has an open file descriptor pointing to it.

**Q3: Why can't hard links span across different filesystems?**
> **Answer:** Inode numbers are only unique within a single filesystem / partition. Across different partitions, inode `1045` on partition A points to a completely different file than inode `1045` on partition B. Therefore, hard links are restricted to a single filesystem.

---

## 📌 Task 2: `adduser` vs `useradd`

### 1. Key Differences

| Property | `useradd` | `adduser` |
| :--- | :--- | :--- |
| **Type** | Low-level native system binary (C executable). | High-level Perl script wrapper around `useradd`. |
| **Interaction** | Non-interactive by default. Requires explicit flags for creating home dir, shell, etc. | Interactive by default. Prompts for password, full name, room number, phone, and confirmation. |
| **Home Directory** | Does NOT create `/home/<username>` by default (unless `-m` flag is passed). | Automatically creates home directory and copies skeleton files (`/etc/skel`). |
| **Default Shell** | Often defaults to `/bin/sh` or `/bin/false` depending on OS defaults. | Defaults to standard user shell (e.g. `/bin/bash`). |
| **System Compatibility** | Universal across all Linux distributions (RHEL, CentOS, Debian, Alpine, Arch). | Standard on Debian/Ubuntu; may not exist or may behave differently on Red Hat/CentOS. |

### 2. Which command is preferred on Ubuntu/Debian and why?
> **Preferred Command:** `adduser` is generally preferred for interactive human administration on Ubuntu/Debian because:
> 1. It is user-friendly, guiding the admin through password creation and user info.
> 2. It sets up security best practices automatically (correct home folder permissions `750` or `755`, skeleton files `.bashrc`, `.profile`).
> 3. For automated CI/CD and provisioning scripts (Ansible, Docker, Terraform), `useradd -m -s /bin/bash <username>` is preferred because it runs non-interactively without user prompts.

### 3. Hands-on Practice: Creating a Test User
```bash
# Using the recommended interactive command on Ubuntu:
sudo adduser devops_user

# To verify user creation:
id devops_user
grep devops_user /etc/passwd
ls -la /home/devops_user

# (Optional Cleanup)
sudo deluser --remove-home devops_user
```

---

## 📌 Task 3: `journalctl` (Systemd Log Viewer)

### 1. What is `journalctl`?
`journalctl` is the command-line utility for querying and inspecting logs generated by the `systemd-journald` service. It consolidates kernel logs, system boot messages, syslog entries, and daemon/service standard output/error into a single, indexed, binary journal.

### 2. Essential `journalctl` Commands

```bash
# 1. View all logs (paginated)
journalctl

# 2. View logs in reverse order (most recent first)
journalctl -r

# 3. View live logs in real-time (like tail -f)
journalctl -f

# 4. Filter logs for a specific service (e.g. nginx, ssh, docker)
journalctl -u docker.service
journalctl -u nginx.service -f

# 5. View logs since the current system boot
journalctl -b

# 6. View logs for a specific timeframe
journalctl --since "2026-09-01 00:00:00" --until "2026-09-06 23:59:59"
journalctl --since "1 hour ago"

# 7. Filter by priority / log severity (emerg, alert, crit, err, warning, notice, info, debug)
journalctl -p err -b

# 8. Check disk space used by system logs
journalctl --disk-usage

# 9. Clean logs older than 7 days
sudo journalctl --vacuum-time=7d
```

### 3. Hands-on Practice: Inspecting SSH / Docker Service Logs
```bash
# Check status and logs for ssh or systemd
journalctl -u ssh -n 20 --no-pager
```

---

## 📌 Task 4: Linux Command Cheat Sheet

### 1. File & Directory Management
| Command | Description | Example |
| :--- | :--- | :--- |
| `ls -lah` | List files in human-readable format including hidden files | `ls -lah /var/log` |
| `pwd` | Print current working directory | `pwd` |
| `cd <path>` | Change directory | `cd /etc/nginx` |
| `mkdir -p` | Create parent and child directories simultaneously | `mkdir -p /tmp/devops/logs` |
| `touch <file>` | Create an empty file or update its timestamp | `touch app.log` |
| `cp -r <src> <dest>` | Recursively copy files and directories | `cp -r ./src ./backup` |
| `mv <src> <dest>` | Move or rename files/directories | `mv old.txt new.txt` |
| `rm -rf <path>` | Forcefully and recursively remove files/folders | `rm -rf ./temp_dir` |
| `cat <file>` | Display entire file content | `cat /etc/os-release` |
| `head -n <N>` / `tail -n <N>` | View first/last N lines of a file | `tail -n 50 /var/log/syslog` |
| `grep -rn <text> <dir>` | Search for string recursively with line numbers | `grep -rn "ERROR" /var/log/` |
| `find <dir> -name <name>` | Search files by name | `find / -name "*.conf" 2>/dev/null` |

### 2. Permissions & Ownership
| Command | Description | Example |
| :--- | :--- | :--- |
| `chmod <mode> <file>` | Change file permissions (octal or symbolic) | `chmod 755 script.sh` / `chmod +x run.sh` |
| `chown <user>:<group>` | Change owner and group of a file | `chown -R ubuntu:ubuntu /var/www` |

### 3. System & Hardware Monitoring
| Command | Description | Example |
| :--- | :--- | :--- |
| `uname -a` | Print kernel release and system architecture | `uname -a` |
| `hostname` | Show or set the system hostname | `hostname` |
| `uptime` | System run time and load averages (1, 5, 15 min) | `uptime` |
| `df -h` | Show filesystem disk space in human-readable units | `df -h` |
| `du -sh <dir>` | Calculate total disk space consumed by directory | `du -sh /var/lib/docker` |
| `free -m` | Display free and used memory in Megabytes | `free -m` |

### 4. Process Management
| Command | Description | Example |
| :--- | :--- | :--- |
| `ps aux` | View all active processes with user and PID | `ps aux \| grep nginx` |
| `top` / `htop` | Interactive real-time process monitor | `top` |
| `kill -9 <PID>` | Force kill a process by Process ID | `kill -9 1234` |
| `killall <name>` | Terminate all processes by process name | `killall node` |
| `systemctl status <svc>`| Check status of a system service | `systemctl status nginx` |

---

## 📸 Screenshots & Evidence
> *Paste your command execution screenshots below:*

### Task 1: Soft Link vs Hard Link Output
`[PLACEHOLDER: Insert screenshot showing ln, ln -s, ls -li, and rm behavior]`

### Task 2: adduser Command Execution
`[PLACEHOLDER: Insert screenshot showing sudo adduser devops_user output]`

### Task 3: journalctl Service Log Output
`[PLACEHOLDER: Insert screenshot showing journalctl -u <service> output]`
