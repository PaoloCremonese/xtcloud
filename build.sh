#!/bin/bash

# Build XTCLOUD script

echo "Build XTCLOUD containers"

# 1.  stop containers
echo "Stop containers"
cd /home/teledata/xtcloud
docker compose down

# 2.  supposing all the files has been placed in the right place, build the container
echo "Build Wildfly"
cd /home/teledata/xtcloud/WildflyContainerSrc_xtcloud
docker build --tag paolocremonese/wf-9.0.2.final:xtcloud .

# 3.  start the container again
echo "Start containers again"
cd /home/teledata/xtcloud
docker compose up --detach

echo "DONE !!!"



