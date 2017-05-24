#!/bin/sh

# Change user:group id values for 'www-data:www-data' to match the uid:gid of
# the project docroot, unless the uid:gid are set to 0:0.
USER_ID=$(stat -c '%u' /var/www/html)
GROUP_ID=$(stat -c '%g' /var/www/html)
if [ $USER_ID != 0 ]; then
  usermod -u $USER_ID www-data
fi
if [ $GROUP_ID != 0 ]; then
  groupmod -g $GROUP_ID www-data
  find /var/www -group 33 -exec chgrp -h www-data {} \;
fi

if [ $1 = "apache2-foreground" ] || [ $1 = "php-fpm" ]; then
  # If first arg is `php` or `php-fpm`, then run as user root.
  exec "$@"
elif [ -n $1 ]; then
  # If first arg is anything else, then execute as user "www-data".
  exec /usr/local/bin/gosu www-data "$@"
else
  # If entrypoint.sh is called with no arg, execute as user root.
  exec "$@"
fi
