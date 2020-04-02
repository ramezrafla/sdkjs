#!/bin/bash
CONTAINER=onlyoffice-document-server
LOCATION=/var/www/onlyoffice/documentserver/sdkjs
cd build
grunt --level=WHITESPACE_ONLY --formatting=PRETTY_PRINT
cd ../deploy/sdkjs/
sudo docker exec $CONTAINER /bin/bash -c "cd $LOCATION && find . -type f -name '*.gz' -delete"
sudo docker cp word/sdk-all.js $CONTAINER:$LOCATION/word
sudo docker cp word/sdk-all-min.js $CONTAINER:$LOCATION/word
sudo docker cp slide/sdk-all.js $CONTAINER:$LOCATION/slide
sudo docker cp slide/sdk-all-min.js $CONTAINER:$LOCATION/slide
sudo docker cp cell/sdk-all.js $CONTAINER:$LOCATION/cell
sudo docker cp cell/sdk-all-min.js $CONTAINER:$LOCATION/cell
sudo docker cp common $CONTAINER:$LOCATION
