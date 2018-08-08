#! /bin/bash

((count = 10))
while [[ $count -ne 0 ]] ; do
    ping -c 1 "$1"
    rc=$?
    if [[ $rc -eq 0 ]] ; then
        ((count = 1))
    fi
    ((count = count - 1))
done

if [[ $rc -eq 0 ]] ; then
    echo "VPN connected"
    exit 0
else
    echo "VPN Timeout"
    exit 1
fi
