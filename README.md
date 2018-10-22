# TunnelService

*TunnelService* is a Windows batch file for access a computer on NAT from the public Internet.
It allows you to access services like RDP without having to logon to Windows.
> **Note:** To run this script, You must have an SSH server with a public IP address.


## Installation
-  First, Add the following three lines to the `/etc/ssh/sshd_config` file and restart the ssh service in your ssh server.
```
GatewayPorts clientspecified
ClientAliveInterval 15
ClientAliveCountMax 3
```

-  Put the ssh private key file **server.key** in the same folder.
-  Right-click the **tunnel.bat** file to edit it
-  Set the server information and port you want to forwarding.
-  Save **tunnel.bat** file and run **service_register.bat**.

## Uninstallation

-  Just run **service_remove.bat** will uninstall the tunneling service.
