#!/bin/sh
# This is intended to be run by crontab to automatically renew inkCert Proper certs

# Include settings
. /opt/verb/conf/sitenameip

# Stop Apache
apachectl -k graceful-stop
## Hard stop in case it doesn't work
service apache2 stop

# Renew
### Put the inkCert Proper renew script here!!!!!

# Start Apache
service apache2 start

# Finish
exit 0

