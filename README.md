# kdawg's test fleet in Resin
This repository was setup in order install different things on to Raspberry Pi 3s using Resin.io.

#Docker File
The Docker file is set up so that everything runs in a certain order. All the updates and Raspberry Pi configurations needed by Resin is installed first. Afterwards, the other modules that we need are installed. Finally, there is a bash script that is called in order to configure everything as if it was running through the bash command interface.

#Bash Script
The script will initilize everything. It may not be needed, seeing as how everything can be done through the Docker file, but aw well.

The script will run files using commands that should have been installed. If the program runs, then the modules were installed successfully.

Resin CLI (command line interface) is installed just in case, that way we can go into the Pi itself and configure anything if needed.

The influx debian needs to be depackaged in order to be used, then it is removed to free up space. The beaconDatabase is created in order to scan for the beacons.

The bluetooth interface is then brought up in order to actually scan. This is very important, otherwise the scanning scripts in list-beacons will not work.

The scanning scripts are then copied from my (Krishna's) personal github because the original script from Punch Through has been modified, and new scripts were added. npm is then used to install the correct node_modules. (Note, there will be errors that occur when installing. Ignore those, because it still works out in the end.)

Once everything is daijoubu desu, the python script will run in order for us to ssh into the pi from our own terminal instead of using Resin.io's terminal (because their terminal is very slow). In order to ssh into it, environment variables need to be turned on through Docker, an environment variable called PASSWD needs to be set then exported (done in the bash script), and then the host name is root@<device ip> and the password will be whatever you set it as. Once you create the environment variable, the device will restart itself and redownload and install everything. This can't be avoided, just live with it.

 