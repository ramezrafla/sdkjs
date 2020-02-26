#!/bin/bash
echo "Removing all OnlyOffice server docker"
sudo docker kill $(sudo docker ps -q --filter ancestor=onlyoffice/documentserver )
sudo docker container prune -f
sudo docker volume prune -f
echo "Recomposing to create new server(s)"
cd docker-onlyoffice-nextcloud
sudo docker-compose up -d
echo "Sleeping 10s to let new server start"
sleep 10
echo "Updating OnlyOffice and rebuild SDKJS"
cd ..
./update-docker.sh
