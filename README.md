# Vidya Samay - Smart Timetable Scheduler

Intelligent automated timetable scheduling system for educational institutions using constraint programming optimization.

## Project Name
**Vidya Samay** (विद्या समय) - Sanskrit for "Education Time" / "Knowledge Schedule"

## Features

- **Automated Scheduling** - AI-powered timetable generation using Google OR-Tools
- **Constraint Satisfaction** - No conflicts, room capacity validation, faculty availability
- **Multiple Options** - Generate 3 optimal timetable variants
- **Data Management** - Complete CRUD for classrooms, batches, subjects, faculty
- **Approval Workflow** - Review and approve/reject generated timetables
- **Real-time Validation** - Automatic conflict detection and resolution suggestions
- **Dashboard Analytics** - Statistics and insights
- **Secure Authentication** - JWT-based user authentication

## Tech Stack

### Backend
- **FastAPI** - Modern Python web framework
- **SQLite** - Lightweight database (no PostgreSQL required)
- **SQLAlchemy** - ORM
- **OR-Tools** - Google's constraint solver
- **JWT + Bcrypt** - Authentication & security

### Frontend
- **React 18** - UI library
- **Vite** - Build tool
- **React Router v6** - Routing
- **Axios** - HTTP client
- **CSS3** - Modern styling

## Prerequisites

