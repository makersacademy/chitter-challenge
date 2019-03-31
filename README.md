Chitter
=================

Description
-------
A simple Twitter clone using sinatra as the web server framework and PostgreSQL for data storage.

User Stories:
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

## Setting up Database for storing Bookmarks
1. `brew install postgresql`
2. `psql postgres`
3. `CREATE DATABASE "chitter";`
4. `CREATE TABLE posts(id SERIAL PRIMARY KEY, post VARCHAR(280), timestamp TIMESTAMPTZ default current_timestamp);`

## Setting up a test database
1. `psql postgres`
3. `CREATE DATABASE "chitter_test";`
4. `CREATE TABLE posts(id SERIAL PRIMARY KEY, post VARCHAR(280), timestamp TIMESTAMPTZ default current_timestamp);`

## How to run
