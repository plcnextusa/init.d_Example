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

## 3. Modifying the init.d service
