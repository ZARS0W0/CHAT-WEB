@echo off
echo Starting ChatApp...
echo.

:: Check if we're in the right directory
if not exist "chat-backend" (
    echo Error: "chat-backend" directory not found.
    echo Please run this script from the directory containing chat-backend and chat-frontend folders.
    pause
    exit /b 1
)
if not exist "chat-frontend" (
    echo Error: "chat-frontend" directory not found.
    echo Please run this script from the directory containing chat-backend and chat-frontend folders.
    pause
    exit /b 1
)

echo Starting Flask backend server...
start /B cmd /c "cd chat-backend && call venv\Scripts\activate && python src\main.py"

echo Starting React frontend server...
start /B cmd /c "cd chat-frontend && pnpm run dev --host"

echo.
echo ChatApp is starting up!
echo.
echo Backend running on: http://localhost:5001
echo Frontend running on: http://localhost:5174 (or next available port)
echo.
echo Open your browser and go to the frontend URL to start chatting!
echo.
echo To stop the application, close this command prompt window.
echo.
pause

