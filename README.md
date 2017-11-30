# Expresso PHP

Express and simple docker setup for all your PHP development.

### Nginx + PHP

This branch is still on progress. For more stable, use the nginx branches.

What's included:

  - Nginx
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

### SOLR Integration
To enable SOLR, uncomment corresponding lines from docker-compose.yml file.
Current version is 7.1.0, to use a different version change the SOLR_URL value with the preferred release version in the SOLR Dockerfile. Releases are available in https://archive.apache.org/dist/lucene/solr/.
SOLR can be accessed in [local-domain]:8983/solr/#/ ( e.g. http://192.168.99.100:8983/solr/#/ )
