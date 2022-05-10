# Scheduling code on init.d with PLCnext #

## **Please read all instructions CAREFULLY. There are important steps that can be easily missed that are listed in the instructions.** ##

## Installation of example ##
1. Download all files onto your PC, then connect to the PLCnext via WinSCP or your favorite SSH client.
2. If you downloaded this repository as a ZIP, make sure you extract the folder and copy all of the contents of the folder.
3. Copy the files from this repository to the `````/opt/plcnext/````` directory on the PLCnext.
4. Log onto the PLCnext via PuTTY or your favorite SSH client.
5. Log in as the root user.
6. Run the below commands:
```
chmod +x install.sh
./install.sh
```
Once the script returns "Install Complete", the init.d service is installed and running. 

To make sure that the service is running, run this command:
```
tail -f /opt/plcnext/logs/hello.log 
```

This command attaches to the end of the log file and shows updates of the file. You should see a new line added to the log file every 10 seconds, which is indicated by the timestamp at the start of each line.

## Updating your init.d service if you make a code change ##
1. If you make a modification to your code after installing your init.d service, you must restart the init.d service for the changes to take effect. To restart your init.d service, enter the below command:
```
/etc/init.d/python.sh restart
```
Change the name of the init.d file (python.sh) to the name of your init.d file if you created your own.

## Un-installing the example, or removing an init.d service ##
1. To remove a code service navigate to the ```/etc/init.d/``` directory and execute the below commands:
```
update-rc.d -f python.sh remove
rm -r python.sh
```
To remove your own code service, make sure you replace the name of the init.d file (python.sh) with the name of your init.d file.

**NOTE: Be careful with these commands! If you remove a service that you did not create, the PLC could fail or be bricked! If you remove any of the existing services you are doing this at your own risk!**

## Modifying the init.d example service for your application ##
### The init.d file (python.sh is the init.d file in the example) ###

  1. Inside the init.d file (python.sh), you will see these lines of code:
  ```
  # Change the next 3 lines to suit where you install your script and what you want to call it
  DIR=/opt/plcnext
  DAEMON=$DIR/helloworld.py
  DAEMON_NAME=hello
  ```
  2. These lines **must** be modified to match the location of your script (DIR), name of your script (DAEMON), and name of your sevice (DAEMON_NAME).
  
  3. (Optional) If you are making modifications to the filesystem or reading files that require elevated permissions, change the below line:
  ```
  # Change the uuser that runs the script if accessing files. Otherwise keep as admin.
  DAEMON_USER=admin
  ```
  To:
  ```
  # Change the uuser that runs the script if accessing files. Otherwise keep as admin.
  DAEMON_USER=root
  ```
  To prevent any issues with bad permissions. **If you do this, you must make sure the init.d file and your Python script are executable as root!**
### The script (helloworld.py) ###

  1. When changing the Python script to your script of choice, make sure the script will run without errors by bashing it:
  Example:
  ```
  ./helloworld.py
  ```
  Replace helloworld.py with your script file name.
  
  **If the script does not run in this format, scheduling the code as an init.d service will not work.**
  
  2. If accessing any data from PLCnext Engineer, put **at least** a 45 second delay at the start of the script for the PLCnext Runtime to start. Also note that it is good practice to have error catches to prevent these issues from occuring if the PLC ever fails for any reason!

### The install.sh (or the commands to manually add or update) ###
  #### Modifying the install.sh from the example ####
  1. When changing the install script to install your script of choice, make the below modifications to ensure that init.d sets up the code service properly.<br />
    a. Change the below section to make sure the name of the init.d file (python.sh) and script (helloworld.py) are correct. 
    
  ```
  echo "Changing permissions for execution"
  chmod +x /opt/plcnext/helloworld.py
  chmod +x /opt/plcnext/python.sh
  ```
  2. Change the below section to make sure the name of the init.d file (python.sh) is correct.
  ```
  echo "Setting up init.d"
  cp -a /opt/plcnext/python.sh /etc/init.d/
  cd /etc/init.d/
  update-rc.d python.sh defaults
  ./python.sh start
  rm -r /opt/plcnext/python.sh
  ```
  #### Manually adding your code service ####
  1. Make sure the init.d file (python.sh) and the script (helloworld.py) are executable by running this command, which adds the permission for any user to execute the files:
  ```
  chmod +x python.sh
  chmod +x helloworld.py
  ```
  2. Test that your script can execute by bashing it using this command:
  ```
  ./helloworld.py
  ```
  **Replace helloworld.py with the name of your script.**<br />
  
  3. Move the init.d file (python.sh) to the ```/etc/init.d/``` directory using the below command:
  ```
  mv python.sh /etc/init.d/
  ```
  4. Add the init.d file (python.sh) to the system service list, with the default startup options using the below command:
  ```
  update-rc.d python.sh defaults
  ```
  5. Start your new code service by executing the start command of the init.d file (python.sh) using the below command:
  ```
  ./python.sh start
  ```
  Now your service is running on init.d!
