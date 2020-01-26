Chitter Challenge
=================

Usage:

- Clone this Repo
- Create The database, In the command line run the following commmand:
```
  psql -c 'create database bitter;' -U postgres
  psql -d bitter -f db/migrations/01_create_beets_table.sql -U postgres
  psql -d bitter -f db/migrations/02_create_user_table.sql -U postgres
```

Start the server by running `rackup` in the command line
Sign Up and Start beeting!

Alternatively try the [deployed version!](https://bitter2020.herokuapp.com/)
