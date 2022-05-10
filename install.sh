#!/bin/bash

echo "Starting install process.... Please wait..."

echo "Changing permissions for execution"
chmod +x /opt/plcnext/helloworld.py
chmod +x /opt/plcnext/python.sh

echo "Setting up init.d"
cp -a /opt/plcnext/python.sh /etc/init.d/
cd /etc/init.d/
update-rc.d python.sh defaults
./python.sh start
rm -r /opt/plcnext/python.sh

echo "Removing residual files"
cd /opt/plcnext/
rm -r README.md
rm -r install.sh

echo "Log file for errors is hello.log in the /opt/plcnext/logs folder."
echo "Install complete!"
