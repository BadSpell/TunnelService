@echo off

title Tunnel Service
set key="*.key"

cd /d %~dp0
net session >nul 2>&1
if not %errorlevel% == 0 (
   echo This script must be run with administrator privileges.
) else (
   echo Set key files permission... 
   takeown /f *.key
   icacls %key% /c /t /remove SYSTEM
   icacls %key% /c /t /inheritance:e
   bin\nssm stop BSTunnel
   bin\nssm remove BSTunnel confirm
   echo.
   echo Service uninstalled successfully.
)
echo Press any key to exit ...
pause > nul
