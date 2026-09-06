# 📜 Shell Scripting Homework Task

## Task: System Information Script

This module contains a production-ready bash script (`system_info.sh`) that collects core Linux system statistics, receives interactive user input, manages directories and files, and saves active process states.

---

## 🎯 Requirements & Commands Checklist

| Requirement | Implementation in `system_info.sh` | Status |
| :--- | :--- | :--- |
| **Prints the current date** | `CURRENT_DATE=$(date); echo $CURRENT_DATE` | ✅ Complete |
| **Prints the hostname** | `SYSTEM_HOSTNAME=$(hostname); echo $SYSTEM_HOSTNAME` | ✅ Complete |
| **Prints the username** | `CURRENT_USER=$(whoami); echo $CURRENT_USER` | ✅ Complete |
| **Prints disk usage** | `df -h` | ✅ Complete |
| **Prints running processes** | `ps aux` | ✅ Complete |
| **Uses variables to store & use data** | `$CURRENT_DATE`, `$SYSTEM_HOSTNAME`, `$CURRENT_USER`, `$TARGET_FILE` | ✅ Complete |
| **Takes user input using `read -p`** | `read -p "Enter destination directory name..." DIR_NAME` | ✅ Complete |
| **Creates directory using `mkdir`** | `mkdir -p "$DIR_NAME"` | ✅ Complete |
| **Creates file using `touch`** | `touch "$TARGET_FILE"` | ✅ Complete |
| **Stores running processes using `>` redirection** | `ps aux > "$TARGET_FILE"` | ✅ Complete |

---

## 🚀 How to Execute the Script

1. **Make the script executable:**
   ```bash
   chmod +x system_info.sh
   ```

2. **Run the script:**
   ```bash
   ./system_info.sh
   ```

---

## 💻 Sample Command Output

```text
=====================================================
       DevOps System Information Reporter            
=====================================================

[+] Gathering Basic System Details:
Current Date & Time : Sun Sep  6 22:15:00 UTC 2026
System Hostname     : devops-node-01
Current Logged User : ubuntu

[+] Current Filesystem Disk Usage (df -h):
Filesystem      Size  Used Avail Use% Mounted on
udev            3.9G     0  3.9G   0% /dev
tmpfs           796M  1.4M  795M   1% /run
/dev/sda1        49G   14G   33G  30% /
tmpfs           3.9G     0  3.9G   0% /dev/shm

[+] Running Processes Snapshot (Top 10):
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.1 168600 13124 ?        Ss   18:20   0:02 /sbin/init
root           2  0.0  0.0      0     0 ?        S    18:20   0:00 [kthreadd]
root         723  0.0  0.3  23840  7240 ?        Ss   18:20   0:00 /lib/systemd/systemd-journald
root         750  0.0  0.2  16840  4900 ?        Ss   18:20   0:00 /lib/systemd/systemd-udevd
systemd+     812  0.0  0.4  25340 12040 ?        Ss   18:20   0:00 /lib/systemd/systemd-resolved
root        1020  0.0  0.3  15420  6140 ?        Ss   18:20   0:00 /usr/sbin/sshd -D
ubuntu      1450  0.0  0.2   9840  4320 pts/0    Ss   19:00   0:00 -bash

[+] Process Logging Configuration:
Enter destination directory name to create (e.g. system_logs): my_logs
Enter log filename to create (e.g. running_processes.txt): active_processes.txt

[+] Creating directory: my_logs
[+] Creating file: my_logs/active_processes.txt
[+] Redirecting running processes into my_logs/active_processes.txt...

✔ SUCCESS: Process list saved successfully!
File Location : my_logs/active_processes.txt
File Size     : 85 lines recorded.

=====================================================
Preview of the first 5 lines saved in my_logs/active_processes.txt:
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.1 168600 13124 ?        Ss   18:20   0:02 /sbin/init
root           2  0.0  0.0      0     0 ?        S    18:20   0:00 [kthreadd]
root         723  0.0  0.3  23840  7240 ?        Ss   18:20   0:00 /lib/systemd/systemd-journald
root         750  0.0  0.2  16840  4900 ?        Ss   18:20   0:00 /lib/systemd/systemd-udevd
=====================================================
```

---

## 📸 Screenshots & Evidence
> *Paste your screenshot showing execution of `system_info.sh` below:*

`[PLACEHOLDER: Insert terminal screenshot of running ./system_info.sh with directory creation and output file preview]`
