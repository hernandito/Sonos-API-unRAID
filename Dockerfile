FROM linuxserver/baseimage.apache
MAINTAINER hernandito



# copy sources.list
COPY sources.list /etc/apt/


ADD config/ /root/

RUN mkdir -p /app
RUN mkdir -p /app/settings
RUN mkdir -p /app/presets

# add local files
#COPY root/ /
COPY /root/settings.json /app/settings/settings.json
COPY /root/presets.json /app/presets/presets.json



ADD config/start.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh



# ports and volumes
EXPOSE 5005
VOLUME /app
ENV TERM=xterm



