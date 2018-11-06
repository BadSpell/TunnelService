@echo off

title Tunnel Service
set key="*.key"

cd %~dp0
net session >nul 2>&1
if not %errorlevel% == 0 (
   echo This script must be run with administrator privileges.
) else (
   echo Set key files permission...
   icacls %key% /c /t /inheritance:d
   icacls %key% /c /t /grant System:F
   icacls %key% /c /t /remove Administrator BUILTIN\Administrators BUILTIN Everyone %username% Users

   bin\nssm install BSTunnel "%cd%\tunnel.bat"
   bin\nssm start BSTunnel
   echo.
   echo Service installed successfully.
)
echo Press any key to exit ...
pause > nul
