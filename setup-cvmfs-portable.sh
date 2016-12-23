#!/bin/bash
echo "Creating paths"	
rm -rf /cvmfs
mkdir /cvmfs
chmod a+rwx /cvmfs
chown nobody:nobody /cvmfs
echo "done"
