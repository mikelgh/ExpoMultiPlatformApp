@echo off
REM Script to kill process using port 8081
setlocal enabledelayedexpansion

echo Checking port 8081...

REM Find the PID using port 8081
for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":8081" ^| findstr "LISTENING"') do (
    set PID=%%a
    goto :found
)

echo [INFO] Port 8081 is not in use
goto :end

:found
echo [INFO] Port 8081 is being used by PID: !PID!

REM Get process name
for /f "tokens=1" %%b in ('tasklist /FI "PID eq !PID!" /NH') do (
    set PROCESS_NAME=%%b
)

echo [INFO] Process: !PROCESS_NAME!
echo.
choice /C YN /M "Do you want to kill this process"

if errorlevel 2 goto :end
if errorlevel 1 (
    taskkill /F /PID !PID!
    echo [SUCCESS] Process killed successfully
)

:end
endlocal
