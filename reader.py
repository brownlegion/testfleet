from scapy.all import *
import binascii
import json
import os
import argparse
import time

def monitor(packet):
	if IP in packet and ICMP in packet and packet[IP].src == str(address):
		file = open("/data/IXIA.log", "a")
		if packet[ICMP].type == 8: #echo-request
			#print(str(binascii.hexlify(packet.load)))
			#beacon = str(binascii.hexlify(packet.load))[2:-1]
   			#uuid = beacon[:-8]
   			#major = beacon[-8:-4]
   			#minor = beacon[-4:]
   			#file.write(str(time.strftime("%a, %d %b %Y %H:%M:%S", time.localtime(time.time()))) + "Echo stuff")
   			print ("UUID: " + uuid + ", Major: " + major + ", Minor: " + minor)
		elif packet[ICMP].type == 13: #timestamp-request
			print("ts_ori=" + str(packet[ICMP].ts_ori) + "ms ts_rx=" + str(packet[ICMP].ts_rx) + "ms ts_tx=" + str(packet[ICMP].ts_tx) + "ms")
			#file.write(str(time.strftime("%a, %d %b %Y %H:%M:%S", time.localtime(time.time()))) + "Timestamp stuff")
		file.close()

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
print("Ready to scan for packets.")
sniff(prn=monitor, store=0)