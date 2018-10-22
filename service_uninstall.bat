@echo off

title Tunnel Service
set key="*.key"

net session >nul 2>&1
if not %errorlevel% == 0 (
   echo This script must be run with administrator privileges.
) else (
   echo Set key files permission...
   icacls %key% /c /t /inheritance:d
   icacls %key% /c /t /grant %username%:F

   bin\nssm stop BSTunnel
   bin\nssm remove BSTunnel confirm
   echo.
   echo Service uninstalled successfully.
)
echo Press any key to exit ...
pause > nul
