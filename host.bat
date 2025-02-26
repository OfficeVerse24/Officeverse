@echo off
REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed or not added to PATH. Please install Python and try again.
    pause
    exit /b
)

REM Get the folder containing this script
set "BUILD_DIR=%~dp0"
cd /d "%BUILD_DIR%"

REM Check if the "Build" folder exists
if not exist Build (
    echo Build folder not found. Ensure this script is in the same directory as your Unity WebGL build folder.
    pause
    exit /b
)

REM Start a local server with Python
echo Hosting WebGL build at http://localhost:6000
echo Press Ctrl+C to stop the server.

REM Open the browser twice
start http://localhost:7000

REM Start the server
python -m http.server 7000
