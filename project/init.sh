#!/usr/bin/env bash
mkdir -p temp/cache
mkdir log
chmod -R 777 temp
chmod 777 log
composer create-project nette/web-project
