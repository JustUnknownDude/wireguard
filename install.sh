apt update
apt install docker.io docker-compose
mkdir -p ~/wireguard/config
cat <<EOF > ~/wireguard/docker-compose.yml
---
version: "2.1"
services:
  wireguard:
    image: lscr.io/linuxserver/wireguard
    container_name: wireguard
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - SERVERURL=auto
      - SERVERPORT=51820
      - PEERS=15
      - PEERDNS=auto
      - INTERNAL_SUBNET=10.13.13.0
      - ALLOWEDIPS=0.0.0.0/0
    volumes:
      - ~/wireguard/config:/config
      - /lib/modules:/lib/modules
    ports:
      - 51820:51820/udp
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
    restart: unless-stopped
EOF
 cd ~/wireguard
 docker-compose up -d
 docker exec -it wireguard /app/show-peer 1

