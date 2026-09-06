# Task 3: journalctl

`journalctl` reads logs made by `systemd`.

## Main Commands

```bash
# Show all logs.
journalctl

# Show logs from this boot.
journalctl -b

# Show the last 50 logs.
journalctl -n 50

# Follow new logs.
journalctl -f

# Show errors.
journalctl -p err

# Show logs for one service.
sudo journalctl -u ssh

# Show recent service logs.
sudo journalctl -u ssh --since today
```

On some Ubuntu systems, the service is named `sshd` instead of `ssh`:

```bash
sudo journalctl -u sshd
```


`journalctl` shows system and service logs. It can filter logs by boot, time,
level, or service.

## Note

On Windows or environments without systemd, run these commands inside Ubuntu/WSL or a Linux VM to see real systemd journal logs.

## Evidence

<!-- Save your screenshot as journalctl_screenshot.png -->
![Journal logs](journalctl_screenshot.png)
