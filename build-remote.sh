#!/bin/bash
KEY=~/.ssh/ec2.pem
SERVER=ubuntu@office.docsgenius.com:/var/www/onlyoffice/documentserver/sdkjs
cd build
grunt
cd ../deploy/sdkjs/
echo Pushing common
scp -i $KEY -r common $SERVER/
echo Pushing Document
scp -i $KEY word/sdk-all.js $SERVER/word
scp -i $KEY word/sdk-all-min.js $SERVER/word
echo Pushing Presentation
scp -i $KEY slide/sdk-all.js $SERVER/slide
scp -i $KEY slide/sdk-all-min.js $SERVER/slide
echo Pushing Sheet
scp -i $KEY cell/sdk-all.js $SERVER/cell
scp -i $KEY cell/sdk-all-min.js $SERVER/cell
