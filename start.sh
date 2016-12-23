#!/bin/bash
hostname $(curl -s http://utatlas.its.utexas.edu/hostname)
/etc/cvmfs/setup-cvmfs-portable.sh
/root/startcondor.sh
service gmond start
exec bash
