# Docker + wireguard fast install script

# Quick start
First, prepare your Linux server* with a fresh install of Ubuntu, Debian or etc.

Use this one-liner to set up an Wireguard VPN server:

```bash
wget https://raw.githubusercontent.com/JustUnknownDude/wireguard/main/install.sh && bash install.sh
```

## Next steps

## Connecting devices

### IOS / Android
To add tunnel on Android/IOS mobile phone
enter the following command which will output the QR code to connect

```bash
docker exec -it wireguard /app/show-peer 1
```

The command will display data for user peer1. Use different users for different devices

### Windows / MacOS

To add a profile on Windows / MacOs devices, download the configuration file 
/wireguard/config/peer1/peer1.conf (for peer1 user) 
and add a tunnel through the official client https://www.wireguard.com/install/

### Linux

1. Install the wireguard client

```bash
sudo su && apt install -y wireguard
```

2. Create connection config & copy the contents of the peer1.conf file into it **
```bash
nano /etc/wireguard/wg0.conf
```

** If you have connection problems, you may need to remove the DNS = ... line from the configuration file

4. Start the tunnel

```bash
wg-quick up wg0
```

5. You can check that the tunnel is running with the command

```bash
wg show
```
