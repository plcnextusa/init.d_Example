#!/bin/sh

### BEGIN INIT INFO
# Provides:          myservice
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Put a short description of the service here
# Description:       Put a long description of the service here
### END INIT INFO

# Change the next 3 lines to suit where you install your script and what you want to call it
DIR=/opt/plcnext
DAEMON=$DIR/helloworld.py
DAEMON_NAME=hello

DAEMON_USER=admin

# The process ID of the script when it runs is stored here:
PIDFILE=/var/run/$DAEMON_NAME.pid

do_start () {
    # Starts the daemon (our python script) in the background with the configured DAEMON_USER
    start-stop-daemon --start --background --pidfile $PIDFILE --make-pidfile --user $DAEMON_USER --chuid $DAEMON_USER --startas $DAEMON -- $DAEMON_OPTS
}
do_stop () {
    # Starts the daemon (our python script) based to the process id, after 10 retries it just kills the process
    start-stop-daemon --stop --pidfile $PIDFILE --retry 10
}

#keys to call the script, e.g. ./pystart.sh start
case "$1" in

    start|stop)
        do_${1}
        ;;

    restart|reload|force-reload)
        do_stop
        do_start
        ;;

    *)
        echo "Usage: /etc/init.d/$DAEMON_NAME {start|stop|restart}"
        exit 1
        ;;

esac
exit 0
