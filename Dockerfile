FROM php:5.6-fpm

RUN apt-get update && apt-get -y --no-install-recommends install \
    libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev \
    memcached \
    libmemcached-dev zlib1g-dev \
    && pecl install memcached-2.2.0 memcache-2.2.7 \
    && docker-php-ext-enable memcached memcache \
    && docker-php-ext-install mysql pdo_mysql mcrypt mysqli \
    && echo date.timezone=Asia/ShangHai >> /usr/local/etc/php/conf.d/php.ini \
    && echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini \
    && apt-get autoremove -y \
    && rm -rf /tmp/* /var/tmp/*
