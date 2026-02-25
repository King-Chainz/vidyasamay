#!/bin/bash

# Vidya Samay Deployment Script
# Usage: ./deploy.sh [platform]
# Platforms: render, vercel, docker, local

set -e

PLATFORM=${1:-local}

echo "🚀 Deploying Vidya Samay to $PLATFORM..."

case $PLATFORM in
  render)
    echo "📦 Deploying to Render..."
    echo "1. Push your code to GitHub"
    echo "2. Go to https://render.com"
    echo "3. Create new Blueprint"
    echo "4. Select your repository"
    echo "5. Render will auto-deploy using render.yaml"
    echo ""
    echo "Or use Render CLI:"
    echo "  render deploy"
    ;;

  vercel)
    echo "📦 Deploying Frontend to Vercel..."
    cd frontend
    if ! command -v vercel &> /dev/null; then
        echo "Installing Vercel CLI..."
        npm install -g vercel
    fi
    vercel --prod
    cd ..
    echo "✅ Frontend deployed to Vercel"
    echo "⚠️  Don't forget to deploy backend separately (Railway/Render)"
    ;;

  docker)
    echo "🐳 Building and running with Docker..."
    
    # Check if Docker is installed
    if ! command -v docker &> /dev/null; then
        echo "❌ Docker is not installed. Please install Docker first."
        exit 1
    fi

    # Build and run
    docker-compose down
    docker-compose build
    docker-compose up -d

    echo "✅ Docker containers started"
    echo "Frontend: http://localhost"
    echo "Backend: http://localhost:8000"
    echo ""
    echo "View logs: docker-compose logs -f"
    echo "Stop: docker-compose down"
    ;;

  local)
    echo "💻 Deploying locally..."
    
    # Backend
    echo "Setting up backend..."
    cd backend
    if [ ! -d "venv" ]; then
        python3 -m venv venv
    fi
    source venv/bin/activate
    pip install -r requirements.txt
    
    if [ ! -f "timetable.db" ]; then
        python init_db.py
    fi
    
    # Start backend in background
    nohup uvicorn main:app --host 0.0.0.0 --port 8000 > backend.log 2>&1 &
    BACKEND_PID=$!
    echo "Backend PID: $BACKEND_PID"
    cd ..

    # Frontend
    echo "Setting up frontend..."
    cd frontend
    npm install
    npm run build
    
    # Serve frontend
    if ! command -v serve &> /dev/null; then
        npm install -g serve
    fi
    nohup serve -s dist -l 80 > frontend.log 2>&1 &
    FRONTEND_PID=$!
    echo "Frontend PID: $FRONTEND_PID"
    cd ..

    echo "✅ Local deployment complete"
    echo "Frontend: http://localhost"
    echo "Backend: http://localhost:8000"
    echo ""
    echo "Backend PID: $BACKEND_PID (kill with: kill $BACKEND_PID)"
    echo "Frontend PID: $FRONTEND_PID (kill with: kill $FRONTEND_PID)"
    ;;

  *)
    echo "❌ Unknown platform: $PLATFORM"
    echo "Usage: ./deploy.sh [render|vercel|docker|local]"
    exit 1
    ;;
esac

echo ""
echo "🎉 Deployment process completed!"
