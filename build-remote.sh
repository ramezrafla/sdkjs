#!/bin/bash
KEY=~/.ssh/ec2.pem
SERVER=ubuntu@office.docsgenius.com:/var/www/onlyoffice/documentserver/sdkjs
cd build
grunt
cd ../deploy/sdkjs/
scp -i $KEY word/sdk-all.js $SERVER/word
scp -i $KEY word/sdk-all-min.js $SERVER/word
scp -i $KEY slide/sdk-all.js $SERVER/slide
scp -i $KEY slide/sdk-all-min.js $SERVER/slide
scp -i $KEY cell/sdk-all.js $SERVER/cell
scp -i $KEY cell/sdk-all-min.js $SERVER/cell
scp -i $KEY -r common $SERVER/
