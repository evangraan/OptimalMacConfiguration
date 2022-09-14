#!/bin/bash
adb tcpip 5555
IP=$(adb shell ip addr show wlan0 | grep "inet " | tr -s ' ' ' ' | cut -d ' ' -f3 | cut -d '/' -f1)
adb connect $IP:5555
