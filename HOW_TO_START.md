# How to Start Vidya Samay

Complete step-by-step guide to run the Vidya Samay Timetable Scheduler.

## Prerequisites

Before starting, ensure you have installed:

1. **Python 3.9 or higher**
   - Download from: https://www.python.org/downloads/
   - During installation, check "Add Python to PATH"

2. **Node.js 16 or higher**
   - Download from: https://nodejs.org/
   - This includes npm (Node Package Manager)

3. **Git** (optional)
   - Only needed if cloning from repository

## Step-by-Step Installation

### Step 1: Setup Backend

Open PowerShell or Command Prompt:

```bash
# Navigate to backend folder
cd Vidya-Samay-main/backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# For Windows PowerShell:
.\venv\Scripts\Activate.ps1

# For Windows CMD:
venv\Scripts\activate.bat

# For Linux/Mac:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Initialize database with sample data
python init_db.py
```

You should see output like:
```
Database initialized successfully!
Created admin user: admin / admin123
Created 40 time slots
Created 5 classrooms
Created 3 batches
Created 5 subjects
Created 10 faculty members
```

### Step 2: Setup Frontend

Open a NEW terminal window:

```bash
# Navigate to frontend folder
cd Vidya-Samay-main/frontend

# Install dependencies
npm install
```

Wait for installation to complete (may take 1-2 minutes).

## Running the Application

You need TWO terminal windows running simultaneously.

### Terminal 1: Start Backend

```bash
cd Vidya-Samay-main/backend

# Windows:
start.bat

# Linux/Mac:
chmod +x start.sh
./start.sh
```

You should see:
```
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
INFO:     Started reloader process
INFO:     Application startup complete.
```

### Terminal 2: Start Frontend

```bash
cd Vidya-Samay-main/frontend
npm run dev
```

You should see:
```
VITE v5.4.21  ready in XXX ms
➜  Local:   http://localhost:5173/
➜  Network: use --host to expose
```

## Access the Application

Open your web browser and go to:

**http://localhost:5173**

### Login Credentials

```
Username: admin
Password: admin123
```

## Verify Everything is Working

1. **Backend Health Check**
   - Open: http://localhost:8000/api/health
   - Should show: `{"status":"ok","timestamp":"...","version":"1.0.0"}`

2. **API Documentation**
   - Open: http://localhost:8000/docs
   - Should show interactive Swagger UI

3. **Frontend**
   - Open: http://localhost:5173
   - Should show login page

## Quick Start Guide

After logging in:

1. **View Dashboard**
   - See statistics and overview

2. **Manage Data**
   - Go to "Data Management"
   - Sample data is already loaded:
     - 5 Classrooms
     - 3 Batches (CS-A, CS-B, ME-A)
     - 5 Subjects
     - 10 Faculty members

3. **Generate Timetable**
   - Go to "Generate Timetable"
   - Click "🚀 Generate Timetables"
   - Wait 10-30 seconds
   - View 3 generated options

4. **View Timetables**
   - Go to "View Timetables"
   - Switch between Grid and List view
   - Compare different options

## Stopping the Application

To stop the servers:

1. In each terminal window, press `Ctrl + C`
2. Close the terminal windows

## Troubleshooting

### Backend Won't Start

**Problem: "Python not found"**
```bash
# Solution: Install Python and add to PATH
# Verify installation:
python --version
```

**Problem: "pip not found"**
```bash
# Solution: Reinstall Python with "Add to PATH" checked
```

**Problem: "Module not found"**
```bash
# Solution: Activate venv and reinstall
cd backend
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

**Problem: "Port 8000 already in use"**
```bash
# Solution: Kill existing process or change port
# Windows: netstat -ano | findstr :8000
# Then: taskkill /PID <process_id> /F
```

### Frontend Won't Start

**Problem: "npm not found"**
```bash
# Solution: Install Node.js from nodejs.org
# Verify installation:
node --version
npm --version
```

**Problem: "EACCES permission error"**
```bash
# Solution: Run as administrator or fix npm permissions
```

**Problem: "Port 5173 already in use"**
```bash
# Solution: Vite will automatically use next available port
# Or kill the process using port 5173
```

### Application Issues

**Problem: "Cannot login"**
- Ensure backend is running (check http://localhost:8000/api/health)
- Use correct credentials: admin / admin123
- Check browser console for errors

**Problem: "Network Error" when generating timetable**
- This is normal - generation takes 10-30 seconds
- Wait for completion
- If timeout, check backend terminal for errors

**Problem: "No data showing"**
```bash
# Solution: Reinitialize database
cd backend
.\venv\Scripts\Activate.ps1
python init_db.py
```

## Manual Start (Alternative Method)

If start scripts don't work, use manual commands:

**Backend:**
```bash
cd Vidya-Samay-main/backend
.\venv\Scripts\Activate.ps1
python -m uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

**Frontend:**
```bash
cd Vidya-Samay-main/frontend
npm run dev
```

## Next Steps

- Read the main README.md for detailed features
- Explore API documentation at http://localhost:8000/docs
- Add your own data in Data Management
- Generate custom timetables
- Review and approve timetables

## Support

If you encounter issues:
1. Check this troubleshooting guide
2. Verify both servers are running
3. Check terminal output for error messages
4. Ensure all prerequisites are installed correctly

## Summary

**Quick Commands:**

```bash
# Terminal 1 - Backend
cd Vidya-Samay-main/backend
start.bat  # or ./start.sh on Linux/Mac

# Terminal 2 - Frontend
cd Vidya-Samay-main/frontend
npm run dev

# Open browser
http://localhost:5173
```

**Login:** admin / admin123

That's it! You're ready to use Vidya Samay! 🎉
