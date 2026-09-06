#!/usr/bin/env bash
# ==============================================================================
# Script: practice_commands.sh
# Purpose: Hands-on demonstration of Linux Links, User Management & Journalctl
# ==============================================================================

set -e

echo "=== TASK 1: Soft Link & Hard Link Practice ==="
WORKDIR="/tmp/linux_practice"
mkdir -p "$WORKDIR"
cd "$WORKDIR"

echo "1. Creating original file..."
echo "Hello DevOps Engineer!" > original_sample.txt

echo "2. Creating Hard Link..."
ln original_sample.txt hardlink_sample.txt

echo "3. Creating Soft Link (Symbolic Link)..."
ln -s original_sample.txt softlink_sample.txt

echo "4. Comparing Inodes & Details:"
ls -l -i original_sample.txt hardlink_sample.txt softlink_sample.txt

echo -e "\n5. Testing file deletion..."
rm original_sample.txt

echo "Reading hard link (should still work):"
cat hardlink_sample.txt

echo "Checking soft link (broken link check):"
if [ -e softlink_sample.txt ]; then
    echo "Soft link valid"
else
    echo "Soft link is dangling / broken (Expected!)"
fi

# Cleanup
rm -f hardlink_sample.txt softlink_sample.txt
cd - > /dev/null
rm -rf "$WORKDIR"

echo -e "\n=== TASK 2: User Creation Practice (Ubuntu/Debian) ==="
echo "To interactively create a user: sudo adduser devops_user"
echo "To non-interactively create a user: sudo useradd -m -s /bin/bash devops_user"

echo -e "\n=== TASK 3: Journalctl Practice Commands ==="
echo "1. Last 10 lines of system logs:"
journalctl -n 10 --no-pager 2>/dev/null || echo "Run 'journalctl -n 10' on a systemd Linux host"

echo -e "\nLinux practice script finished successfully!"
