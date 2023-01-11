#!/usr/bin/env bash
# build images
docker-compose build
# initialize project and instal dependencies by composer
docker-compose run --user="$UID" web sh init.sh
