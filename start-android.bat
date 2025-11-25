@echo off
setlocal enabledelayedexpansion
echo ========================================
echo   MultiPlatformApp - Android Platform
echo ========================================
echo.

REM Get current directory
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

echo Prerequisites:
echo 1. Android Studio installed
echo 2. Android emulator running or device connected
echo 3. ANDROID_HOME environment variable configured
echo.

REM Check if port 8081 is already in use
netstat -ano | findstr ":8081" | findstr "LISTENING" >nul 2>&1

if %errorlevel% == 0 (
    echo [INFO] Development server detected on port 8081
    echo [INFO] Reusing existing server...
    echo.
    echo Starting Android application...
    npx expo run:android
) else (
    echo [INFO] Starting development server and Android app...
    echo.
    npm run android
)
endlocal
