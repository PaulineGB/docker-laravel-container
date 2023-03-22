FROM php:8.1-apache

# Install dependencies
RUN apt-get update \
    && apt-get install -y nginx gnupg gosu curl ca-certificates libpq-dev libzip-dev zip unzip git supervisor libcap2-bin libpng-dev libfreetype6-dev libjpeg62-turbo-dev libcurl4-openssl-dev libc-client-dev libkrb5-dev libonig-dev libxml2-dev libedit-dev libicu-dev libldb-dev libldap2-dev libreadline-dev nodejs npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install PHP extensions
RUN docker-php-ext-configure intl \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install ldap imap intl gd curl pdo pdo_pgsql pgsql mbstring xml zip sockets bcmath soap \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

WORKDIR /var/www/

COPY ./docker /var/www

# Install composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./src /var/www

RUN composer install --optimize-autoloader --no-dev