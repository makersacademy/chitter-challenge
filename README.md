# Chitter Challenge

A twitter clone application.

## Tech Stack:

- Ruby (Sinatra)
- ActiveRecords
- bcrypt
- erb
- SASS

## Instructions

First install all gems and dependencies:

```zsh
bundle install
```

To build the database on your local machine:

```zsh
rake db:create
```

To populate the database with data:

```zsh
rake db:seed

rake db:seed RACK_ENV="test"
```

This will populate the database with fake data using [faker](https://github.com/faker-ruby/faker)

## Testing

All tests pass and i was able to implement automatic database cleaning with [database-cleaner](https://github.com/DatabaseCleaner/database_cleaner) however i was unable to re-seed the databse with each clean.
