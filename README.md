# docker-rails-boilerplate

Build the project

```
$ docker-compose run web rails new . --force --database=postgresql --skip-bundle

$ docker-compose build
```

## Connect the database

Replace the contents of config/database.yml with the following:

```
development: &default
  adapter: postgresql
  encoding: unicode
  database: myapp_development
  pool: 5
  username: postgres
  password:
  host: db

test:
  <<: *default
  database: myapp_test

```

You can now boot the app with:

```
docker-compose up
```
