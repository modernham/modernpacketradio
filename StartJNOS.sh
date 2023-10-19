#!/bin/bash
export PATH=$PATH:/sbin
#Prompts for sudo password here so that screens dont get hung up later asking for it
sudo whoami
sudo /jnos/./tuncreate tun0 takusr
sudo ifconfig tun0 192.168.2.1 pointopoint 192.168.2.2 mtu 1500 up
sudo screen -S interface -dm bash -c "sudo socat -d -d -ly PTY,link=/dev/ttyq3 PTY,link=/dev/ptyq3"
sleep 2
sudo chmod 777 /dev/ttyq3
sudo chmod 777 /dev/ptyq3
screen -S direwolf -dm bash -c "direwolf -d kn -c /home/takusr/direwolf-1200.conf; exec sh"
screen -S jnos -dm bash -c "cd /jnos; ./jnos; exec sh"
