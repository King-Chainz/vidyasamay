# Deployment Quick Start

Choose your deployment method and follow the steps.

## 🚀 Fastest: Render (Free)

**Time: 10 minutes | Cost: Free**

1. Push code to GitHub
2. Go to [render.com](https://render.com)
3. Click "New Blueprint"
4. Select your repo
5. Done! Auto-deploys from `render.yaml`

**Result:** 
- Backend: `https://your-app-backend.onrender.com`
- Frontend: `https://your-app-frontend.onrender.com`

---

## 🐳 Docker (Recommended for Production)

**Time: 5 minutes | Requirements: Docker installed**

```bash
# One command deployment
docker-compose up -d

# Access
# Frontend: http://localhost
# Backend: http://localhost:8000
```

**Stop:**
```bash
docker-compose down
```

---

## 💻 Local Server

**Time: 5 minutes | For internal/college network**

### Windows:
```bash
deploy.bat local
```

### Linux/Mac:
```bash
chmod +x deploy.sh
./deploy.sh local
```

**Access:**
- Frontend: `http://YOUR_SERVER_IP`
- Backend: `http://YOUR_SERVER_IP:8000`

---

## ☁️ Vercel + Railway (Free)

**Time: 15 minutes | Cost: Free**

### Backend (Railway):
1. Go to [railway.app](https://railway.app)
2. New Project → Deploy from GitHub
3. Select repo, set root: `/backend`
4. Add env vars (see DEPLOYMENT_GUIDE.md)
5. Copy backend URL

### Frontend (Vercel):
```bash
cd frontend
npm install -g vercel
vercel --prod
```

When prompted, set:
- Framework: Vite
- Build: `npm run build`
- Output: `dist`

Add environment variable:
```
VITE_API_URL=https://your-railway-backend.railway.app/api
```

---

## 📋 Pre-Deployment Checklist

- [ ] Code pushed to GitHub (for cloud deployment)
- [ ] Changed default admin password
- [ ] Generated strong SECRET_KEY
- [ ] Updated CORS settings
- [ ] Tested locally first
- [ ] Database initialized

---

## 🔑 Environment Variables

### Backend (.env):
```bash
SECRET_KEY=your-random-secret-key-here
JWT_ALGORITHM=HS256
JWT_EXPIRATION_HOURS=24
```

Generate secret key:
```bash
python -c "import secrets; print(secrets.token_hex(32))"
```

### Frontend (.env.production):
```bash
VITE_API_URL=https://your-backend-url.com/api
```

---

## 🆘 Quick Troubleshooting

**Backend won't start:**
```bash
# Check logs
docker-compose logs backend
# Or
cat backend/backend.log
```

**Frontend shows network error:**
- Check backend is running
- Verify VITE_API_URL is correct
- Check CORS settings in backend

**Database error:**
```bash
cd backend
python init_db.py
```

**Port already in use:**
```bash
# Windows
netstat -ano | findstr :8000
taskkill /PID <process_id> /F

# Linux/Mac
lsof -ti:8000 | xargs kill -9
```

---

## 📊 Deployment Comparison

| Method | Time | Cost | Difficulty | Best For |
|--------|------|------|------------|----------|
| **Render** | 10 min | Free | ⭐ Easy | Quick demo |
| **Docker** | 5 min | Free | ⭐⭐ Medium | Production |
| **Local** | 5 min | Free | ⭐ Easy | Internal use |
| **Vercel+Railway** | 15 min | Free | ⭐⭐ Medium | Scalable |
| **AWS/DO** | 30 min | $15/mo | ⭐⭐⭐ Hard | Enterprise |

---

## 🎯 Recommended Path

1. **Testing?** → Use Render (fastest)
2. **Production?** → Use Docker (most reliable)
3. **Internal?** → Use Local Server (no internet needed)
4. **Scalable?** → Use Vercel + Railway (best performance)

---

## 📚 Full Documentation

For detailed instructions, see:
- **DEPLOYMENT_GUIDE.md** - Complete deployment guide
- **HOW_TO_START.md** - Local development setup
- **README.md** - Project overview

---

## 🔗 Useful Links

- [Render](https://render.com)
- [Vercel](https://vercel.com)
- [Railway](https://railway.app)
- [Docker Hub](https://hub.docker.com)
- [DigitalOcean](https://www.digitalocean.com)

---

## ✅ Post-Deployment

After deployment:

1. **Test login:** admin / admin123
2. **Change password** in settings
3. **Add your data** in Data Management
4. **Generate timetable** to verify
5. **Share URL** with users

---

**Need help?** Check DEPLOYMENT_GUIDE.md for detailed troubleshooting.

**Ready to deploy?** Pick a method above and go! 🚀
