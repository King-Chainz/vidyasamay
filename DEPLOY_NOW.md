# Deploy Vidya Samay - Step by Step

Your code is now on GitHub: https://github.com/King-Chainz/vidyasamay

## OPTION 1: Deploy to Render (FREE & LIVE ON INTERNET) ⭐ RECOMMENDED

**Time: 10 minutes | Cost: FREE**

### Step 1: Go to Render
1. Open browser: https://render.com
2. Click "Get Started for Free"
3. Sign up with GitHub account

### Step 2: Deploy Using Blueprint
1. Click "New +" button (top right)
2. Select "Blueprint"
3. Connect your GitHub account (if not connected)
4. Select repository: `King-Chainz/vidyasamay`
5. Click "Apply"

### Step 3: Wait for Deployment
- Render will automatically read `render.yaml`
- Backend deploys first (3-5 minutes)
- Frontend deploys next (2-3 minutes)
- You'll get URLs like:
  - Backend: `https://vidyasamay-backend.onrender.com`
  - Frontend: `https://vidyasamay.onrender.com`

### Step 4: Access Your App
1. Open the frontend URL
2. Login with: `admin` / `admin123`
3. Done! Your app is LIVE on the internet!

**Note:** Free tier sleeps after 15 minutes of inactivity. First request takes 30 seconds to wake up.

---

## OPTION 2: Run Locally (FOR TESTING)

**Time: 5 minutes | No internet needed**

### Prerequisites Check:
```bash
python --version    # Should show 3.9+
node --version      # Should show 16+
```

### Step 1: Setup Backend
```bash
cd Vidya-Samay-main/backend
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
python init_db.py
```

### Step 2: Setup Frontend
```bash
cd Vidya-Samay-main/frontend
npm install
```

### Step 3: Run (Need 2 Terminals)

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

### Step 4: Access
- Open: http://localhost:5173
- Login: `admin` / `admin123`

---

## OPTION 3: Docker (ONE COMMAND)

**Time: 5 minutes | Requires Docker installed**

### Step 1: Install Docker
- Download: https://www.docker.com/products/docker-desktop

### Step 2: Run
```bash
cd Vidya-Samay-main
docker-compose up -d
```

### Step 3: Access
- Frontend: http://localhost
- Backend: http://localhost:8000

### Stop:
```bash
docker-compose down
```

---

## WHICH OPTION SHOULD YOU CHOOSE?

| Option | Best For | Internet Access | Cost |
|--------|----------|----------------|------|
| **Render** | Share with others, demo | YES - Live URL | FREE |
| **Local** | Testing, development | NO - Only on your PC | FREE |
| **Docker** | Production, college server | Optional | FREE |

---

## RECOMMENDED: Start with Render

1. Deploy to Render (10 minutes)
2. Get live URL
3. Share with others
4. Test everything online

Then later, if needed:
- Run locally for development
- Use Docker for production server

---

## TROUBLESHOOTING

### Render Deployment Failed?
- Check render.yaml exists in repo
- Ensure all files are pushed to GitHub
- Check Render dashboard logs

### Local Setup Issues?
- Python not found? Install from python.org
- Node not found? Install from nodejs.org
- Port in use? Change port or kill process

### Docker Issues?
- Docker not installed? Download Docker Desktop
- Port conflict? Stop other services on port 80/8000

---

## WHAT'S NEXT AFTER DEPLOYMENT?

1. **Login** with admin/admin123
2. **Change password** in settings
3. **Add your data** (classrooms, batches, subjects, faculty)
4. **Generate timetable**
5. **Share URL** with users

---

## NEED HELP?

- Full guide: See DEPLOYMENT_GUIDE.md
- Local setup: See HOW_TO_START.md
- Quick start: See DEPLOYMENT_QUICK_START.md

---

## YOUR GITHUB REPO

https://github.com/King-Chainz/vidyasamay

All your code is there. You can:
- View code online
- Clone to another computer
- Share with team members
- Deploy from there

---

**Ready? Pick an option above and deploy! 🚀**
