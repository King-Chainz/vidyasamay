# Push to GitHub Guide

Step-by-step instructions to push Vidya Samay to your GitHub repository.

## Your GitHub Repository
**URL:** https://github.com/King-Chainz/vidyasamay.git

---

## Step 1: Install Git (if not installed)

### Check if Git is installed:
```bash
git --version
```

### If not installed, download Git:
- **Windows:** https://git-scm.com/download/win
- **Mac:** https://git-scm.com/download/mac
- **Linux:** `sudo apt install git` or `sudo yum install git`

After installation, restart your terminal/PowerShell.

---

## Step 2: Configure Git (First Time Only)

Open PowerShell or Command Prompt and run:

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

Replace with your actual name and email (use the email from your GitHub account).

---

## Step 3: Initialize Git Repository

Navigate to your project folder:

```bash
cd Vidya-Samay-main
```

Initialize Git:

```bash
git init
```

---

## Step 4: Add All Files

Add all project files to Git:

```bash
git add .
```

This stages all files for commit.

---

## Step 5: Create First Commit

Commit your files:

```bash
git commit -m "Initial commit - Vidya Samay Timetable Scheduler"
```

---

## Step 6: Add Remote Repository

Connect to your GitHub repository:

```bash
git remote add origin https://github.com/King-Chainz/vidyasamay.git
```

---

## Step 7: Set Main Branch

Rename branch to main (if needed):

```bash
git branch -M main
```

---

## Step 8: Push to GitHub

Push your code to GitHub:

```bash
git push -u origin main
```

**Note:** You may be asked to login to GitHub. Use your GitHub username and password (or Personal Access Token).

---

## Complete Command Sequence

Copy and paste these commands one by one:

```bash
# Navigate to project
cd Vidya-Samay-main

# Initialize Git
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - Vidya Samay Timetable Scheduler"

# Add remote
git remote add origin https://github.com/King-Chainz/vidyasamay.git

# Set branch to main
git branch -M main

# Push to GitHub
git push -u origin main
```

---

## Troubleshooting

### Problem: "git: command not found"
**Solution:** Install Git from https://git-scm.com/downloads

### Problem: "Permission denied"
**Solution:** You need to authenticate with GitHub

**Option 1: Use GitHub Desktop**
1. Download GitHub Desktop: https://desktop.github.com/
2. Sign in with your GitHub account
3. Add your local repository
4. Publish to GitHub

**Option 2: Use Personal Access Token**
1. Go to GitHub → Settings → Developer settings → Personal access tokens
2. Generate new token (classic)
3. Select scopes: `repo` (all)
4. Copy the token
5. When pushing, use token as password

### Problem: "Repository already exists"
**Solution:** Your repo already exists on GitHub

If it's empty, just push:
```bash
git push -u origin main
```

If it has files, you may need to pull first:
```bash
git pull origin main --allow-unrelated-histories
git push -u origin main
```

### Problem: "fatal: refusing to merge unrelated histories"
**Solution:**
```bash
git pull origin main --allow-unrelated-histories
git push -u origin main
```

---

## After Pushing Successfully

Once pushed, you can:

1. **View on GitHub:** https://github.com/King-Chainz/vidyasamay

2. **Deploy to Render:**
   - Go to https://render.com
   - Sign up/Login
   - Click "New Blueprint"
   - Connect your GitHub repo
   - Render will auto-deploy using `render.yaml`

3. **Deploy to Vercel (Frontend):**
   ```bash
   cd frontend
   npm install -g vercel
   vercel --prod
   ```

4. **Clone on another machine:**
   ```bash
   git clone https://github.com/King-Chainz/vidyasamay.git
   ```

---

## Future Updates

After making changes, push updates:

```bash
# Add changed files
git add .

# Commit changes
git commit -m "Description of changes"

# Push to GitHub
git push origin main
```

---

## Quick Reference

```bash
# Check status
git status

# View commit history
git log

# View remote URL
git remote -v

# Pull latest changes
git pull origin main

# Push changes
git push origin main
```

---

## Alternative: Use GitHub Desktop

If you prefer a GUI:

1. Download **GitHub Desktop**: https://desktop.github.com/
2. Install and sign in
3. Click "Add" → "Add Existing Repository"
4. Select your `Vidya-Samay-main` folder
5. Click "Publish repository"
6. Choose repository name: `vidyasamay`
7. Click "Publish repository"

Done! Much easier with GUI.

---

## Files That Will Be Pushed

Your repository will include:
- ✅ Backend (Python/FastAPI)
- ✅ Frontend (React/Vite)
- ✅ All deployment files
- ✅ Documentation (README, guides)
- ✅ Configuration files
- ❌ node_modules (excluded by .gitignore)
- ❌ venv (excluded by .gitignore)
- ❌ Database file (excluded by .gitignore)

---

## Security Note

Before pushing, ensure:
- ✅ No passwords in code
- ✅ No API keys exposed
- ✅ `.env` files are in `.gitignore`
- ✅ Database files excluded

Your project is already configured correctly! ✅

---

**Ready to push?** Follow the steps above! 🚀

**Need help?** Use GitHub Desktop for easier process.
