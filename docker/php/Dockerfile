FROM php:7-apache

RUN apt-get update -qq \
  && apt-get install wget mysql-client -yq

RUN a2enmod rewrite

ADD vhost.conf /etc/apache2/sites-available/000-default.conf

RUN a2ensite 000-default

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mbstring opcache pdo pdo_mysql pdo_pgsql zip
# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
        echo 'opcache.memory_consumption=128'; \
        echo 'opcache.interned_strings_buffer=8'; \
        echo 'opcache.max_accelerated_files=4000'; \
        echo 'opcache.revalidate_freq=0'; \
        echo 'opcache.fast_shutdown=1'; \
        echo 'opcache.enable_cli=1'; \
    } > /usr/local/etc/php/conf.d/opcache-recommended.ini

# Install drush.
# Download latest stable release using the code below or browse to github.com/drush-ops/drush/releases.
RUN php -r "readfile('https://s3.amazonaws.com/files.drush.org/drush.phar');" > drush
# Or use our upcoming release: php -r "readfile('https://s3.amazonaws.com/files.drush.org/drush-unstable.phar');" > drush
# Test your install.
RUN php drush core-status
# Make `drush` executable as a command from anywhere. Destination can be anywhere on $PATH.
RUN chmod +x drush
RUN mv drush /usr/local/bin

# Update the www-data services's uid & gid to match the mounted file system.
# As a default, use 1000:1000.
ARG HOST_UID=1000
ARG HOST_GID=1000
RUN usermod -u ${HOST_UID} www-data &&\
    groupmod -g ${HOST_GID} www-data

# Change ownership of some system directories to grant control to `www-data`.
RUN chown www-data:www-data /var/www &&\
    chown -Rf www-data:www-data /usr/local/etc/php &&\
    chown -Rf www-data:www-data /tmp

WORKDIR /var/www/web
