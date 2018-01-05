# Expresso PHP

Express and simple docker setup for all your PHP development.

### Apache + PHP

What's included:

  - Apache
  - PHP
  - Mariadb
  - PhpMyAdmin
  - Mailhog

Check the other branches of this repo for some more options.

### Official containers only
All of this is based on officials containers, so you won't download any
specific containers to use this project.

### PHP 7 or PHP 5?
You can switch between the latest release of PHP 7 or the latest of PHP 5, by
changing the first line of the file "docker/php/Dockerfile".
```
FROM php:5-apache
```

### Get started
All your Drupal files should be placed into the folder "web".

Identify your host machine's user & group id's and reassign the Docker container
service `www-data` user & group id's to read and write files with uid:gid values
equal to the host machine. Run the following to declare uid and gid values in
Docker-Compose environment variable file `/.env`.
```sh
echo "HOST_UID=$(id -u)" > .env
echo "HOST_GID=$(id -g)" >> .env
```

Run docker compose.
```
$ docker-compose up -d
```

Place your PHP files in the folder called web.

That's it!

### Drush (command line tool for Drupal)

Run drush
```
$  docker-compose run --rm php_apache drush help
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
