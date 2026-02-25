# Deploy Vidya Samay

## Backend (Render - FREE)

1. Go to https://render.com
2. New Web Service
3. Connect: `King-Chainz/vidyasamay`
4. Settings:
   - Name: `vidyasamay-backend`
   - Root: `backend`
   - Build: `pip install -r requirements.txt`
   - Start: `uvicorn main:app --host 0.0.0.0 --port $PORT`
   - Python: 3.11
5. Deploy

Backend URL: `https://vidyasamay-backend.onrender.com`

## Frontend (Netlify - FREE)

1. Go to https://app.netlify.com
2. Import: `King-Chainz/vidyasamay`
3. Settings:
   - Base: `frontend`
   - Build: `npm run build`
   - Publish: `dist`
4. Environment Variable:
   - `VITE_API_URL` = `https://vidyasamay-backend.onrender.com/api`
5. Deploy

## Login

Username: `admin`
Password: `admin123`
