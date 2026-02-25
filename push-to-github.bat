@echo off
echo ========================================
echo   Push Vidya Samay to GitHub
echo ========================================
echo.

REM Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git is not installed!
    echo.
    echo Please install Git first:
    echo https://git-scm.com/download/win
    echo.
    echo After installation, run this script again.
    pause
    exit /b 1
)

echo ✅ Git is installed
echo.

REM Check if already initialized
if exist ".git" (
    echo ℹ️  Git repository already initialized
) else (
    echo Initializing Git repository...
    git init
    echo ✅ Git initialized
)
echo.

REM Add all files
echo Adding files to Git...
git add .
echo ✅ Files added
echo.

REM Commit
echo Creating commit...
git commit -m "Initial commit - Vidya Samay Timetable Scheduler"
if errorlevel 1 (
    echo ℹ️  No changes to commit or already committed
) else (
    echo ✅ Commit created
)
echo.

REM Check if remote exists
git remote -v | findstr origin >nul 2>&1
if errorlevel 1 (
    echo Adding remote repository...
    git remote add origin https://github.com/King-Chainz/vidyasamay.git
    echo ✅ Remote added
) else (
    echo ℹ️  Remote already exists
)
echo.

REM Set branch to main
echo Setting branch to main...
git branch -M main
echo ✅ Branch set to main
echo.

REM Push to GitHub
echo Pushing to GitHub...
echo.
echo ⚠️  You may be asked to login to GitHub
echo    Use your GitHub username and password
echo.
git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ Push failed!
    echo.
    echo Common solutions:
    echo 1. Make sure you're logged into GitHub
    echo 2. Check your internet connection
    echo 3. Verify repository URL is correct
    echo 4. Try using GitHub Desktop instead
    echo.
    echo See PUSH_TO_GITHUB.md for detailed help
) else (
    echo.
    echo ========================================
    echo   ✅ Successfully pushed to GitHub!
    echo ========================================
    echo.
    echo Your code is now at:
    echo https://github.com/King-Chainz/vidyasamay
    echo.
    echo Next steps:
    echo 1. View your repo on GitHub
    echo 2. Deploy to Render (see DEPLOYMENT_QUICK_START.md)
    echo 3. Share with others
)

echo.
pause
