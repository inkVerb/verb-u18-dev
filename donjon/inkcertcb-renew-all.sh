#!/bin/sh
# This is intended to be run by crontab to automatically renew Certbot-DigitalOcean-API certs

# Include settings
. /opt/verb/conf/sitenameip

# Stop Apache
apachectl -k graceful-stop
## Hard stop in case it doesn't work
service apache2 stop

# Renew LE
certbot renew

# Log
if [ $? -ne 0 ]
 then
        ERRORLOG=`tail /var/log/inkcert/inkcertle.log`
        echo -e "The Lets Encrypt verb.ink cert has not been renewed! \n \n" $ERRORLOG | mail -s "Lets Encrypt Cert Alert" ${SITEINKCERTEMAIL}   
fi

# Start Apache
service apache2 start

# Finish
exit 0

