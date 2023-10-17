# Docker-rails-boilerplate

## Requirements

- docker (https://www.docker.com/community-edition#/download)
- docker-compose (https://docs.docker.com/compose/install/)

## Build the project

```
$ docker-compose run web rails new . --force --database=postgresql --skip-bundle

$ docker-compose build
```

## Connect the database

Replace the contents of config/database.yml with the following:

```
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # https://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: rails
  password: rails
  host: db

test:
  <<: *default
  database: rails

```

You can now boot the app with:

```
docker-compose up
```

Finally, you need to create the database. In another terminal, run:

```
docker-compose run web rake db:create
```

That’s it. Your app should now be running on port 3000 on your Docker daemon
