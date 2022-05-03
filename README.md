### Historical Trending with PLCnext ###
This application allows historical trending for up to 19 different tags from PLCnext Engineer.

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

Once the script returns "Install Complete", the Trending code is installed. The trending graph will now be available to use.

## 2. PLCnext Engineer Setup
### Data Logger Setup 
**NOTE: Maximum of 19 tags**
1. Navigate to the PLCnext tab in the Plant window, then to the Data Logger Sessions page.
2. Create a new Session called "Trending" **NOTE: This is caps sensitive!**
3. Add your tags you would like to log, and set up the file for your preferred method.
4. Change the Timestamp format to ISO 8601.

### Navigating to the Trending page via the eHMI
1. Create an eHMI tag named ```trendingURL``` The trend page will automaticially send the URL to this tag.
**NOTE: This is caps sensitive!**
2. Add a button on the eHMI screen, and select Dynamics.
3. Add an Action on Click dynamic, and select the Execute Command Action.
4. Choose the Open URL Command type, and for the Command URL put ```trendingURL```

**(Optional) Hiding the button if the URL isnt present**
1. Add a new dynamic to the button for Visibility.
2. In the variable box enter this code: ```trendingURL=''```
3. For Hide When, change this to true.
4. Make sure the Visibility dynamic is **above** the Action on Click.

**Additional optional configurations:**

**Changing the title of the Trending Page**
1. Add an eHMI tag named ```graphTitle```, and set its initial value to the name you would like the graph to be.
**NOTE: This is caps sensitive!**

## 3. Using the Trending page
On startup, the trending page will display the last 24 hours worth of data from the data logger.
**NOTE: If no URL shows up for the ```trendingURL``` tag, there is no database for the trending page to display. Create the Data Log session first!**

To choose the historical data you would like to view, select a Start Date and End Date for the tags and click Submit.

The Trending page will then load in the variables data within that time frame.

The Trending page also has a Zoom and Pan function. To zoom into the graph, simply zoom in with your mouse. To pan, click and drag in the direction you would like to pan.
