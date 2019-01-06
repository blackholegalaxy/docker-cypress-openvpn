FROM blackholegalaxy/cypress:3.1.4

LABEL maintainer="blackholegalaxy"

RUN apt-get -qqy update \
  && apt-get -qqy install \
    openvpn \
  && rm -rf /var/lib/apt/lists/*
  
ADD scripts/update-dns.sh /etc/openvpn/update-dns.sh
ADD scripts/start-openvpn.sh /etc/openvpn/start-openvpn.sh

RUN chmod +x /etc/openvpn/update-dns.sh \
  && chmod +x /etc/openvpn/start-openvpn.sh
