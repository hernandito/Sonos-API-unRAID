#!/bin/bash


# install main packages
apt-get update 
apt-get install wget mc git tar pip curl screen inotify-tools nano zip python-setuptools python-dev build-essential -qy 


# cleanup
apt-get clean -y 
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN mkdir -p /app/settings
RUN mkdir -p /app/presets
RUN chmod -R 777 /app/

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
	
	mkdir -p /app/settings
	mkdir -p /app/presets
	chmod -R 777 /app/
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




