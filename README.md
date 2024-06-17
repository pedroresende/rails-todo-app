# Rails TODO APP

Welcome to the Rails To Do experience app

## Requirements

- docker (https://www.docker.com/community-edition#/download)
- docker-compose (https://docs.docker.com/compose/install/)

## Build the project

You can now boot the app with:

```
docker-compose up
```

Finally, you need to run the migration and run tailwind. In another terminal, run:

```
docker-compose run web bin/rails db:migrate
docker-compose run web bin/dev
```

That’s it. Your app should now be running on port 3000 on your Docker daemon

## Deploy

```
bundle exec rake assets:precompile
RAILS_ENV=production bundle exec puma
```

