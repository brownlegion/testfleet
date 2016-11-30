# kdawg's test fleet in Resin
This repository was setup in order install different things on to Raspberry Pi 3s using Resin.io.

#Docker File
The Docker file is set up so that everything runs in a certain order. All the updates and Raspberry Pi configurations needed by Resin is installed first. Afterwards, the other modules that we need are installed ending with an apt-get update to get rid of things we don't need. Finally, there is a bash script that is called in order to configure everything as if it was running through the bash command interface.

#Bash Script
The script will initilize everything. It may not be needed, seeing as how everything can be done through the Docker file, but aw well.

The script will run files using commands that should have been installed. If the program runs, then the modules were installed successfully.

Resin CLI (command line interface) is commented just in case, that way we can go into the Pi itself and configure anything if needed.

The influx database configuration needs to be setup so that all the data sent to it is stored in /data, which is a folder that persists throughout every Resin boot. That way, we won't lose data between every update. The debian file is then removed to free up space. The beaconDatabase is created in order to scan for the beacons. (NOW COMMENTED OUT)

The bluetooth interface is then brought up in order to actually scan. This is very important, otherwise the scanning scripts in list-beacons will not work. (NOW COMMENTED OUT)

The scanning scripts are then copied from my (Krishna's) personal github because the original script from Punch Through has been modified, and new scripts were added. npm is then used to install the correct node_modules. (Note, there will be errors that occur when installing. Ignore those, because it still works out in the end.) (NOW COMMENTED OUT)

Once everything is going according to plan, the python script will run in order for us to ssh into the pi from our own terminal instead of using Resin.io's terminal (because their terminal is very slow). In order to ssh into it, environment variables need to be turned on through Docker, an environment variable called PASSWD needs to be set (done from Docker) then exported (done in the bash script), and then the host name is root@\<device ip\> and the password will be whatever you set it as in the Resin Dashboard. Once you create the environment variable, the device will restart itself and redownload and install everything. This can't be avoided, just live with it.

A HOSTNAME also needs to be setup as an environment variable. This is done individually through the Resin dashboard. It occurs one time per device, and doesn't take up much time anyway so it's not a hassle.

As of right now, the current status of the fleet will scan for packets being sent to it from a specified IP address (found in devices.json). The packets will then be sent to Influx.

```
                               _______             _    _         _
                              (_______)           (_)  (_)       | |
                               _   ___ _   _ ____  _    _  ___   | | ___ _   _ _____
                              | | (_  | | | |    \| |  | |/___)  | |/ _ \ | | | ___ |
                              | |___) | |_| | | | | |  | |___ |  | | |_| \ V /| ____|
                               \_____/|____/|_|_|_|_|  |_(___/    \_)___/ \_/ |_____|
                                
                               _______             _    _         _  _    ___
                              (_______)           (_)  (_)       | |(_)  / __)
                               _   ___ _   _ ____  _    _  ___   | | _ _| |__ _____
                              | | (_  | | | |    \| |  | |/___)  | || (_   __) ___ |
                              | |___) | |_| | | | | |  | |___ |  | || | | |  | ____|
                               \_____/|____/|_|_|_|_|  |_(___/    \_)_| |_|  |_____|
                                 
                                       
                                                       
```
 
## Resin Setup
Resin.io offers a service that allows a fleet of devices to be configured and controlled over the internet. The [Resin Documentation] (https://docs.resin.io/introduction/) offers a sufficient explaination for using their service, or you can follow these quick steps:

1. Project Initialization - 
Sign up to Resin.io, then create your first project using any type of device available. From your project dashboard, there will be a link to download your project's image file. This image must be written to an SD card, then inserted into your device. Once the device is booted up and connected to the internet, it should appear on your project's dashboard. Feel free to rename it to something more suitable for your application.

2. Git Setup - 
In order to push your code to your devices, you will need to setup a local Git repository. This repository must include any scripts you would like to run your code in and a Docker file. The Docker file will act as the container that will run your code, and will be setup whenever you make a new push to your project, whereas the code will run whenever the device is powered on. You will also need to add your Resin project as a remote stream, that way a simple `git push resin master` command will upload your repository to the Resin services, install and run the Docker container, then run your code.

3. Device Configuration - 
Any device connected to your project after committing a new change will download, install, then run the new update. You can see the individual behaviour of each device through their device dashboard and the output window. From the device dashboard, it's possible to configure anything by opening up a terminal to the device, or even configuring different environment variables speicific for each device, or even the project as a whole. 