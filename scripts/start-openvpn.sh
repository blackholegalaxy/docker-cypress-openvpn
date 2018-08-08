#!/bin/bash

openvpn --up /etc/openvpn/update-dns.sh --script-security 2 --config "$1" --daemon
