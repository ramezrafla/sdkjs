#!/bin/bash
KEY=~/.ssh/ec2.pem
LOCATION=/var/www/onlyoffice/documentserver
if [ -z "$DEV" ]
then
  SERVER=ubuntu@server.office2.io
else
  SERVER=ubuntu@server-dev.office2.io
fi

echo "Server: $SERVER"

if [ -z "$NOBUILD" ]
then
  echo "-- Building"
  export PRODUCT_VERSION="15.5.0"
  export BUILD_NUMBER="111"
  export PUBLISHER_URL="https://www.zegenie.com"
  cd build
  grunt --level=ADVANCED
  cd ..
fi

if [ -z "$NOPUSH" ]
then
  echo "-- Pushing to server"
  cd deploy/
  rm -f sdkjs.tgz > /dev/null
  tar cz sdkjs.tgz sdkjs
  scp -i $KEY sdkjs.tgz $SERVER:$LOCATION
  ssh -i $KEY $SERVER "cd $LOCATION && sudo chown ubuntu:ubuntu -R sdkjs && tar xvf sdkjs.tgz"
  rm -f sdkjs.tgz > /dev/null
fi
