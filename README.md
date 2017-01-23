# Expresso PHP

Express and simple docker setup for all your PHP development.

### Apache + PHP

This branch is still on progress. For more stable, use the apache branches.

What's included:

  - Apache
  - PHP
  - Mariadb

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
$  docker-compose run --rm php drush help
```

### Database credentials
This is for development !!

* User: drupal
* Password: drupal
* Database: drupal
