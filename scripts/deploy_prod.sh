#!/bin/sh
echo "Production deployment start."
echo "************* __PROJECT_NAME__ ***********"
echo "******************************************"
cd project/www
rm .htaccess
cp .htaccess.prod .htaccess
cd ../..
sh deployment/deploy.sh ./deployment.prod.ini
