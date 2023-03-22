# What’s inside ?

- php 8.1
- apache
- postgis db

# To build this container

```
docker-compose up -d
```

# To use in your Laravel project

This container run with an empty and simple Laravel base project and postgres db.
To use with your project, just copy and past your app in the * */src* * folder.
Don't forget to add a * *.env* * file with your datas.