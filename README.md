# :bird: Chitter Challenge :bird:

[![Build Status](https://travis-ci.com/petraartep/chitter-challenge.svg?branch=master)](https://travis-ci.com/petraartep/chitter-challenge)

This a small Twitter clone that will allow the users to post messages to a public stream.

---

## Technologies used
- Ruby 
- Sinatra
- Capybara
- Data Mapper
- Postgresql 

---

## User Stories

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

---

## Functionality

- You don't have to be logged in to see the peeps.
- Makers can sign up to chitter with their email, password, name and a username (e.g. johndoe@gmail.com, password123, John Doe, johndoe).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.


---

## Challenges


- STILL IN PROGRESS
  - creating functionalities (sign up, sign in)
  - adding timestamp on the peeps
  - displaying in reverse chronological order
- Wrapping database data in program objects
- Using an Object Relational Mapper as the database interface


## How to use

### To set up the project

Clone this repository and then run:

```
bundle
```

### To set up the database

Connect to `psql` and create the `chitter_db` and `chitter_db_test` databases:

```
CREATE DATABASE chitter_db;
CREATE DATABASE chitter_db_test;
```

To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.


### To run the Chitter app:

```
rackup
```
To view bookmarks, navigate to `localhost:9292`.


### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```

---