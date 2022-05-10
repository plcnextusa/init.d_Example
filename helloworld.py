#!/usr/bin/env python3

# import dependencies
import time
import logging
from logging.handlers import RotatingFileHandler

# Initialize log file
logging.basicConfig(handlers=[RotatingFileHandler('/opt/plcnext/logs/hello.log', maxBytes=1000000, backupCount=1)],level=logging.INFO, format="[%(asctime)s] %(levelname)s [%(name)s.%(funcName)s:%(lineno)d] %(message)s", datefmt='%Y-%m-%dT%H:%M:%S')

# Main program execution
if __name__ == '__main__':
    # Infinite Loop
    while 1:
        # Logging a hello message to show the script is running
        logging.info("Hello from init.d!")
        # 10 second delay between logging events
        time.sleep(10)
