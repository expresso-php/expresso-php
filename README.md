# Simple Docker Drupal

A simple Docker & Drupal for development. This is all.

### Nginx server + PHP 5.6
What's included:

  - Nginx
  - PHP 5.6 (fpm)
  - Mariadb

Check the other branches of this repo for some more options (php 7 or apache).

### Official containers only
All of this is based on officials containers, so you won't download any
specific containers to use this project.

### Get started
All your Drupal files should be placed into the folder "web".

Run docker compose.
```sh
$ docker-compose up -d
```

Import your database or install your site.
```sh
$  docker-compose run --rm php ./../vendor/bin/drush site-install
```

### Database credentials
This is for development !!

* User: drupal
* Password: drupal
* Database: drupal
