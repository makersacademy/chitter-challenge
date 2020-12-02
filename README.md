# Chitter

A twitter clone for the week 4 end of unit exercise at Makers.

![Chitter screenshot](https://i.imgur.com/Y5hsAcx.png)

## Installation

```shell
git clone https://github.com/dan-holmes/chitter-challenge.git
export username=[your username]
bundle install
psql -c 'CREATE DATABASE chitter'
psql -c 'CREATE DATABASE chitter_test'
psql -d chitter -f database_setup.sql
psql -d chitter_test -f database_setup.sql
rackup
```

## Technology

 - Ruby
 - Sinatra
 - Active Record
 - BCrypt
 - Capybara
 - Rake

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
