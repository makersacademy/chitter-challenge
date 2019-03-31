## Challenge:

[![Build Status](https://travis-ci.org/micosmin/chitter-challenge.svg?branch=master)](https://travis-ci.org/micosmin/chitter-challenge)

Week 4 Makers Weekend challenge:

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

## Features:

```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

# Setting up

- fork repo
- bundle
- install postgresql
- run these commands to create the databases

```sql
-- log in the psql cli

\i path_to_01_create_chitter_db

-- connect to chitter db
\c chitter
\i path_to_02_create_peeps_table
\i path_to_03_create_users_table
\i path_to_04_create_chitter_test_db
\i path_to_06_create_tag_table_db
\i path_to_07_create_usertags_table_db
\c chitter_test
-- connect to chitter_test_db
-- repeate the creation of peeps and users inside the chitter_test database

```

# Run the app

- run app.rb
- rackup -p 4567
- localhost:4567

# Technologies used

- ruby
- rspec
- capybara
- sinatra
- postgresql
- html / css