Before starting, ensure you have:
- **Python 3.9+** installed ([Download Python](https://www.python.org/downloads/))
- **Node.js 16+** installed ([Download Node.js](https://nodejs.org/))
- **Git** (optional, for cloning)

## Installation & Setup

### Step 1: Install Backend Dependencies

Open PowerShell or Command Prompt and navigate to the backend folder:

```bash
cd Vidya-Samay-main/backend
```

Create a virtual environment:
```bash
python -m venv venv
```

Activate the virtual environment:

**Windows (PowerShell):**
```bash
.\venv\Scripts\Activate.ps1
```

**Windows (CMD):**
```bash
venv\Scripts\activate.bat
```

**Linux/Mac:**
```bash
source venv/bin/activate
```

Install required packages:
```bash
pip install -r requirements.txt
```

Initialize the database with sample data:
```bash
python init_db.py
```

### Step 2: Install Frontend Dependencies

Open a new terminal and navigate to the frontend folder:

```bash
cd Vidya-Samay-main/frontend
```

Install Node.js packages:
```bash
npm install
```

## Running the Application

### Option 1: Using Start Scripts (Recommended)

**Windows:**

Open two separate PowerShell/CMD windows:

**Terminal 1 - Backend:**
```bash
cd Vidya-Samay-main/backend
start.bat
```

**Terminal 2 - Frontend:**
```bash
cd Vidya-Samay-main/frontend
npm run dev
```

**Linux/Mac:**

Open two separate terminal windows:

**Terminal 1 - Backend:**
```bash
cd Vidya-Samay-main/backend
chmod +x start.sh
./start.sh
```

**Terminal 2 - Frontend:**
```bash
cd Vidya-Samay-main/frontend
npm run dev
```

### Option 2: Manual Start

**Backend (Terminal 1):**
```bash
cd Vidya-Samay-main/backend
.\venv\Scripts\Activate.ps1  # Windows
# source venv/bin/activate    # Linux/Mac
python -m uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

**Frontend (Terminal 2):**
```bash
cd Vidya-Samay-main/frontend
npm run dev
```

## Access the Application

Once both servers are running:

- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:8000
- **API Documentation**: http://localhost:8000/docs

### Default Login Credentials

```
Username: admin
Password: admin123
```

## Verify Installation

You should see:

**Backend Terminal:**
```
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
INFO:     Started reloader process
INFO:     Started server process
INFO:     Application startup complete.
```

**Frontend Terminal:**
```
VITE v5.4.21  ready in XXX ms
➜  Local:   http://localhost:5173/
➜  Network: use --host to expose
```

## Project Structure

```
college-timetable-scheduling/
├── backend/                    # FastAPI backend
│   ├── services/              # Business logic
│   │   ├── auth_service.py
│   │   └── data_service.py
│   ├── main.py                # API routes
│   ├── models.py              # Database models
│   ├── database.py            # DB config
│   ├── auth.py                # Auth utilities
│   ├── scheduler.py           # Timetable solver
│   ├── init_db.py             # DB initialization
│   ├── requirements.txt       # Dependencies
│   ├── start.bat              # Windows startup
│   ├── start.sh               # Linux/Mac startup
│   └── README.md              # Backend docs
│
├── frontend/                   # React frontend
│   ├── src/
│   │   ├── components/        # React components
│   │   │   ├── forms/        # Data entry forms
│   │   │   ├── Dashboard.jsx
│   │   │   ├── Login.jsx
│   │   │   └── ...
│   │   ├── context/          # React context
│   │   ├── services/         # API layer
│   │   ├── utils/            # Utilities
│   │   ├── App.jsx           # Main app
│   │   └── main.jsx          # Entry point
│   ├── package.json
│   ├── vite.config.js
│   └── README.md             # Frontend docs
│
└── README.md                  # This file
```

## Usage Guide

### 1. Login
- Open http://localhost:5173 in your browser
- Enter username: `admin` and password: `admin123`
- Click "Login"

### 2. Data Management
Navigate to **Data Management** page to add:

**Classrooms:**
- Name, capacity, type (Classroom/Lab)
- Location, building information

**Batches:**
- Batch name (e.g., CS-A, ME-B)
- Department, student count
- Year/semester information

**Subjects:**
- Subject code and name
- Hours per week required
- Department, lab requirements

**Faculty:**
- Name, employee ID
- Department, specialization
- Maximum hours per week
- Availability (days/times)

**Constraints:**
- Classes per day (min/max)
- Break duration
- Target utilization rate

### 3. Generate Timetable
1. Ensure you have added data (classrooms, batches, subjects, faculty)
2. Go to **Generate Timetable** page
3. Click "🚀 Generate Timetables" button
4. Wait 10-30 seconds for generation
5. System creates 3 optimal timetable options
6. Automatically redirected to view timetables

### 4. View Timetables
1. Go to **View Timetables** page
2. Select from 3 generated options
3. Switch between Grid View and List View
4. Filter by department or batch
5. Check utilization rate and conflicts
6. Export to PDF or Excel (if needed)

### 5. Approval Workflow
1. Go to **Approvals** page
2. Review pending timetables
3. Add comments if needed
4. Click "Approve" or "Reject"

## Sample Data

The system comes pre-loaded with sample data:
- **5 Classrooms** (CR-101 to CR-105)
- **3 Batches** (CS-A, CS-B, ME-A)
- **5 Subjects** (Data Structures, Algorithms, etc.)
- **10 Faculty Members**
- **40 Time Slots** (Monday-Friday, 9 AM - 6 PM with lunch break)

## API Documentation

Interactive API docs available at:
- **Swagger UI**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc

### Key Endpoints
```
POST   /api/login              # Authentication
GET    /api/classrooms         # List classrooms
POST   /api/classrooms         # Create classroom
GET    /api/batches            # List batches
POST   /api/generate           # Generate timetables
GET    /api/dashboard/stats    # Get statistics
```

## Configuration

### Backend (.env)
```bash
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/timetable_db
SECRET_KEY=your-secret-key-here
JWT_ALGORITHM=HS256
JWT_EXPIRATION_HOURS=24
```

### Frontend (.env)
```bash
VITE_API_URL=http://localhost:8000/api
```

## Database Schema

### Core Tables
- users, classrooms, batches, subjects, faculty
- time_slots, scheduling_constraints

### Timetable Tables
- timetable_options, timetable_entries
- approval_records, conflicts

## Security Features

- JWT token authentication
- Bcrypt password hashing
- Input validation (Pydantic)
- SQL injection prevention (ORM)
- CORS configuration
- Protected API endpoints

## Development

### Backend Development
```bash
cd backend
source venv/bin/activate
uvicorn main:app --reload
```

### Frontend Development
```bash
cd frontend
npm run dev
```

### Database Migrations
```bash
cd backend
alembic revision --autogenerate -m "description"
alembic upgrade head
```

## Troubleshooting

### Backend Issues

**Problem: "Python not found"**
- Solution: Install Python 3.9+ from https://www.python.org/downloads/
- Make sure to check "Add Python to PATH" during installation

**Problem: "pip not found"**
- Solution: Reinstall Python with "Add to PATH" option checked

**Problem: "Module not found" errors**
- Solution: Activate virtual environment and run `pip install -r requirements.txt`

**Problem: "Port 8000 already in use"**
- Solution: Kill the process using port 8000 or change port in start script

**Problem: "Database error"**
- Solution: Delete `timetable.db` and run `python init_db.py` again

### Frontend Issues

**Problem: "npm not found"**
- Solution: Install Node.js from https://nodejs.org/

**Problem: "CORS Error" or "Network Error"**
- Solution: Ensure backend is running on http://localhost:8000
- Check that both servers are running

**Problem: "401 Unauthorized"**
- Solution: Token expired, logout and login again

**Problem: "Port 5173 already in use"**
- Solution: Kill the process or Vite will automatically use next available port

**Problem: "Timetable generation timeout"**
- Solution: This is normal for complex schedules, wait up to 60 seconds
- If it fails, try reducing constraints or adding more resources

### Common Issues

**Problem: "Cannot login"**
- Solution: Ensure backend is running and database is initialized
- Try default credentials: admin / admin123

**Problem: "No data showing"**
- Solution: Initialize database with `python init_db.py` in backend folder

**Problem: "Timetable generation fails"**
- Solution: Ensure you have added classrooms, batches, subjects, and faculty
- Check that faculty departments match subject departments

## Production Deployment

### Backend
1. Change SECRET_KEY to strong random value
2. Use production database
3. Enable HTTPS
4. Configure logging
5. Set up monitoring

### Frontend
1. Build: `npm run build`
2. Serve `dist/` folder
3. Update API_URL to production backend
4. Configure CDN if needed

## Testing

### Manual Testing
- Use Swagger UI at /docs
- Test all CRUD operations
- Verify authentication flow
- Test timetable generation

### Automated Testing (Future)
- Unit tests for services
- Integration tests for APIs
- Component tests for React
- E2E tests for workflows

## Documentation

- **Backend**: See `backend/README.md`
- **Frontend**: See `frontend/README.md`
- **API**: http://localhost:8000/docs

## Support

For issues or questions:
1. Check documentation in respective README files
2. Review API documentation at /docs
3. Check server logs
4. Verify configuration files

## License

This project is for educational purposes.

## Contributors

Developed as a comprehensive timetable scheduling solution for educational institutions.
