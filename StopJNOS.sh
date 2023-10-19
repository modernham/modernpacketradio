#!/bin/bash
pkill screen
sudo pkill screen
sudo ip tuntap del dev tun0 mode tun
