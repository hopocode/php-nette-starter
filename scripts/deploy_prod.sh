#!/bin/sh
cd project/www
rm .htaccess
cp .htaccess.prod .htaccess
cd ../..
sh deployment/deploy.sh ./deployment.prod.ini
