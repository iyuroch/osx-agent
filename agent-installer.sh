#!/bin/bash

#does all installation of agent

SCRIPTNAME="log-example.sh" #name of script in this folder to run as agent/daemon
SCRIPTLOCATION="/var/lib/" #folder where script will persist
PLISTNAME="com.example.log-example.plist" #name of plist file
PLISTLOCATION="$HOME/Library/LaunchAgents/" #location of plist file

function install() {
if [ ! -d "$PLISTLOCATION" ]; then
	mkdir $PLISTLOCATION
fi

chmod 700 $PLISTNAME
chmod 700 $SCRIPTNAME

cp $PLISTNAME $PLISTLOCATION
cp $SCRIPTNAME $SCRIPTLOCATION

chown $(whoami):staff $SCRIPTLOCATION$SCRIPTNAME

launchctl load -w $PLISTLOCATION$PLISTNAME
}

function uninstall() {
launchctl unload $PLISTLOCATION$PLISTNAME

rm $PLISTLOCATION$PLISTNAME
rm $SCRIPTLOCATION$SCRIPTNAME
}

"$@"
