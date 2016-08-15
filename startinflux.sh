#!/bin/bash
python3 startup.py
dpkg -i /influxdb_0.13.0_armhf.deb
influxd &