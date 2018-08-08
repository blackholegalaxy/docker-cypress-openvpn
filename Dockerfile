FROM node:8

LABEL maintainer="blackholegalaxy"

ARG CYPRESS_VERSION=3.0.3

ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
ENV TERM xterm
ENV npm_config_loglevel warn
ENV npm_config_unsafe_perm true

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list \
  && apt-get -qqy update \
  && apt-get -qqy install \
    google-chrome-stable \
    ca-certificates \
    apt-transport-https \
    libgtk2.0-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    xvfb \
    dbus-x11 \
    openvpn \
    zip \
    nano \
  && rm -rf /var/lib/apt/lists/*
  
RUN yarn global add cypress@$CYPRESS_VERSION
  
ADD scripts/update-dns.sh /etc/openvpn/update-dns.sh
ADD scripts/start-openvpn.sh /etc/openvpn/start-openvpn.sh
ADD scripts/wait-on-ping.sh /etc/openvpn/wait-on-ping.sh

RUN chmod +x /etc/openvpn/update-dns.sh \
  && chmod +x /etc/openvpn/start-openvpn.sh \
  && chmod +x /etc/openvpn/wait-on-ping.sh
