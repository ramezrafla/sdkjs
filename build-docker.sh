#!/bin/bash
CONTAINER=onlyoffice-document-server
LOCATION=/var/www/onlyoffice/documentserver/

cd build
if [ -z "$NOBUILD" ]
then
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
