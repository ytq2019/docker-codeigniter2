FROM php:5.6-fpm

RUN apt-get update && apt-get -y --no-install-recommends install \
    libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev \
    memcached \
    libmemcached-dev zlib1g-dev \
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install mysql pdo_mysql \
    && echo date.timezone=Asia/ShangHai >> /usr/local/etc/php/conf.d/php.ini \
    && echo upload_max_filesize = 100M >> /usr/local/etc/php/conf.d/php.ini \
    && echo post_max_size = 108M >> /usr/local/etc/php/conf.d/php.ini \
    && echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini \
    && apt-get autoremove -y \
    && apt-get \
    && rm -rf /tmp/* /var/tmp/*
