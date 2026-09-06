#!/usr/bin/env bash
# ==============================================================================
# Script: setup_cherry_pick_demo.sh
# Purpose: Creates a temporary Git repo and executes the complete cherry-pick flow
# ==============================================================================

set -e

DEMO_DIR="/tmp/git_cherry_pick_demo"
rm -rf "$DEMO_DIR"
mkdir -p "$DEMO_DIR"
cd "$DEMO_DIR"

echo "=== 1. Initializing Repository & Main Branch ==="
git init -b main
git config user.name "DevOps Student"
git config user.email "student@devops.local"

echo "Commit 1" > main_app.txt && git add . && git commit -m "Commit 1 on main"
echo "Commit 2" >> main_app.txt && git add . && git commit -m "Commit 2 on main"
echo "Commit 3" >> main_app.txt && git add . && git commit -m "Commit 3 on main"

echo -e "\nInitial commits on main:"
git log --oneline

echo -e "\n=== 2. Creating Feature Branch and Adding Commits ==="
git checkout -b feature-updates
echo "Feature Commit 1" > feature1.txt && git add . && git commit -m "feat: first feature commit"
echo "URGENT FIX TO CHERRY PICK" > urgent_fix.txt && git add . && git commit -m "fix: urgent security patch"
TARGET_HASH=$(git rev-parse HEAD)
echo "Feature Commit 3" > feature3.txt && git add . && git commit -m "feat: third feature commit"

echo -e "\nCommits on feature-updates branch:"
git log --oneline -n 4

echo -e "\n=== 3. Switching back to main and Cherry-Picking commit: $TARGET_HASH ==="
git checkout main
git cherry-pick "$TARGET_HASH"

echo -e "\n=== 4. Verification on Main Branch ==="
echo "Git log on main after cherry-pick:"
git log --oneline -n 4

echo -e "\nFile 'urgent_fix.txt' content on main:"
cat urgent_fix.txt

echo -e "\nCherry-pick demo executed successfully in $DEMO_DIR!"
