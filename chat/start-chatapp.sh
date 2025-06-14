#!/bin/bash

# ChatApp Startup Script
# This script starts both the backend and frontend servers

echo "🚀 Starting ChatApp..."
echo ""

# Check if we're in the right directory
if [ ! -d "chat-backend" ] || [ ! -d "chat-frontend" ]; then
    echo "❌ Error: Please run this script from the directory containing chat-backend and chat-frontend folders"
    exit 1
fi

# Function to check if a port is in use
check_port() {
    if lsof -Pi :$1 -sTCP:LISTEN -t >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# Start backend
echo "📡 Starting Flask backend server..."
cd chat-backend
source venv/bin/activate
python src/main.py &
BACKEND_PID=$!
cd ..

# Wait a moment for backend to start
sleep 3

# Start frontend
echo "🌐 Starting React frontend server..."
cd chat-frontend
pnpm run dev --host &
FRONTEND_PID=$!
cd ..

echo ""
echo "✅ ChatApp is starting up!"
echo ""
echo "📡 Backend running on: http://localhost:5001"
echo "🌐 Frontend running on: http://localhost:5174 (or next available port)"
echo ""
echo "🎉 Open your browser and go to the frontend URL to start chatting!"
echo ""
echo "To stop the application, press Ctrl+C"
echo ""

# Function to cleanup on exit
cleanup() {
    echo ""
    echo "🛑 Stopping ChatApp..."
    kill $BACKEND_PID 2>/dev/null
    kill $FRONTEND_PID 2>/dev/null
    echo "✅ ChatApp stopped successfully!"
    exit 0
}

# Set trap to cleanup on script exit
trap cleanup SIGINT SIGTERM

# Wait for user to stop the script
wait

