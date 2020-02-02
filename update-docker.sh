#!/bin/bash
sudo docker cp /home/ramez/temp/documentserver.tgz onlyoffice-document-server:/var/www/onlyoffice
sudo docker exec onlyoffice-document-server bash -c "rm -rf /var/www/onlyoffice/documentserver"
sudo docker exec onlyoffice-document-server bash -c "cd /var/www/onlyoffice/ && tar xvf documentserver.tgz"
sudo docker exec onlyoffice-document-server bash -c "rm -f /var/www/onlyoffice/documentserver.tgz"
sudo docker exec onlyoffice-document-server supervisorctl restart all
./build-docker.sh
