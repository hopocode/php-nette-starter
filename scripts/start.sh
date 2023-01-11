#!/usr/bin/env bash
echo "Starting app docker for development."
echo "************* __PROJECT_NAME__ ***********"
echo "******************************************"

cd project/www
rm .htaccess
cp .htaccess.dev .htaccess
cd ../..
docker-compose up -d
echo "Dev server start at http://dev.syskon.cz:__DEV_PORT__/www"
