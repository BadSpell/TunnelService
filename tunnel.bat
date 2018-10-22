@echo off
rem Set the server key filename
set KeyFile=server.key

rem Set SSH server information
set Server=root@example.com
set ServerPort=22

rem RDP port forwarding
set Forwards=-R 0.0.0.0:3389:127.0.0.1:3389

rem Other custom port forwarding
set Forwards=%Forwards% -R 0.0.0.0:8080:127.0.0.1:8080
set Forwards=%Forwards% -R 0.0.0.0:12443:127.0.0.1:12443

:Reconnect
echo %date% %time% Connect to %Server%:%ServerPort% ...

bin\ssh -N -i %KeyFile% %Server% -p %ServerPort% %Forwards% -o ExitOnForwardFailure=yes -o ServerAliveInterval=15 -o ServerAliveCountMax=3 -o StrictHostKeyChecking=no

echo %date% %time% Disconnected. Reconnect after 60 seconds.
timeout 60 > nul

goto Reconnect
