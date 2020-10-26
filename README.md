# Chitter

A twitter clone for the week 4 end of unit exercise at Makers.

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
- Log in
- Log out
- Peeps have the username and time attached
- Use of Sinatra ActiveRecord as an Object Relational Mapper
- Pretty CSS


## Missing features

- Username and email don't have to be unique
- Replies
- Email tags