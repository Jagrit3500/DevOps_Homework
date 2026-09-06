# 🐙 Git & GitHub Homework Tasks

## Overview
This document contains the theory, practical demonstration, command outputs, and screenshot guides for **Task 1: `git commit -a -m` vs `git commit -m`** and **Task 2: Git Cherry-Pick**.

---

## 📌 Task 1: `git commit -a -m` vs `git commit -m`

### 1. Conceptual Difference

| Command | Behavior on Tracked Files (Modified/Deleted) | Behavior on Untracked Files (Newly Created) | Equivalent Longhand Commands |
| :--- | :--- | :--- | :--- |
| **`git commit -m "msg"`** | Only commits files that have been **explicitly staged** using `git add`. | Ignores newly created files unless `git add` was run first. | Requires `git add <files>` first, then `git commit -m "msg"`. |
| **`git commit -a -m "msg"`** | Automatically stages **all modified and deleted tracked files** and commits them immediately. | **Does NOT stage or commit untracked (new) files**! | `git add -u` followed by `git commit -m "msg"`. |

### 2. Practical Experiment & Observation

```bash
# 1. Initialize a test repository
mkdir -p /tmp/git_test && cd /tmp/git_test
git init

# 2. Create and commit an initial tracked file
echo "Version 1" > file1.txt
git add file1.txt
git commit -m "Initial commit"

# 3. Test 1: Modify existing file and use git commit -m (WITHOUT git add)
echo "Version 2" >> file1.txt
git commit -m "Attempt commit without -a"
# Output:
# On branch main
# Changes not staged for commit:
#   modified:   file1.txt
# no changes added to commit (use "git add" to track)
# -> Result: Commit failed because changes were not staged!

# 4. Test 2: Modify existing file and use git commit -a -m
git commit -a -m "Commit modified file using -a -m"
# Output:
# [main 3a4f1bc] Commit modified file using -a -m
#  1 file changed, 1 insertion(+)
# -> Result: Commit succeeded without needing an explicit `git add`!

# 5. Test 3: Create a brand NEW file and test git commit -a -m
echo "Brand new file" > file2.txt
git commit -a -m "Attempting to commit new file"
# Output:
# On branch main
# Untracked files:
#   file2.txt
# nothing added to commit but untracked files present
# -> Result: git commit -a -m CANNOT commit brand new untracked files. You MUST use git add first!
```

---

## 📌 Task 2: Git Cherry-Pick Walkthrough

Cherry-picking in Git allows you to choose an individual commit from any branch and apply its changes onto your current working branch without merging the whole branch.

### Step-by-Step Hands-on Workflow

#### Step 1: Create commits in `main` branch
```bash
git checkout -b main
echo "Main Feature 1" > app.txt && git add app.txt && git commit -m "feat(main): add main feature 1"
echo "Main Feature 2" >> app.txt && git add app.txt && git commit -m "feat(main): add main feature 2"
echo "Main Feature 3" >> app.txt && git add app.txt && git commit -m "feat(main): add main feature 3"

# View the initial commits on main:
git log --oneline
```
*Sample Log Output:*
```text
c111111 (HEAD -> main) feat(main): add main feature 3
b222222 feat(main): add main feature 2
a333333 feat(main): add main feature 1
```

#### Step 2: Create a new branch and make commits
```bash
# Create and switch to new feature branch
git checkout -b feature-branch

# Create 3 distinct commits
echo "Feature work A" > feature_a.txt && git add feature_a.txt && git commit -m "feat(feature): add module A"
echo "CRITICAL HOTFIX NEEDED ON MAIN" > hotfix.txt && git add hotfix.txt && git commit -m "fix: critical security patch"
echo "Feature work B" > feature_b.txt && git add feature_b.txt && git commit -m "feat(feature): add module B"

# View commits on feature branch:
git log --oneline -n 5
```
*Sample Log Output:*
```text
f666666 (HEAD -> feature-branch) feat(feature): add module B
e555555 fix: critical security patch           <--- COMMIT TO CHERRY-PICK!
d444444 feat(feature): add module A
c111111 feat(main): add main feature 3
```

#### Step 3: Switch back to `main` and Cherry-Pick the specific commit
```bash
# Switch back to main
git checkout main

# Cherry-pick the specific hotfix commit hash (e.g. e555555)
git cherry-pick e555555
```
*Sample Output:*
```text
[main 7777777] fix: critical security patch
 Date: Sun Sep 6 22:20:00 2026
 1 file changed, 1 insertion(+)
 create mode 100644 hotfix.txt
```

#### Step 4: Verify the Selected Commit is on `main`
```bash
# 1. Check git log on main
git log --oneline -n 3
```
*Output:*
```text
7777777 (HEAD -> main) fix: critical security patch  <--- SUCCESSFULLY CHERRY-PICKED!
c111111 feat(main): add main feature 3
b222222 feat(main): add main feature 2
```

```bash
# 2. Verify file presence on main
cat hotfix.txt
# Output: CRITICAL HOTFIX NEEDED ON MAIN

# 3. Confirm feature_a.txt and feature_b.txt were NOT brought over (clean isolation)
ls -la feature_a.txt feature_b.txt
# Output: ls: cannot access 'feature_a.txt': No such file or directory
```

---

## 📸 Screenshots & Evidence
> *Paste your Git command execution screenshots below:*

### 1. `git commit -a -m` vs `git commit -m` Comparison
`[PLACEHOLDER: Insert screenshot showing failed commit -m on unstaged file, successful commit -a -m, and behavior with new untracked file]`

### 2. Git Log of `main` & `feature-branch`
`[PLACEHOLDER: Insert screenshot of git log --oneline showing both branches before cherry-pick]`

### 3. Git Cherry-Pick Execution & Verification
`[PLACEHOLDER: Insert screenshot showing git cherry-pick <hash> and git log on main confirming the applied commit]`
