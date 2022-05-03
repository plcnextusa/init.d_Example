#!/bin/bash

echo "Starting install process.... Please wait..."

echo "Moving dependencies"
cp -a /opt/plcnext/public/dependencies/. /usr/lib/python3.8/site-packages/
rm -r /opt/plcnext/public/dependencies/

echo "Changing permissions for execution"
chmod +x /opt/plcnext/trend.py
chmod +x /opt/plcnext/trend.sh

echo "Setting up init.d"
cp -a /opt/plcnext/trend.sh /etc/init.d/
cd /etc/init.d/
update-rc.d trend.sh defaults
./trend.sh start
rm -r /opt/plcnext/trend.sh

echo "Removing residual files"
cd /opt/plcnext/
rm -r README.md
rm -r install.sh

echo "Log file for errors is trending.log in the /opt/plcnext/logs folder."
echo "Install complete!"