#!/bin/bash
python3 startup.py
dpkg -i /influxdb_0.13.0_armhf.deb
nohup influxd &
echo "influx is running"
#Modify /etc/ssh/sshd_config so that it listens on port 13
#/etc/init.d/ssh restart
export PASSWD=${PASSWD:=root}
#Set the root password
echo "root:$PASSWD" | chpasswd
python3 main.py
#Spawn dropbear
#dropbear -E -F &
npm  install --global --production resin-cli
resin login --credentials --email krishna.deoram@gmail.com --password krishna1