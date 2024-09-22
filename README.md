# postgres-db-initializer-docker

In order to initialize the db, please follow this steps:

- set the following env variables into the .env.db file:
  - COMPOSE_PROJECT_NAME=the_docker_containers_name_you_want (my_project)
  - POSTGRES_USER=the_admin_user_name (ex: my_username)
  - POSTGRES_PASSWORD=the_admin_user_password (ex: my_password)
  - DATABASE_NAME=the_database_name (ex: my_project)
  - DATABASE_USERNAME=the_user_name (ex: my_username)
  - DATABASE_PASSWORD=the_user_password (ex: my_password)
  - DATABASE_PORT=the_database_port (ex: 5451, try to set a port that will not conflict with other ports especially the default 5432 otherwise you could not run them simultaneously)
- run this command: `docker compose --env-file ./.env.db build && docker compose --env-file ./.env.db up -d` (here we first build the images, then inject the env file by its path to run the containers)
- Or run this command for Windows: `docker compose --env-file ./.env.db build \ docker compose --env-file ./.env.db up -d`
- wait a minute during the initialization of the db

You're done!
