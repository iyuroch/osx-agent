#!/bin/bash

#does all installation of agent

SCRIPTNAME="log-example.sh" #name of script in this folder to run as agent/daemon
SCRIPTLOCATION="/var/lib/" #folder where script will persist
PLISTTNAME="com.example.log-example.plist" #name of plist file
PLISTLOCATION="~/Library/LaunchAgents/" #location of plist file

chmod 700 $SCRIPTNAME
mv $PLISTNAME $PLISTLOCATION
mv $SCRIPTNAME $SCRIPTLOCATION
mv /var/lib/log-example.sh
launchctl load -w $PLISTNAME$PLISTLOCATION
