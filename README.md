# Scheduling code on init.d with PLCnext #

## **Please read all instructions CAREFULLY. There are known "gotchas" that are listed in the instructions.** ##

## 1. Installation of example
1. Download all files onto your PC, then connect to the PLCnext via WinSCP or your favorite SSH client.
2. Copy this repo to the `````/opt/plcnext/````` directory on the PLCnext.
3. Log onto the PLCnext via PuTTY or your favorite SSH client.
4. Log in as the root user.
5. Run the below commands:
```
chmod +x install.sh
./install.sh
```

Once the script returns "Install Complete", the init.d service is installed and running. Go to ````` /opt/plcnext/logs/hello.log ````` to see the example Python script running. 

## 2. Modifying the init.d service for your application
### The init.d file (python.sh in the example) ###

  a. Inside the init.d file, you will see these lines of code:
  ```
  # Change the next 3 lines to suit where you install your script and what you want to call it
  DIR=/opt/plcnext
  DAEMON=$DIR/helloworld.py
  DAEMON_NAME=hello
  ```
  b. These lines **must** be modified to match the location of your script (DIR), name of your script (DAEMON), and name of your sevice (DAEMON_NAME).
  c. (Optional) If you are making modifications to the filesystem or reading files that require elevated permissions, change the below line:
  ```
  DAEMON_USER=admin
  ```
  To:
  ```
  DAEMON_USER=root
  ```
  To prevent any issues with bad permissions. **If you do this, you must make sure the init.d file and your Python script are executable as root**
### The script (helloworld.py in the example) ###

  a. When changing the Python script to your script of choice, make sure the script will run by bashing it.
  Example:
  ```
  ./helloworld.py
  ```
  **If the script does not run in this format the init.d service will not work.**
  b. If accessing any data from PLCnext Engineer, put **at least** a 45 second delay for the PLCnext Runtime to start. Also note that it is good practice to have error   catches to prevent these issues from occuring if the PLC ever fails for any reason!
