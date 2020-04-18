#!/bin/bash
KEY=~/.ssh/ec2.pem
LOCATION=/home/ubuntu/build_tools/out/linux_64/onlyoffice/documentserver

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
  export APP_COPYRIGHT="Copyright (C) ZeGenie Inc 2012-2020 All rights reserved"
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
  tar czf sdkjs.tgz sdkjs
  scp -i $KEY sdkjs.tgz $SERVER:$LOCATION
  ssh -i $KEY $SERVER "cd $LOCATION && tar xvf sdkjs.tgz"
  rm -f sdkjs.tgz > /dev/null
fi
