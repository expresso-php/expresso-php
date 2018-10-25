# Change line below based on the PHP version that you desire.
# ie: 'php:7.1-fpm' for PHP version 7.1
FROM php:7-fpm

RUN apt-get update -qq \
  && apt-get install wget mysql-client -yq

# Install the PHP extensions we need.
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libpq-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mbstring opcache pdo pdo_mysql pdo_pgsql zip
# Set recommended PHP.ini settings.
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
        echo 'opcache.memory_consumption=128'; \
        echo 'opcache.interned_strings_buffer=8'; \
        echo 'opcache.max_accelerated_files=4000'; \
        echo 'opcache.revalidate_freq=0'; \
        echo 'opcache.fast_shutdown=1'; \
        echo 'opcache.enable_cli=1'; \
    } > /usr/local/etc/php/conf.d/opcache-recommended.ini

# Install MailHog Sendmail support.
RUN apt-get update -qq && apt-get install -yq git golang-go &&\
    mkdir -p /opt/go &&\
    export GOPATH=/opt/go &&\
    go get github.com/mailhog/mhsendmail

# Copy PHP configs.
COPY conf.d/* /usr/local/etc/php/conf.d/
RUN chmod 644 /usr/local/etc/php/conf.d/*

# Install drush.
# Download Drush 8.1.16 from github.com/drush-ops/drush/releases. This is a temporary fix.
RUN php -r "readfile('https://github.com/drush-ops/drush/releases/download/8.1.16/drush.phar');" > drush
# Test your install.
RUN php drush core-status
# Make `drush` executable as a command from anywhere. Destination can be anywhere on $PATH.
RUN chmod +x drush
RUN mv drush /usr/local/bin

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Install and setup XDebug.
# Un-comment script below to enable XDebug.
##############################################
# RUN cd ~/ \
#    && wget http://xdebug.org/files/xdebug-2.6.1.tgz \
#    && tar -xvzf ~/xdebug-2.6.1.tgz \
#    && cd ~/xdebug-2.6.1 \
#    && phpize \
#    && ./configure \
#    && make \
#    && cp modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20160303/xdebug.so

#RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
#RUN { \
#        echo 'zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20160303/xdebug.so'; \
#        echo '[XDebug]'; \
#        echo 'xdebug.remote_enable = 1'; \
#        echo 'xdebug.remote_autostart = 1'; \
#        echo 'xdebug.remote_host = 192.168.1.19'; \
#        echo 'xdebug.remote_port = 9000'; \
#    } >> /usr/local/etc/php/php.ini
##############################################

WORKDIR /var/www/web
