#!/bin/bash

BKDATE=$(date +"%Y-%m-%d_%H-%M")
PRNNAME=stampaTldOne
BKNAME=$PRNNAME.$BKDATE

echo "Copy BK of PRN : " $BKNAME

expect<<END
 spawn rsync -avr WildflyContainerSrc_xtcloud/$PRNNAME $XTCLOUD:/home/teledata/xtcloud/WildflyContainerSrc_xtcloud/$BKNAME
 expect "password:"
 send "Cremonese60\r"
 expect eof
END


echo "UPDATE " $PRNNAME

expect<<END2
 spawn rsync -avr WildflyContainerSrc_xtcloud/$PRNNAME $XTCLOUD:/home/teledata/xtcloud/WildflyContainerSrc_xtcloud
 expect "password:"
 send "Cremonese60\r"
 expect eof
END2


echo "DONE."


