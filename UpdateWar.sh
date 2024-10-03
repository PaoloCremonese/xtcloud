#!/bin/bash

BKDATE=$(date +"%Y-%m-%d_%H-%M")
BKNAME=TeleCloudONE.war.$BKDATE
WARNAME=TeleCloudONE.war

echo "Copy BK WAR to " $BKNAME

expect<<END
 spawn rsync -avr WildflyContainerSrc_xtcloud/$WARNAME $XTCLOUD:/home/teledata/xtcloud/WildflyContainerSrc_xtcloud/$BKNAME
 expect "password:"
 send "Cremonese60\r"
 expect eof
END

echo "UPDATE " $WARNAME

expect<<END2
 spawn rsync -avr WildflyContainerSrc_xtcloud/$WARNAME $XTCLOUD:/home/teledata/xtcloud/WildflyContainerSrc_xtcloud
 expect "password:"
 send "Cremonese60\r"
 expect eof
END2


echo "DONE."


