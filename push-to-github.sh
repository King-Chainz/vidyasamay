#!/bin/bash

echo "========================================"
echo "  Push Vidya Samay to GitHub"
echo "========================================"
echo ""

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed!"
    echo ""
    echo "Please install Git first:"
    echo "https://git-scm.com/downloads"
    echo ""
    exit 1
fi

echo "✅ Git is installed"
echo ""

# Check if already initialized
if [ -d ".git" ]; then
    echo "ℹ️  Git repository already initialized"
else
    echo "Initializing Git repository..."
    git init
    echo "✅ Git initialized"
fi
echo ""

# Add all files
echo "Adding files to Git..."
git add .
echo "✅ Files added"
echo ""

# Commit
echo "Creating commit..."
if git commit -m "Initial commit - Vidya Samay Timetable Scheduler"; then
    echo "✅ Commit created"
else
    echo "ℹ️  No changes to commit or already committed"
fi
echo ""

# Check if remote exists
if git remote -v | grep -q origin; then
    echo "ℹ️  Remote already exists"
else
    echo "Adding remote repository..."
    git remote add origin https://github.com/King-Chainz/vidyasamay.git
    echo "✅ Remote added"
fi
echo ""

# Set branch to main
echo "Setting branch to main..."
git branch -M main
echo "✅ Branch set to main"
echo ""

# Push to GitHub
echo "Pushing to GitHub..."
echo ""
echo "⚠️  You may be asked to login to GitHub"
echo "   Use your GitHub username and password"
echo ""

if git push -u origin main; then
    echo ""
    echo "========================================"
    echo "  ✅ Successfully pushed to GitHub!"
    echo "========================================"
    echo ""
    echo "Your code is now at:"
    echo "https://github.com/King-Chainz/vidyasamay"
    echo ""
    echo "Next steps:"
    echo "1. View your repo on GitHub"
    echo "2. Deploy to Render (see DEPLOYMENT_QUICK_START.md)"
    echo "3. Share with others"
else
    echo ""
    echo "❌ Push failed!"
    echo ""
    echo "Common solutions:"
    echo "1. Make sure you're logged into GitHub"
    echo "2. Check your internet connection"
    echo "3. Verify repository URL is correct"
    echo "4. Try using GitHub Desktop instead"
    echo ""
    echo "See PUSH_TO_GITHUB.md for detailed help"
fi

echo ""
