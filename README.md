# Expresso PHP

Bored of complex implementations of Docker for you development workflow?
This is a fast and simple Docker setup for all your PHP development. Quick but not dirty. Tested with:

* Drupal 7 and Drupal 8
* Wordpress
* Laravel

We won't force you to download our own images. Eveything is done using the official images of PHP, Nginx ... etc.

## In this branch: Nginx + PHP + friends

What's included:

  - Nginx
  - PHP
  - Mariadb
  - PhpMyAdmin
  - Mailhog

All using on official images.
Check the other branch of this repo for Apache + PHP.

### Official containers only
We won't force you to download our own images.
All of this is based on officials containers, so you won't download any specific containers to use this project. 

All you have all the options available as soon as they are released on Docker Hub by PHP, Nginx, Apache ... etc.

### PHP 7.0? PHP 7.1? or PHP 5.6?
You can switch between the latest release of PHP 7 or the latest of PHP 5, by
changing the first line of the file "docker/php/Dockerfile". For the latest version of PHP 5:
```
FROM php:5-fpm
```

Extra PHP librairies?
Check the same file: docker/php/Dockerfile
You can add your own librairies.

Everytime you change a dockerfile (example "docker/php/Dockerfile"), you need to rebuild your containers with the docker compose command "build --no-cache --force" and run again "composer up -d".

### More PHP versions?
This project uses the official images from PHP, see all available options on: [PHP's official Docker Hub page](https://hub.docker.com/_/php/).

## Get started
All your PHP files should be placed into the folder "web".

Create the Expresso PHP containers for your project:
```
$ docker-compose up -d
```

This is only for the first time, to create the containers. Next time you can just start them:
```
$ docker start
```

Check which port is Nginx using with
```
$ docker ps
```

That's it! Visit http://localhost:32770 (where 32770 is my application's port) or http://192.168.99.100:32770 (if you use a VM like [dinghy](https://github.com/codekitchen/dinghy)).

### Place your PHP code into the folder web
Place your PHP project in the folder called web.
```
$ cd web
```

To stop Expresso PHP:
```
$ docker-compose stop
```

### SSH the containers

To SSH the container with PHP:
```
$ docker-compose exec php_nginx /bin/bash
```

### Drush (command line tool for Drupal)

Once you have placed your project into the "web" folder, you can run drush:
```
$  docker-compose exec php_nginx drush help
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

