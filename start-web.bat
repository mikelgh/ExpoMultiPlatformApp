@echo off
setlocal enabledelayedexpansion
echo ========================================
echo   MultiPlatformApp - Web Platform
echo ========================================
echo.

REM Get current directory
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

REM Check if port 8081 is already in use
netstat -ano | findstr ":8081" | findstr "LISTENING" >nul 2>&1

if %errorlevel% == 0 (
    echo [WARNING] Port 8081 is already in use
    echo [INFO] Please close the existing process or use a different port
    echo.
    echo Press any key to try starting anyway (Expo will ask for a different port)...
    pause >nul
)

echo Starting Expo Web server on port 8081...
echo Browser will automatically open http://localhost:8081
echo.
npm run web
endlocal
