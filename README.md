# Chitter

A twitter clone for the week 4 end of unit exercise at Makers.

## Note

This code currently has an issue with logins. All unit and feature tests pass, but when trying it yourself, it will not let you log in.

To use the site currently, register and do not log out!

## Installation

```shell
bundle install
psql -c 'CREATE DATABASE chitter'
psql -c 'CREATE DATABASE chitter_test'
psql -d chitter -f database_setup.sql
psql -d chitter_test -f database_setup.sql
```

## Features

- Post a peep
- See all peeps in reverse chronological order
- See the post time on a peep
- Sign ups
- Log in (with issue noted above)
- Log out
- Peeps have the username and time attached
- Use of Sinatra ActiveRecord as an Object Relational Mapper
- Pretty CSS


## Missing features

- Username and email don't have to be unique
- Replies
- Email tags