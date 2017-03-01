FROM linuxserver/baseimage.apache
MAINTAINER hernandito

WORKDIR /app

# copy sources.list
COPY sources.list /etc/apt/

ENV APTLIST="wget mc git tar pip curl screen inotify-tools nano zip python-setuptools python-dev build-essential"

# install main packages
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - && \
apt-get install -y nodejs

# cleanup
RUN apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /app/settings
RUN mkdir -p /app/presets
RUN chmod -R 777 /app/

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



