@echo off
setlocal enabledelayedexpansion
echo ========================================
echo   MultiPlatformApp - Windows 平台启动
echo ========================================
echo.

REM 获取当前目录
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

REM 检查 8081 端口是否已被占用
netstat -ano | findstr ":8081" | findstr "LISTENING" >nul 2>&1

if %errorlevel% == 0 (
    echo [INFO] 检测到 Web 服务已在 8081 端口运行
    echo [INFO] 直接启动 Electron 窗口...
    echo.
    node_modules\.bin\electron.cmd electron.js
) else (
    echo [INFO] 正在启动 Web 服务器...
    echo [INFO] 请等待服务启动后,Electron 窗口会自动打开
    echo.
    
    REM 在新窗口启动 Web 服务
    start "Expo Web Server" cmd /c "npm run web"
    
    REM 等待服务启动
    echo 等待服务启动 (最多 60 秒)...
    set count=0
    :wait_loop
    timeout /t 2 /nobreak >nul
    netstat -ano | findstr ":8081" | findstr "LISTENING" >nul 2>&1
    if !errorlevel! == 0 goto start_electron
    set /a count+=1
    if !count! lss 30 (
        echo .
        goto wait_loop
    )
    echo.
    echo [ERROR] Web 服务启动超时，请手动检查
    pause
    exit /b 1
    
    :start_electron
    echo.
    echo [SUCCESS] Web 服务已就绪！
    echo [INFO] 正在启动 Electron 窗口...
    echo.
    timeout /t 2 /nobreak >nul
    node_modules\.bin\electron.cmd electron.js
)
endlocal
