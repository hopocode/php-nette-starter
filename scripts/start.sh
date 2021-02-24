#!/usr/bin/env bash
cd project/www
rm .htaccess
cp .htaccess.dev .htaccess
cd ../..
docker-compose up -d
echo "Dev server start at http://dev.syskon.cz:__DEV_PORT__/www"
