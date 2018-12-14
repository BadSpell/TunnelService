@echo off

title Tunnel Service
set key="*.key"

cd /d %~dp0
net session >nul 2>&1
if not %errorlevel% == 0 (
   echo This script must be run with administrator privileges.
) else (
   echo Set key files permission...
   icacls %key% /c /t /grant System:F
   icacls %key% /c /t /setowner System
   icacls %key% /c /t /inheritance:r
   bin\nssm install BSTunnel "%cd%\tunnel.bat"
   bin\nssm start BSTunnel
   echo.
   echo Service installed successfully.
)
echo Press any key to exit ...
pause > nul
