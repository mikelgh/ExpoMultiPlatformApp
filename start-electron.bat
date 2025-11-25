@echo off
setlocal enabledelayedexpansion
echo ========================================
echo   MultiPlatformApp - Windows Platform
echo ========================================
echo.

REM Get current directory
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

REM Check if port 8081 is already in use
netstat -ano | findstr ":8081" | findstr "LISTENING" >nul 2>&1

if %errorlevel% == 0 (
    echo [INFO] Web server detected on port 8081
    echo [INFO] Starting Electron window directly
    echo.
    node_modules\.bin\electron.cmd electron.js
) else (
    echo [INFO] No server detected on port 8081
    echo [INFO] Starting Web server
    echo [IMPORTANT] If Expo asks to use a different port, please answer NO
    echo [IMPORTANT] Then run 'kill-port.bat' to free port 8081 and try again
    echo.
    
    REM Start Web server in a new window
    start "Expo Web Server" cmd /c "set EXPO_DEVTOOLS_LISTEN_ADDRESS=localhost && npm run web"
    
    REM Wait for server to start
    echo Waiting for server to start (max 60 seconds)
    set count=0
    :wait_loop
    timeout /t 2 /nobreak >nul
    netstat -ano | findstr ":8081" | findstr "LISTENING" >nul 2>&1
    if !errorlevel! == 0 goto start_electron
    set /a count+=1
    if !count! lss 30 (
        echo.
        goto wait_loop
    )
    echo.
    echo [ERROR] Web server startup timeout
    echo [INFO] Port 8081 might be in use. Run 'kill-port.bat' to free it
    pause
    exit /b 1
    
    :start_electron
    echo.
    echo [SUCCESS] Web server is ready on port 8081!
    echo [INFO] Starting Electron window
    echo.
    timeout /t 2 /nobreak >nul
    node_modules\.bin\electron.cmd electron.js
)
endlocal
