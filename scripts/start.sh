#!/usr/bin/env bash
cd project/www
rm .htaccess
cp .htaccess.dev .htaccess
cd ../..
docker-compose up -d
echo "Dev server start at http://dev.syskon.cz:80__var_DEV_PORT__/www"
