from scapy.all import *
import json
import os

def monitor(packet):
 if IP in packet and packet[IP].src == "192.168.128.230":
  #packetlist.append(packet)
  string = json.dumps(str(packet.load))
  timestamp = str(string[3:-2])
  nanoseconds = float(timestamp*1000000)
  difference = float((time.time())*1000000) - nanoseconds
  os.system("curl -i -XPOST 'http://localhost:8086/write?db=networkDatabase' --data-binary 'icmp,type=timestamps difference="+str(difference)+" "+str(nanoseconds)+"'")
  #print(string)
  #print(packet.show())

packetlist = []
sniff(prn=monitor)