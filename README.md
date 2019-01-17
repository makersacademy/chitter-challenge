[![Build Status](https://travis-ci.com/runticle/chitter-challenge.svg?branch=master)](https://travis-ci.com/runticle/chitter-challenge)

# Chitter #

This is a Ruby twitter app using Sinatra and a Postgres database. Users can 'cheet' anonymously, or register and sign in/out. Cheets are stored in a postgres database, as are users.

'peep' and 'cheet' is used interchangably in this README!

## Setup ##

- Clone this repo
- Run the following commands in the root folder to install dependancies and setup Postgres databases
```
  bundle
  psql -c 'create database chitter_database;' -U postgres
  psql -d chitter_database -a -f db/migrations/02_create_cheets_table.sql
  psql -d chitter_database -a -f db/migrations/03_create_users_table.sql
  
  psql -c 'create database chitter_database_test;' -U postgres
  psql -d chitter_database_test -a -f db/migrations/02_create_cheets_table.sql
  psql -d chitter_database_test -a -f db/migrations/03_create_users_table.sql
```

- Run the server ``` rackup ```
- Open ``` localhost:9292 ``` in your browser

### User Stories ###

```
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
# Issues 
- One test failing on travis, commented out in code. Testing for having too many characters in a cheet, Travis fails with the error that is expected to happen. Need a guard clause.

# Screenshots #

![Image of HomePage](/images/home_page.png)

![Image of Register](/images/register.png)

![Image of Profile](/images/profile_logged_in.png)
