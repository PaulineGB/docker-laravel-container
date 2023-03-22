Docker Laravel Container

# What’s inside ?

- php 8
- apache
- postgis db

# To build this container

```
docker-compose up -d --build
```

# To create a Laravel project

```
cd php
docker-compose exec php-apache /bin/bash
```

This opens a CLI in the container and you can run the following command to create a Laravel project:

```
composer create-project laravel/laravel .
```

Then, you can navigate to http://localhost:8080/ which should display the Laravel Welcome page.
All the folders and files needed to run Laravel are stored in the src folder in of your application.