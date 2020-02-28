#!/bin/bash
KEY=~/.ssh/ec2.pem
SERVER=ubuntu@server.office2.io:/var/www/onlyoffice/documentserver/
export PRODUCT_VERSION="15.2.0"
export BUILD_NUMBER="111"
cd build
grunt --level=ADVANCED
cd ..
cd deploy/
scp -i $KEY -r sdkjs $SERVER
