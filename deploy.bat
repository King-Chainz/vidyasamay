@echo off
REM Vidya Samay Deployment Script for Windows
REM Usage: deploy.bat [platform]
REM Platforms: docker, local

setlocal enabledelayedexpansion

set PLATFORM=%1
if "%PLATFORM%"=="" set PLATFORM=local

echo 🚀 Deploying Vidya Samay to %PLATFORM%...

if "%PLATFORM%"=="docker" goto docker
if "%PLATFORM%"=="local" goto local
goto unknown

:docker
echo 🐳 Building and running with Docker...

REM Check if Docker is installed
docker --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker is not installed. Please install Docker Desktop first.
    exit /b 1
)

REM Build and run
docker-compose down
docker-compose build
docker-compose up -d

echo ✅ Docker containers started
echo Frontend: http://localhost
echo Backend: http://localhost:8000
echo.
echo View logs: docker-compose logs -f
echo Stop: docker-compose down
goto end

:local
echo 💻 Deploying locally...

REM Backend
echo Setting up backend...
cd backend

if not exist "venv" (
    python -m venv venv
)

call venv\Scripts\activate.bat
pip install -r requirements.txt

if not exist "timetable.db" (
    python init_db.py
)

REM Start backend
start "Vidya Samay Backend" cmd /k "venv\Scripts\activate.bat && python -m uvicorn main:app --host 0.0.0.0 --port 8000"
cd ..

REM Wait a bit for backend to start
timeout /t 3 /nobreak >nul

REM Frontend
echo Setting up frontend...
cd frontend
call npm install
call npm run build

REM Serve frontend
echo Starting frontend server...
start "Vidya Samay Frontend" cmd /k "npx serve -s dist -l 80"
cd ..

echo ✅ Local deployment complete
echo Frontend: http://localhost
echo Backend: http://localhost:8000
echo.
echo Two command windows opened - close them to stop servers
goto end

:unknown
echo ❌ Unknown platform: %PLATFORM%
echo Usage: deploy.bat [docker^|local]
exit /b 1

:end
echo.
echo 🎉 Deployment process completed!
endlocal
