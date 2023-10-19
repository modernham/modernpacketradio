#!/bin/bash
screen -S interface -dm bash -c "sudo socat -d -d -ly PTY,link=/dev/ttyq3 PTY,link=/dev/ptyq3"
sleep 2
sudo chmod 777 /dev/ttyq3
sudo chmod 777 /dev/ptyq3
sudo kissattach -l /dev/ptyq3 ax0
sudo kissparms -c 1 -p ax0
screen -S direwolf -dm bash -c "direwolf -d kn -c ~/Documents/direwolf.conf; exec sh"
