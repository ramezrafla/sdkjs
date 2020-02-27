#!/bin/bash
CONTAINER=onlyoffice-document-server
cd build
grunt --level=WHITESPACE_ONLY --noclosure=true --formatting=PRETTY_PRINT
cd ../deploy/sdkjs/
sudo docker cp word/sdk-all.js $CONTAINER:/var/www/onlyoffice/documentserver/sdkjs/word
sudo docker cp word/sdk-all-min.js $CONTAINER:/var/www/onlyoffice/documentserver/sdkjs/word
sudo docker cp slide/sdk-all.js $CONTAINER:/var/www/onlyoffice/documentserver/sdkjs/slide
sudo docker cp slide/sdk-all-min.js $CONTAINER:/var/www/onlyoffice/documentserver/sdkjs/slide
sudo docker cp cell/sdk-all.js $CONTAINER:/var/www/onlyoffice/documentserver/sdkjs/cell
sudo docker cp cell/sdk-all-min.js $CONTAINER:/var/www/onlyoffice/documentserver/sdkjs/cell
sudo docker cp common $CONTAINER:/var/www/onlyoffice/documentserver/sdkjs
