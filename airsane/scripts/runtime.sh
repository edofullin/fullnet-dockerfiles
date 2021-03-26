#!/bin/sh

echo $NET_SCANNER | sed 's/,/\n/g' > /etc/sane.d/net.conf
echo "net" > /etc/sane.d/dll.conf

service dbus start

service avahi-daemon start

sleep 3

airsaned --debug=true --local-scanners-only=false --base-port=8090 $ADDITIONAL_ARGS
