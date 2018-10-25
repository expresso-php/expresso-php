# Expresso PHP

This is a fast and simple Docker setup for all your PHP development. Quick but not dirty.

Tested with:

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

Everytime you change a dockerfile (example "docker/php/Dockerfile"), you need to rebuild your containers with the docker compose command `docker-compose build --no-cache --force` and run again `docker-compose up -d`.

### More PHP versions?
This project uses the official images from PHP, see all available options on: [PHP's official Docker Hub page](https://hub.docker.com/_/php/).

## Get started
1. Install the prerequisites.
2. Create the docker containers.
3. Place your files in web.

### Install the prerequisites
*Linux*
You can use the official documentation on installing Docker: https://docs.docker.com/install/

*macOS*
We recommend you to use "Dinghy" for faster development using Docker on MacOS.
Follow the steps: https://github.com/codekitchen/dinghy#install
Then install docker-compose using brew:
``
brew install docker docker-machine
``

*Windows*
It seems that Docker is supported only by Windows 10 pro edition. The official documentation on installing
[Docker](https://docs.docker.com/install/)

### Create the docker containers
1. Download this project and rename the folder according to your project.
A good practice is to create a folder called "docker" in your home directory, this is where you will keep all your docker projects. In command line, this would be:
```
$ cd ~
$ mkdir docker
$ git clone https://github.com/expresso-php/expresso-php.git myproject
```
2. Create the Expresso PHP containers for your project:
```
$ docker-compose up -d
```
This is only for the first time, to create the containers. Next time you can just start them with:
``
$ docker start
``
3. Check which port is Nginx using with:
```
$ docker ps
```
Look for a line with the port number. For example: "myproject_nginx_1        nginx -g daemon off;            Up      0.0.0.0:**32770**->80/tcp", in this case "32770" is my port number.

That's it! Visit http://localhost:32770 (replace 32770 with your application's port) or http://192.168.99.100:32770 (if you use a VM like [dinghy](https://github.com/codekitchen/dinghy)).

### Place your files in web.
Expresso PHP will be looking for PHP files placed into the folder web.
You can delete the existing web folder, and replace it by your project.

If your project is on git, a good practice is to do a symlink to your project. According to the previous step in this README, here is how to do in command line:
```
$ cd docker
$ cd myproject
$ rm -rf web
```
Git clone or download your project, example:
```
git clone https://github.com/myproject/myproject.git myproject
```
Create a symlink with your project's php files and web, example:
```
$ ln -s myproject/docroot web
```

## Useful commands
To start Expresso PHP:
```
$ docker-compose start
```

To stop Expresso PHP:
```
$ docker-compose stop
```

To SSH the containers
```
$ docker-compose exec php_nginx /bin/bash
```

Drush (command line tool for Drupal)
```
$  docker-compose exec php_nginx drush help
```

Import database with Drupal and Drush
```
$  docker-compose run --rm php_nginx bash -c '$(drush sql-connect)' < my_database.sql
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

## Install and setup XDebug
Un-comment script below:
```
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
```
Change the value of `xdebug.remote_host` based on the IP Address in your local machine.

### VSCode Setup
By now you should have already setup expresso-php with your project based on instruction above.

1. Setup the workspace.

* Go to 'File' -> 'Open Workspace' -> ./docker/myproject/docroot/index.php'

2. Configure XDebug setting.

* Click 'Debug' tab on the left side.
* Click gear-like button just on the top, then `launch.json` will be open.
* Configure the settings something as below:
```
{
  // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Listen for XDebug",
      "type": "php",
      "request": "launch",
      "port": 9000,
      "pathMappings": {
        "/var/www": "/Users/someuser/Sites/docker"
      },

    },
    {
      "name": "Launch currently open script",
      "type": "php",
      "request": "launch",
      "program": "${file}",
      "cwd": "${fileDirname}",
      "port": 9000
    }
  ]
}
```
Please note that value of `"/docker"` in `pathMappings` may differ, which is based on your local absolute directory where root folder of `expresso-php` located.