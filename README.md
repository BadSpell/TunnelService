# TunnelService

*TunnelService* is a Windows batch file for access a computer on NAT from the public Internet.
It also allows you to ssh tunneling without having to logon to Windows after reboot.
> **Note:** To run this script, You must have an SSH server with a public IP address.


## Installation
-  Add the following lines to the `/etc/ssh/sshd_config` in your server and restart the ssh service to take effect.
```
GatewayPorts clientspecified
ClientAliveInterval 15
ClientAliveCountMax 3
```

-  Put the ssh private key file **server.key** in the same folder.
-  Right-click the **tunnel.bat** to edit it.
-  Set the server config and ports you want to forwarding.
-  Save **tunnel.bat** and run **service_install.bat**.

## Uninstallation

-  Just run **service_uninstall.bat** will uninstall the *TunnelService*.
