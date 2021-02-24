#!/bin/sh
cd project
cp -R adminer www
cp -R checker www
cp -R info www
cd www
rm .htaccess
cp .htaccess.prod .htaccess
cd ../..
sh deployment/deploy.sh ./deployment.dev.ini
cd project/www
rm -Rf adminer
rm -Rf checker
rm -Rf info
