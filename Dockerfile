FROM linuxserver/baseimage.apache
MAINTAINER hernandito

WORKDIR /app

# copy sources.list
COPY sources.list /etc/apt/

ENV APTLIST="wget mc git tar pip curl screen inotify-tools nano zip python-setuptools python-dev build-essential"








ADD config/ /root/

# add local files
COPY root/ /
COPY root/settings.json /app/settings/settings.json
COPY root/presets.json /app/presets/presets.json



ADD config/start.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh



# ports and volumes
EXPOSE 5005
VOLUME /app
ENV TERM=xterm



