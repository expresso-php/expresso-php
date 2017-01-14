# Expresso PHP

Express and simple docker setup for all your PHP development.

### Nginx + PHP 7

This branch is still on progress. For more stable, use the nginx branches.

What's included:

  - Nginx
  - PHP 7
  - Mariadb

Check the other branches of this repo for some more options.

### Official containers only
All of this is based on officials containers, so you won't download any
specific containers to use this project.

### Get started
All your Drupal files should be placed into the folder "web".

Run docker compose.
```sh
$ docker-compose up -d
```

Place your PHP files in the folder called web.

That's it!

### Drush (command line tool for Drupal)

Run drush
```sh
$  docker-compose run --rm php drush help
```

### Database credentials
This is for development !!

* User: drupal
* Password: drupal
* Database: drupal
