### Scheduling code on Init.d with PLCnext ###
This is an example init.d code service.

## 1. Installation
1. Download all files onto your PC, then connect to the PLCnext via WinSCP or your favorite SSH client.
2. Copy all files to the `````/opt/plcnext/````` directory on the PLCnext.
3. Log onto the PLCnext via PuTTY or your favorite SSH client.
4. Log in as the root user.
5. Run the below commands:
```
chmod +x install.sh
./install.sh
```

Once the script returns "Install Complete", the init.d service is installed and running. 

## 3. Using the Trending page
On startup, the trending page will display the last 24 hours worth of data from the data logger.
**NOTE: If no URL shows up for the ```trendingURL``` tag, there is no database for the trending page to display. Create the Data Log session first!**

To choose the historical data you would like to view, select a Start Date and End Date for the tags and click Submit.

The Trending page will then load in the variables data within that time frame.

The Trending page also has a Zoom and Pan function. To zoom into the graph, simply zoom in with your mouse. To pan, click and drag in the direction you would like to pan.
