#!/bin/bash
#pkill beacon_scan.sh
#Just to see if python3 was installed properly.
echo "Starting up"
if [ -f /data/startup.py ];
then
 echo "File exists."
 #python3 /data/startup.py
else
 echo "File doesn't exists."
 cp startup.py /data/
 python3 /data/startup.py
fi

#Depackage the influx debian...
#dpkg -i /influxdb_0.13.0_armhf.deb
#...then run it in the background.
#if [ -f /usr/src/app/influxdb.conf ]; then
#  cat influxdb.conf > /etc/influxdb/influxdb.conf
#  rm /usr/src/app/influxdb.conf
#fi

#influxd &
#sleep 1
#echo "influx is running"

#Password is set to ssh into.
export PASSWD=${PASSWD:=root}
#Set the root password
echo "root:$PASSWD" | chpasswd

#Install the Resin cli
#echo "installing resin cli..."
#if [ -d ~/.resin ]; then
# echo "Already have resin cli installed."
#else
# npm  install --global --production resin-cli
# echo "finished installing resin cli"
# resin login --credentials --email krishna.deoram@gmail.com --password krishna1
#fi

#Create an Influx database.
#influx -execute "create database beaconDatabase"
#echo "created beaconDatabase on influx"
#influx -execute "create database networkDatabase"
#echo "Created networkDatabase on Influx"

#echo "starting bluetooth scanning tool"
#Start the bluetooth scanning thing.
#echo "Attaching hci0..."
#if ! /usr/bin/hciattach /dev/ttyAMA0 bcm43xx 921600 noflow -; then
#    echo "First try failed. Let's try another time."
#    /usr/bin/hciattach /dev/ttyAMA0 bcm43xx 921600 noflow -
#fi

#echo "Bring hci0 up..."
#hciconfig hci0 up
#echo "bluetooth scanning configured (maybe)"

#Get the stuff to bluetooth scan.
#if [ -d /usr/src/app/list-beacons ]; then
#  echo "Already have beacon scanner"
#else
#  git clone https://github.com/brownlegion/list-beacons.git
#  echo "cloned, now installing modules..."
#  npm install --prefix list-beacons
#  echo "done installing, changing modes"
#  chmod +x list-beacons/clear.sh
#  chmod +x list-beacons/scan_once.sh
#  chmod +x list-beacons/beacon_scan.sh
#  echo "done changing modes"
#fi
#Influx tests, and get rid of debian file (because it takes up space).
#if [ -f /influxdb_0.13.0_armhf.deb ]; then
#  rm /influxdb_0.13.0_armhf.deb
#fi
#influx -execute "insert beacon,state=In major=6,minor=25,device=\"${HOSTNAME}\"" -database=beaconDatabase
#influx -execute "insert beacon,state=Out major=6,minor=26,device=\"${HOSTNAME}\"" -database=beaconDatabase

#Run beacon_scan.sh in the background on startup.
#/usr/src/app/list-beacons/beacon_scan.sh >> /usr/src/app/list-beacons/kdawg/influxlog.txt &

#If everything made it up to here...
echo "Everything is going according to plan..."
#...run the ssh server via python.
python main.py &
python3 sniffer.py --hostname $HOSTNAME