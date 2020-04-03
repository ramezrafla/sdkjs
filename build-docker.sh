#!/bin/bash
CONTAINER=onlyoffice-document-server
LOCATION=/var/www/onlyoffice/documentserver/

cd build
if [ -z "$NOBUILD" ]
then
  export PRODUCT_VERSION="15.5.0"
  export BUILD_NUMBER="111"
  export PUBLISHER_URL="https://www.zegenie.com"
  if [ -z "$PRODUCTION" ]
  then
    grunt --level=WHITESPACE_ONLY --formatting=PRETTY_PRINT
  else
    echo "Production build"
    grunt --level=ADVANCED
  fi
fi

cd ../deploy/
# sudo docker exec onlyoffice-document-server /bin/bash -c "sudo rm -rf $LOCATION/sdkjs"
sudo docker cp sdkjs $CONTAINER:$LOCATION

# restart document-server
sudo docker exec onlyoffice-document-server supervisorctl restart all
