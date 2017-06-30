# Expresso PHP

Express and simple docker setup for all your PHP development.

### Nginx + PHP

This branch is still on progress. For more stable, use the nginx branches.

What's included:

  - Nginx
  - PHP
  - Mariadb
  - PhpMyAdmin

Check the other branches of this repo for some more options.

### Official containers only
All of this is based on officials containers, so you won't download any
specific containers to use this project.

### PHP 7 or PHP 5?
You can switch between the latest release of PHP 7 or the latest of PHP 5, by
changing the first line of the file "docker/php/Dockerfile".
```
FROM php:5-fpm
```

### Get started
Add the project domain to your local Hosts file, and point it to
`127.0.100.100`.
- Paste the following into `/etc/hosts`
  (`c:\Windows\System32\drivers\etc\hosts` for Windows users):

        127.0.100.100  expresso.dev db.expresso.dev

    - Mac users: Run the following to attach an unused IP to the lo0 interface.

            sudo ifconfig lo0 alias 127.0.100.100/24

All your PHP files should be placed into the folder "web".

All your Drupal files should be placed into the folder "web".

Run docker compose.
```
$ docker-compose up -d
```

Place your PHP files in the folder called web.

That's it!

### Drush (command line tool for Drupal)

Run drush
```
$  docker-compose run --rm php_nginx drush help
```

### Database credentials
This is for development !!

* User: expresso-php
* Password: expresso-php
* Database: expresso-php

### MySQL and PhpMyAdmin credentials
To access PhpMyAdmin, run `docker ps` to get its dynamic port.
* Username: root
* Password: root
