#!/bin/bash

url -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - && \
apt-get install -y nodejs

node -v
npm -v


if [ ! -f /app/settings/settings.json]; then
	echo "================================================"
	echo " Creating settings.json file "
	echo "================================================"

	copy /root/settings.json /app/settings/settings.json
	
	echo " Done"
	echo "================================================" 
fi

echo " " 

if [ ! -f /app/presets/presets.json]; then
	echo "================================================"
	echo " Creating presets.json file "
	echo "================================================"

	copy /root/presets.json /app/presets/presets.json
	
	echo " Done"
	echo "================================================" 
fi


cd /
npm install https://github.com/jishi/node-sonos-http-api


#npm start




