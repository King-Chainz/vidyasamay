# Deployment Guide - Vidya Samay

Complete guide to deploy Vidya Samay Timetable Scheduler to production.

## Table of Contents

1. [Deployment Options](#deployment-options)
2. [Option 1: Render (Free & Easy)](#option-1-render-free--easy)
3. [Option 2: Vercel + Railway](#option-2-vercel--railway)
4. [Option 3: AWS/DigitalOcean](#option-3-awsdigitalocean)
5. [Option 4: Local Server](#option-4-local-server)
6. [Environment Configuration](#environment-configuration)
7. [Post-Deployment](#post-deployment)

---

## Deployment Options

| Platform | Frontend | Backend | Database | Cost | Difficulty |
|----------|----------|---------|----------|------|------------|
| **Render** | ✅ | ✅ | ✅ | Free | Easy |
| **Vercel + Railway** | ✅ | ✅ | ✅ | Free | Easy |
| **Heroku** | ✅ | ✅ | ✅ | Paid | Medium |
| **AWS/DigitalOcean** | ✅ | ✅ | ✅ | Paid | Hard |
| **Local Server** | ✅ | ✅ | ✅ | Free | Medium |

---

## Option 1: Render (Free & Easy)

**Best for:** Quick deployment, free hosting, beginners

### Step 1: Prepare Your Code

1. Create a GitHub account if you don't have one
2. Create a new repository
3. Push your code to GitHub:

```bash
cd Vidya-Samay-main
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/vidya-samay.git
git push -u origin main
```

### Step 2: Deploy Backend on Render

1. Go to https://render.com and sign up
2. Click "New +" → "Web Service"
3. Connect your GitHub repository
4. Configure:
   - **Name**: vidya-samay-backend
   - **Root Directory**: `backend`
   - **Environment**: Python 3
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `uvicorn main:app --host 0.0.0.0 --port $PORT`
   - **Plan**: Free

5. Add Environment Variables:
   ```
   SECRET_KEY=your-random-secret-key-here-change-this
   JWT_ALGORITHM=HS256
   JWT_EXPIRATION_HOURS=24
   ```

6. Click "Create Web Service"
7. Wait 5-10 minutes for deployment
8. Copy your backend URL (e.g., `https://vidya-samay-backend.onrender.com`)

### Step 3: Deploy Frontend on Render

1. Click "New +" → "Static Site"
2. Connect same GitHub repository
3. Configure:
   - **Name**: vidya-samay-frontend
   - **Root Directory**: `frontend`
   - **Build Command**: `npm install && npm run build`
   - **Publish Directory**: `dist`

4. Add Environment Variable:
   ```
   VITE_API_URL=https://vidya-samay-backend.onrender.com/api
   ```

5. Click "Create Static Site"
6. Your app will be live at: `https://vidya-samay-frontend.onrender.com`

### Step 4: Initialize Database

1. Go to your backend service on Render
2. Click "Shell" tab
3. Run:
   ```bash
   python init_db.py
   ```

**Done!** Your app is now live on Render.

---

## Option 2: Vercel + Railway

**Best for:** Fast frontend, reliable backend

### Step 1: Deploy Backend on Railway

1. Go to https://railway.app and sign up
2. Click "New Project" → "Deploy from GitHub repo"
3. Select your repository
4. Configure:
   - **Root Directory**: `/backend`
   - **Start Command**: `uvicorn main:app --host 0.0.0.0 --port $PORT`

5. Add Environment Variables:
   ```
   SECRET_KEY=your-random-secret-key-here
   JWT_ALGORITHM=HS256
   JWT_EXPIRATION_HOURS=24
   ```

6. Railway will auto-deploy
7. Copy your backend URL from Railway dashboard

8. Initialize database via Railway Shell:
   ```bash
   python init_db.py
   ```

### Step 2: Deploy Frontend on Vercel

1. Go to https://vercel.com and sign up
2. Click "Add New" → "Project"
3. Import your GitHub repository
4. Configure:
   - **Framework Preset**: Vite
   - **Root Directory**: `frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`

5. Add Environment Variable:
   ```
   VITE_API_URL=https://your-railway-backend-url.railway.app/api
   ```

6. Click "Deploy"
7. Your app will be live at: `https://your-project.vercel.app`

**Done!** Your app is now live.

---

## Option 3: AWS/DigitalOcean

**Best for:** Full control, scalability, production use

### AWS Deployment

#### Backend (EC2 + RDS)

1. **Launch EC2 Instance**
   - Ubuntu Server 22.04 LTS
   - t2.micro (free tier)
   - Open ports: 22 (SSH), 80 (HTTP), 443 (HTTPS), 8000

2. **Connect via SSH**
   ```bash
   ssh -i your-key.pem ubuntu@your-ec2-ip
   ```

3. **Install Dependencies**
   ```bash
   sudo apt update
   sudo apt install python3-pip python3-venv nginx -y
   ```

4. **Setup Application**
   ```bash
   cd /home/ubuntu
   git clone https://github.com/YOUR_USERNAME/vidya-samay.git
   cd vidya-samay/backend
   python3 -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   python init_db.py
   ```

5. **Create Systemd Service**
   ```bash
   sudo nano /etc/systemd/system/vidya-samay.service
   ```

   Add:
   ```ini
   [Unit]
   Description=Vidya Samay Backend
   After=network.target

   [Service]
   User=ubuntu
   WorkingDirectory=/home/ubuntu/vidya-samay/backend
   Environment="PATH=/home/ubuntu/vidya-samay/backend/venv/bin"
   ExecStart=/home/ubuntu/vidya-samay/backend/venv/bin/uvicorn main:app --host 0.0.0.0 --port 8000

   [Install]
   WantedBy=multi-user.target
   ```

6. **Start Service**
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl start vidya-samay
   sudo systemctl enable vidya-samay
   sudo systemctl status vidya-samay
   ```

7. **Configure Nginx**
   ```bash
   sudo nano /etc/nginx/sites-available/vidya-samay
   ```

   Add:
   ```nginx
   server {
       listen 80;
       server_name your-domain.com;

       location /api {
           proxy_pass http://localhost:8000/api;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
       }

       location /docs {
           proxy_pass http://localhost:8000/docs;
           proxy_set_header Host $host;
       }
   }
   ```

   Enable:
   ```bash
   sudo ln -s /etc/nginx/sites-available/vidya-samay /etc/nginx/sites-enabled/
   sudo nginx -t
   sudo systemctl restart nginx
   ```

#### Frontend (S3 + CloudFront)

1. **Build Frontend**
   ```bash
   cd frontend
   npm install
   npm run build
   ```

2. **Create S3 Bucket**
   - Go to AWS S3 Console
   - Create bucket: `vidya-samay-frontend`
   - Enable static website hosting
   - Upload `dist/` folder contents

3. **Setup CloudFront**
   - Create CloudFront distribution
   - Origin: Your S3 bucket
   - Enable HTTPS

4. **Update API URL**
   - Set `VITE_API_URL` to your EC2/domain URL
   - Rebuild and redeploy

### DigitalOcean Deployment

1. **Create Droplet**
   - Ubuntu 22.04
   - Basic plan ($6/month)
   - Add SSH key

2. **Follow same steps as AWS EC2** for backend setup

3. **Deploy Frontend**
   - Use DigitalOcean App Platform
   - Or serve from same droplet using Nginx

---

## Option 4: Local Server (Windows/Linux)

**Best for:** Internal use, college network, no internet deployment

### Windows Server

1. **Install Prerequisites**
   - Python 3.9+
   - Node.js 16+
   - Install as Windows Services

2. **Setup Backend Service**
   - Use NSSM (Non-Sucking Service Manager)
   ```bash
   nssm install VidyaSamayBackend
   # Path: C:\path\to\venv\Scripts\python.exe
   # Arguments: -m uvicorn main:app --host 0.0.0.0 --port 8000
   # Startup directory: C:\path\to\backend
   ```

3. **Setup Frontend**
   - Build: `npm run build`
   - Serve with IIS or http-server:
   ```bash
   npm install -g http-server
   http-server dist -p 80
   ```

4. **Access on Network**
   - Backend: `http://YOUR_SERVER_IP:8000`
   - Frontend: `http://YOUR_SERVER_IP`

### Linux Server

1. **Follow AWS EC2 steps** above
2. **Use systemd** for service management
3. **Configure firewall**:
   ```bash
   sudo ufw allow 80
   sudo ufw allow 443
   sudo ufw allow 8000
   sudo ufw enable
   ```

---

## Environment Configuration

### Backend Environment Variables

Create `.env` file in `backend/`:

```bash
# Security
SECRET_KEY=generate-a-strong-random-key-here-use-openssl-rand-hex-32
JWT_ALGORITHM=HS256
JWT_EXPIRATION_HOURS=24

# Database (if using PostgreSQL)
# DATABASE_URL=postgresql://user:password@host:5432/dbname

# CORS (add your frontend domain)
ALLOWED_ORIGINS=https://your-frontend-domain.com,http://localhost:5173
```

### Frontend Environment Variables

Create `.env.production` in `frontend/`:

```bash
VITE_API_URL=https://your-backend-domain.com/api
```

### Generate Secret Key

```bash
# Python
python -c "import secrets; print(secrets.token_hex(32))"

# OpenSSL
openssl rand -hex 32
```

---

## Post-Deployment Checklist

### Security

- [ ] Change default admin password
- [ ] Use strong SECRET_KEY
- [ ] Enable HTTPS (SSL certificate)
- [ ] Configure CORS properly
- [ ] Set up firewall rules
- [ ] Regular security updates

### Database

- [ ] Initialize database: `python init_db.py`
- [ ] Create admin user
- [ ] Set up backups
- [ ] Configure database persistence

### Monitoring

- [ ] Set up error logging
- [ ] Monitor server resources
- [ ] Set up uptime monitoring
- [ ] Configure alerts

### Testing

- [ ] Test login functionality
- [ ] Test data management
- [ ] Test timetable generation
- [ ] Test on different devices
- [ ] Test API endpoints

### Documentation

- [ ] Update README with deployment URL
- [ ] Document admin credentials (securely)
- [ ] Create user guide
- [ ] Document backup procedures

---

## SSL/HTTPS Setup

### Using Let's Encrypt (Free)

```bash
# Install Certbot
sudo apt install certbot python3-certbot-nginx

# Get certificate
sudo certbot --nginx -d your-domain.com

# Auto-renewal
sudo certbot renew --dry-run
```

### Using Cloudflare (Free)

1. Add your domain to Cloudflare
2. Update nameservers
3. Enable "Full" SSL mode
4. Automatic HTTPS

---

## Backup Strategy

### Database Backup

```bash
# SQLite backup
cp backend/timetable.db backend/backups/timetable_$(date +%Y%m%d).db

# Automated daily backup (cron)
0 2 * * * cp /path/to/timetable.db /path/to/backups/timetable_$(date +\%Y\%m\%d).db
```

### Full Application Backup

```bash
# Create backup
tar -czf vidya-samay-backup-$(date +%Y%m%d).tar.gz Vidya-Samay-main/

# Restore backup
tar -xzf vidya-samay-backup-20260220.tar.gz
```

---

## Scaling Considerations

### For Large Institutions

1. **Database**: Migrate to PostgreSQL or MySQL
2. **Caching**: Add Redis for session management
3. **Load Balancer**: Use Nginx or AWS ELB
4. **CDN**: Use CloudFront or Cloudflare
5. **Monitoring**: Use Prometheus + Grafana

### Performance Optimization

1. **Backend**:
   - Use Gunicorn with multiple workers
   - Enable database connection pooling
   - Add caching for frequent queries

2. **Frontend**:
   - Enable gzip compression
   - Use CDN for static assets
   - Implement lazy loading

---

## Troubleshooting Deployment

### Common Issues

**Problem: "502 Bad Gateway"**
- Backend not running
- Check systemd service status
- Check backend logs

**Problem: "CORS Error"**
- Update ALLOWED_ORIGINS in backend
- Check API URL in frontend

**Problem: "Database not found"**
- Run `python init_db.py`
- Check file permissions

**Problem: "Module not found"**
- Reinstall dependencies
- Check Python version
- Activate virtual environment

---

## Cost Estimates

### Free Tier Options
- **Render**: Free (with limitations)
- **Vercel**: Free (hobby plan)
- **Railway**: $5/month credit free
- **Total**: $0-5/month

### Paid Options
- **AWS EC2 t2.micro**: ~$10/month
- **DigitalOcean Droplet**: $6/month
- **Domain**: $10-15/year
- **SSL**: Free (Let's Encrypt)
- **Total**: $15-25/month

### Enterprise
- **AWS/Azure**: $50-500/month
- **Dedicated Server**: $100-1000/month
- **Support**: Custom pricing

---

## Recommended Deployment Path

### For Testing/Demo
→ **Render** (Free, Easy, Fast)

### For Small College
→ **Vercel + Railway** (Reliable, Free/Cheap)

### For Production
→ **AWS/DigitalOcean** (Scalable, Professional)

### For Internal Use
→ **Local Server** (No internet needed)

---

## Support & Resources

- **Render Docs**: https://render.com/docs
- **Vercel Docs**: https://vercel.com/docs
- **Railway Docs**: https://docs.railway.app
- **AWS Docs**: https://docs.aws.amazon.com
- **DigitalOcean Tutorials**: https://www.digitalocean.com/community/tutorials

---

## Quick Deploy Commands

### Render
```bash
# Already configured in render.yaml (if you create one)
git push origin main
# Auto-deploys
```

### Vercel
```bash
npm install -g vercel
cd frontend
vercel --prod
```

### Railway
```bash
npm install -g @railway/cli
railway login
railway up
```

---

**Need Help?** Check the troubleshooting section or review platform-specific documentation.

**Ready to Deploy?** Choose your platform and follow the steps above! 🚀
