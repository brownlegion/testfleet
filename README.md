# kdawg's test fleet in Resin
This repository was setup in order install different things on to Raspberry Pi 3s using Resin.io.

#Docker File
The Docker file is set up so that everything runs in a certain order. All the updates and Raspberry Pi configurations needed by Resin is installed first. Afterwards, the other modules that we need are installed. Finally, there is a bash script that is called in order to configure everything as if it was running through the bash command interface.
