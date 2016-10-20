from scapy.all import *
import json
import os
import argparse

def monitor(packet):
 if IP in packet and packet[IP].src == str(address):
  packetlist.append(packet)
  string = json.dumps(str(packet.load))
  timestamp = str(string[3:-2])
  nanoseconds = int((float(timestamp))*1000000000)
  #difference = int(float(time.time())*1000000000) - nanoseconds
  #os.system("curl -i -XPOST 'http://localhost:8086/write?db=networkDatabase' --data-binary 'icmp,type=timestamps difference="+str(difference)+" "+str(nanoseconds)+"'")
  print("Packet: " + str(len(packetlist)) + " Time: " + str(nanoseconds))
  #print(packet.show())

packetlist = []
parser = argparse.ArgumentParser(description="Scan for packets from a specified IP given the hostname.")
parser.add_argument("--hostname", nargs=1, type=str)
arguments = parser.parse_args()
hostname = arguments.hostname[0]
hostname = hostname[:-8]
file = open("/usr/src/app/devices.json", "r")
contents = json.loads(file.read())
file.close()
ip = contents[hostname]
address = ip['ip']
#print(address)

sniff(prn=monitor, store=0)