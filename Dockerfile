FROM php:8.0.0-apache
RUN apt-get update \
  && apt-get install -y libpng-dev zlib1g-dev libicu-dev libfreetype6-dev libjpeg62-turbo-dev g++ \
  && apt-get clean \
  && a2enmod rewrite \
  && docker-php-ext-configure intl
RUN apt-get update && apt-get install -y libz-dev libmemcached-dev
RUN pecl install memcached
RUN echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini
# GD extension
RUN docker-php-ext-install -j$(nproc) gd
# intl extension
RUN docker-php-ext-install mysqli pdo_mysql intl

# set custom php.ini file for development
COPY env/php.ini /usr/local/etc/php

# update and install zip and unzip - required by composer
RUN apt-get update && apt-get install zip unzip

# install composer
RUN curl -s --show-error http://getcomposer.org/installer | php
RUN mv ./composer.phar /usr/local/bin/composer

# set new created file to have full access permissions
RUN echo "umask 000" >> /etc/apache2/envvars
