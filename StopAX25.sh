#!/bin/bash
pkill screen
sudo pkill screen
ps -ef | grep 'kissattach' | grep -v grep | awk '{print $2}' | xargs -r sudo kill -9
