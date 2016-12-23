#!/bin/bash

echo "TCP_FORWARDING_HOST = $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)" > /etc/condor/config.d/00-networking
echo 'PRIVATE_NETWORK_INTERFACE = $(IP_ADDRESS)' >> /etc/condor/config.d/00-networking
echo "PRIVATE_NETWORK_NAME = nova" >> /etc/condor/config.d/00-networking
service condor stop
service condor start

