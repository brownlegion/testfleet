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
#Spawn dropbear
#dropbear -E -F &
echo "installing resin cli"
npm  install --global --production resin-cli
echo "finished install resin cli"
resin login --credentials --email krishna.deoram@gmail.com --password krishna1
influx -execute "create database beaconDatabase"
echo "created beaconDatabase on influx"
git clone https://github.com/brownlegion/list-beacons.git
echo "cloned, now installing modules"
npm install --prefix list-beacons
echo "done installing, changing modes"
chmod +x list-beacons/clear.sh
chmod +x list-beacons/scan_once.sh
chmod +x list-beacons/beacon_scan.sh
echo "done changing modes"
echo "everything is daijoubu desu"
python main.py