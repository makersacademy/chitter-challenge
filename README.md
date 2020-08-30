Chitter Challenge
=================

## Task
-------

Writing a small Twitter clone that will allow users to post messages to a public stream.

Functionality:

* Users don't have to be logged in to see the peeps.
* Users sign up to chitter with their email, password, name and a username (e.g. yasminu@makersacademy.com, password123, Yasmin Underdown, yasminu).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

## User Stories
-------

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

### To set up the databases

Connect to `psql` and create the `chitter_manager` database:

```
CREATE DATABASE chitter_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.


## Approach
-------
1. Wrote feature test for first user story.
2. Passed this test in simplest way using params.
3. Wrote unit test for Peep class to return messages.
4. Created model and database to pass unit test
5. Wrote unit test for Peep class to create messages.
6. Passed test and linked Database + Model with Controller + Views to complete first user story.  

## Further Improvements
-------



## Tech Stack
-------

Ruby 2.6.5
Sinatra
HTML
RSpec
Capybara
Postgres
