# Chitter Challenge

Features:
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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Peeps contain the time and date of when they were posted.
* You can register, log in, and log out. 

Technologies Used:
-----
- Capybara
- Sinatra (and Sinatra-Flash)
- postgresql
- PG
- BCrypt for password encryption

To run tests: 
------
- Run 'bundle install'
- Run the following commands in postgresql:

```
  'CREATE DATABASE chitter_test;'
  '\c chitter_test'
  'CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(280), time VARCHAR(60));'
  'CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140), name VARCHAR(60), username VARCHAR(60));'
```
- Run rspec

To run site: 
------
- Run 'bundle install' if not already done.
- Run the following commands in postgresql:

```
  'CREATE DATABASE chitter;'
  '\c chitter'
  'CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(280), time VARCHAR(60));'
  'CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140), name VARCHAR(60), username VARCHAR(60));'
```
- Run 'rackup'
- Navigate in browser to 'localhost:9292/'
