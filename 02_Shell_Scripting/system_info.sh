#!/usr/bin/env bash
# ==============================================================================
# Script Name: system_info.sh
# Description: DevOps Homework - System Information & Process Logger Script
# Requirements Fulfilled:
#   - Prints current date
#   - Prints hostname
#   - Prints username
#   - Prints disk usage (df)
#   - Prints running processes (ps)
#   - Uses variables to store and use data
#   - Takes user input using read -p
#   - Creates a directory using mkdir
#   - Creates a file using touch
#   - Stores running processes info into the file using > output redirection
# ==============================================================================

# Exit immediately if a command exits with a non-zero status
set -e

# --- Colors for Clean Output ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}=====================================================${NC}"
echo -e "${GREEN}       DevOps System Information Reporter            ${NC}"
echo -e "${BLUE}=====================================================${NC}"

# --- 1. Variables to Store System Details ---
CURRENT_DATE=$(date)
SYSTEM_HOSTNAME=$(hostname)
CURRENT_USER=$(whoami)

# --- 2. Print System Info using Variables and Echo ---
echo -e "\n${YELLOW}[+] Gathering Basic System Details:${NC}"
echo -e "Current Date & Time : ${CYAN}${CURRENT_DATE}${NC}"
echo -e "System Hostname     : ${CYAN}${SYSTEM_HOSTNAME}${NC}"
echo -e "Current Logged User : ${CYAN}${CURRENT_USER}${NC}"

# --- 3. Disk Usage using df ---
echo -e "\n${YELLOW}[+] Current Filesystem Disk Usage (df -h):${NC}"
df -h

# --- 4. Running Processes using ps ---
echo -e "\n${YELLOW}[+] Running Processes Snapshot (Top 10):${NC}"
ps aux | head -n 11

# --- 5. Interactive User Input using read -p ---
echo -e "\n${YELLOW}[+] Process Logging Configuration:${NC}"
read -p "Enter destination directory name to create (e.g. system_logs): " DIR_NAME
read -p "Enter log filename to create (e.g. running_processes.txt): " FILE_NAME

# Fallbacks if user hits enter without typing
if [ -z "$DIR_NAME" ]; then
    DIR_NAME="system_logs"
fi
if [ -z "$FILE_NAME" ]; then
    FILE_NAME="running_processes.txt"
fi

TARGET_FILE="${DIR_NAME}/${FILE_NAME}"

# --- 6. Create Directory using mkdir ---
echo -e "\n${YELLOW}[+] Creating directory: ${DIR_NAME}${NC}"
mkdir -p "$DIR_NAME"

# --- 7. Create File using touch ---
echo -e "${YELLOW}[+] Creating file: ${TARGET_FILE}${NC}"
touch "$TARGET_FILE"

# --- 8. Output Redirection (>) to Store Process Information ---
echo -e "${YELLOW}[+] Redirecting running processes into ${TARGET_FILE}...${NC}"
ps aux > "$TARGET_FILE"

echo -e "\n${GREEN}✔ SUCCESS: Process list saved successfully!${NC}"
echo -e "File Location : ${TARGET_FILE}"
echo -e "File Size     : $(wc -l < "$TARGET_FILE") lines recorded."

echo -e "\n${BLUE}=====================================================${NC}"
echo -e "Preview of the first 5 lines saved in ${TARGET_FILE}:"
head -n 5 "$TARGET_FILE"
echo -e "${BLUE}=====================================================${NC}"
