Chitter Challenge
=================

This twitter clone allows users to post messages to the public. 

User Stories
-------

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

```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* Peeps (posts to chitter) have the name of the maker and their user handle.


### Installation

```
$ git clone https://github.com/cbp10/chitter-challenge
$ cd chitter-challenge
$ bundle
```

Create a database called 'chitter', (and 'chitter_test', if testing)

Create the following tables, e.g. in PostgreSQL

```
CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR(150), time timestamptz, user_id INTEGER REFERENCES users (id));

CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(30), username VARCHAR(20), email VARCHAR(60), password VARCHAR(20));

```

### Run Chitter app

```
$ rackup
```
Go to localhost:9292

### Run Tests

```
$ rspec
```

### Technologies used

* Rspec and Capybara for testing
* Ruby and Sinatra for the application
* PostgreSQL for the database

