from scapy.all import *
import json
import os

def monitor(packet):
 if "192.168.128.230" in packet:
  #packetlist.append(packet)
  string = json.dumps(str(packet.load))
  #string = str(string[3:-2])
  #nanoseconds = int(timestamp*1000000000)
  #difference = int((time.time())*1000000000) - nanoseconds
  #os.system("curl -i -XPOST 'http://localhost:8086/write?db=networkDatabase' --data-binary 'icmp,type=timestamps difference="+str(difference)+" "+str(nanoseconds)+"'")
  print(string)
  #print(packet.show())

packetlist = []
sniff(prn=monitor)